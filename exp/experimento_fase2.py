"""
Fase 2: Cuantificación Empírica del Sesgo de Truncamiento (Teorema 6.2).

Somete a verificación empírica la cota:
    ||V* - Ṽ*||∞ ≤ γ · δ_max · R_max / (1-γ)²

Protocolo de triple validación:
  CAPA 1: Auditoría de masa (MDPAuditor) — integridad estocástica
  CAPA 2: VI exacta (epsilon_thr=0) — línea base de comportamiento
  CAPA 3: Barrido paramétrico — cuantificación del sesgo

Arquitectura de cache: la auditoría prima __transition_cache con
transiciones crudas. Todas las corridas posteriores (exacta y
aproximadas) operan con cache hits al 100%.
"""

import sys
import time
from src.mdp import MDP
from src.auditor import MDPAuditor
from src.value_iteration import ValueIteration
from src.fluent import StateSpace, ActionSpace


def load_model(path):
    with open(path, 'r') as f:
        return f.read()


def compute_delta_max(mdp, states, actions, epsilon_thr):
    """
    Computa δ_max: la masa máxima descartada por el filtro disperso
    para cualquier par (s, a), considerando todos los factores.

    Para booleanos: masa descartada si p_true o p_false ≤ ε
    Para multivaluados: suma de p para términos con 0 < p ≤ ε
    """
    max_delta = 0.0

    for i in range(len(states)):
        state = states[i]
        for j in range(len(actions)):
            action = actions[j]

            raw = mdp.transition(state, action, cache=(i, j))
            prob_map = {str(t): p for t, p in raw}

            discarded = 0.0
            for k, factor in enumerate(mdp._next_state_factors):
                if len(factor) == 1:
                    p_true = prob_map.get(str(factor[0]), 0.0)
                    p_false = 1.0 - p_true
                    if p_false > 0 and p_false <= epsilon_thr:
                        discarded += p_false
                    if p_true > 0 and p_true <= epsilon_thr:
                        discarded += p_true
                else:
                    for term in factor:
                        p = prob_map.get(str(term), 0.0)
                        if 0 < p <= epsilon_thr:
                            discarded += p

            max_delta = max(max_delta, discarded)

    return max_delta


def chebyshev_distance(V_exact, V_approx):
    """||V* - Ṽ*||∞ — distancia de Chebyshev (norma infinito)."""
    max_diff = 0.0
    for state_key in V_exact:
        diff = abs(V_exact[state_key] - V_approx.get(state_key, 0.0))
        max_diff = max(max_diff, diff)
    return max_diff


def get_R_max(mdp):
    """Extrae R_max = max_{s,a} |R(s,a)| de las utilidades del modelo."""
    max_r = 0.0
    for term, value in mdp._MDP__utilities.items():
        max_r = max(max_r, abs(value.value))
    return max_r


def run_experiment(model_path, gamma=0.9, epsilon_vi=1e-10):
    print("=" * 72)
    print(" Fase 2: Cuantificación del Sesgo de Truncamiento")
    print(f" Modelo: {model_path}")
    print(f" γ = {gamma},  ε_VI = {epsilon_vi:.0e}")
    print("=" * 72)

    # --- Inicialización ---
    print("\n[INIT] Cargando modelo y compilando circuito WMC...")
    mdp = MDP(load_model(model_path), epsilon_thr=0.0)

    states = StateSpace(mdp.state_schema)
    actions = ActionSpace(mdp.actions())
    R_max = get_R_max(mdp)

    total_states = len(states)
    total_actions = len(actions)
    total_pairs = total_states * total_actions

    print(f"       Estados: {total_states}")
    print(f"       Acciones: {total_actions}")
    print(f"       Pares (s,a): {total_pairs}")
    print(f"       R_max: {R_max}")

    # === CAPA 1: Auditoría de Masa ===
    print("\n" + "=" * 72)
    print(" CAPA 1: Auditoría de Conservación de Masa")
    print("=" * 72)

    auditor = MDPAuditor(mdp)
    t0 = time.perf_counter()
    violations = auditor.audit_mass_conservation(tolerance=1e-9)
    t_audit = time.perf_counter() - t0

    if violations:
        print(auditor.format_report(violations))
        print(f"\n[FALLO] {len(violations)} violación(es). Abortando experimento.")
        sys.exit(1)

    print(f"[ÉXITO] {total_pairs}/{total_pairs} transiciones conservan masa.")
    print(f"        Cache primada en {t_audit:.3f}s")

    # === CAPA 2: VI Exacta (epsilon_thr = 0.0) ===
    print("\n" + "=" * 72)
    print(" CAPA 2: Value Iteration Exacta (ε_thr = 0.0)")
    print("=" * 72)

    vi = ValueIteration(mdp)
    t0 = time.perf_counter()
    V_exact, policy_exact, _, _, iterations_exact = vi.run(
        gamma=gamma, epsilon=epsilon_vi, audit=False
    )
    t_exact = time.perf_counter() - t0

    print(f"[ÉXITO] Convergencia en {iterations_exact} iteraciones ({t_exact:.3f}s)")
    print(f"        Política exacta (muestra):")
    count = 0
    for state_key, action in policy_exact.items():
        state_str = ', '.join(f"{f}={v}" for f, v in state_key)
        print(f"          π*({state_str}) = {action}")
        count += 1
        if count >= 5:
            print(f"          ... ({len(policy_exact) - 5} más)")
            break

    # === CAPA 3: Barrido Paramétrico ===
    print("\n" + "=" * 72)
    print(" CAPA 3: Barrido Paramétrico del Filtro Disperso")
    print("=" * 72)

    thresholds = [1e-2, 1e-3, 1e-4, 1e-5, 1e-6]

    # Tabla header
    print(f"\n{'ε_thr':>10} | {'δ_max':>12} | {'||V*-Ṽ*||∞':>12} | "
          f"{'Cota T6.2':>12} | {'Cumple':>6} | {'Iter':>4}")
    print("-" * 72)

    all_passed = True
    results = []

    for eps_thr in thresholds:
        mdp.epsilon_thr = eps_thr

        vi_approx = ValueIteration(mdp)
        V_approx, _, _, _, iterations_approx = vi_approx.run(
            gamma=gamma, epsilon=epsilon_vi, audit=False
        )

        delta_max = compute_delta_max(mdp, states, actions, eps_thr)
        error = chebyshev_distance(V_exact, V_approx)
        bound = gamma * delta_max * R_max / ((1 - gamma) ** 2)
        passed = error <= bound + 1e-15  # margen IEEE 754

        status = "✓" if passed else "✗"
        if not passed:
            all_passed = False

        print(f"{eps_thr:>10.0e} | {delta_max:>12.2e} | {error:>12.2e} | "
              f"{bound:>12.2e} | {status:>6} | {iterations_approx:>4}")

        results.append({
            'epsilon_thr': eps_thr,
            'delta_max': delta_max,
            'error': error,
            'bound': bound,
            'passed': passed,
            'iterations': iterations_approx,
        })

    # === Resumen ===
    print("\n" + "=" * 72)
    if all_passed:
        print(" [ÉXITO] La cota del Teorema 6.2 se satisface para TODOS los umbrales.")
        print(f"         γ·δ_max·R_max/(1-γ)² ≥ ||V*-Ṽ*||∞  ∀ε_thr ∈ {thresholds}")
    else:
        print(" [FALLO] La cota del Teorema 6.2 fue violada en al menos un umbral.")
        for r in results:
            if not r['passed']:
                print(f"         ε_thr={r['epsilon_thr']:.0e}: "
                      f"error={r['error']:.2e} > cota={r['bound']:.2e}")
    print("=" * 72)

    return results


if __name__ == "__main__":
    model = sys.argv[1] if len(sys.argv) > 1 else \
        "tests/model_tests/rn_gridworld/rn_gridworld_hurricane.pl"

    gamma = float(sys.argv[2]) if len(sys.argv) > 2 else 0.9
    run_experiment(model, gamma=gamma)
