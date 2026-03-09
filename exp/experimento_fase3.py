"""
Fase 3: Analisis de Explosion de Treewidth y Densificacion Proposicional (Proposicion 7.1).

Somete a verificacion empirica las predicciones teoricas:
  - Eq. 17: |vars| = sum(b_k') para un factor de base N
  - Sec. 7.2: T_compile = O(|phi| * 2^tw(phi))

Experimento A: Barrido de cardinalidad N (1 factor multivaluado)
  Dominio "Ruleta de N Caras": color(X), base N, transiciones uniformes.

Experimento B: Multi-factor vs Mono-factor (mismo |S|)
  Compara 1 factor base N^2 vs 2 factores base N.

Arquitectura:
  - Monkey-patching de Engine para timing granular (sin modificar framework)
  - Aislamiento por subproceso (multiprocessing) contra OOM/timeout
  - Extraccion defensiva de metricas d-DNNF
  - Escritura incremental de CSV (flush por fila)
"""

import sys
import time
import math
import csv
import io
import multiprocessing as mp


# ---------------------------------------------------------------------------
# Generacion programatica de modelos ProbLog
# ---------------------------------------------------------------------------

def generate_roulette(N):
    """Genera modelo ProbLog de ruleta de N caras (1 factor, base N)."""
    values = [f"c{i}" for i in range(1, N + 1)]
    lines = []

    # AD de valores
    ad_parts = "; ".join(f"1/{N}::c_values({v})" for v in values)
    lines.append(f"{ad_parts}.")
    lines.append("")

    # Declaracion del fluente
    lines.append("state_fluent(color(X), multivalued) :- c_values(X).")
    lines.append("")

    # Accion
    lines.append("action(spin).")
    lines.append("")

    # Utilidad minima
    lines.append("utility(cost, -1).")
    lines.append("cost.")
    lines.append("")

    # Transiciones: N reglas de N cabezas (uniforme)
    heads = "; ".join(f"1/{N}::color({v}, 1)" for v in values)
    for src in values:
        lines.append(f"{heads} :- color({src}, 0), spin.")

    return "\n".join(lines)


def generate_two_roulettes(N):
    """Genera modelo ProbLog con 2 factores independientes de base N."""
    c_values = [f"c{i}" for i in range(1, N + 1)]
    f_values = [f"f{i}" for i in range(1, N + 1)]
    lines = []

    # ADs de valores
    ad_c = "; ".join(f"1/{N}::c_values({v})" for v in c_values)
    ad_f = "; ".join(f"1/{N}::f_values({v})" for v in f_values)
    lines.append(f"{ad_c}.")
    lines.append(f"{ad_f}.")
    lines.append("")

    # Declaraciones de fluentes
    lines.append("state_fluent(color(X), multivalued) :- c_values(X).")
    lines.append("state_fluent(forma(Y), multivalued) :- f_values(Y).")
    lines.append("")

    # Accion
    lines.append("action(spin).")
    lines.append("")

    # Utilidad minima
    lines.append("utility(cost, -1).")
    lines.append("cost.")
    lines.append("")

    # Transiciones de color (N reglas, independientes)
    c_heads = "; ".join(f"1/{N}::color({v}, 1)" for v in c_values)
    for src in c_values:
        lines.append(f"{c_heads} :- color({src}, 0), spin.")

    lines.append("")

    # Transiciones de forma (N reglas, independientes)
    f_heads = "; ".join(f"1/{N}::forma({v}, 1)" for v in f_values)
    for src in f_values:
        lines.append(f"{f_heads} :- forma({src}, 0), spin.")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Extraccion defensiva de metricas d-DNNF
# ---------------------------------------------------------------------------

def extract_ddnnf_metrics(engine):
    """Extraccion defensiva de metricas del circuito compilado."""
    metrics = {
        'gp_atoms': None,
        'ddnnf_nodes': None,
        'ddnnf_edges': None,
        'ddnnf_atom_count': None,
    }

    # Metricas del ground program (seguro)
    try:
        metrics['gp_atoms'] = engine._gp.atomcount
    except AttributeError:
        pass

    # Metricas del circuito compilado (defensivo)
    knowledge = engine._knowledge
    if knowledge is None:
        return metrics

    # atomcount (API publica en algunos backends)
    try:
        metrics['ddnnf_atom_count'] = knowledge.atomcount
    except AttributeError:
        pass

    # Conteo de nodos via _nodes (d-DNNF backend)
    try:
        nodes = knowledge._nodes
        metrics['ddnnf_nodes'] = len(nodes)

        edges = 0
        for node in nodes:
            if hasattr(node, 'children'):
                edges += len(node.children)
        metrics['ddnnf_edges'] = edges
    except (AttributeError, TypeError):
        # Backend SDD u otro — fallback a to_dot()
        try:
            dot_str = knowledge.to_dot()
            metrics['ddnnf_nodes'] = dot_str.count('[label=')
            metrics['ddnnf_edges'] = dot_str.count('->')
        except (AttributeError, TypeError):
            pass

    return metrics


# ---------------------------------------------------------------------------
# Trial execution (runs inside subprocess)
# ---------------------------------------------------------------------------

def run_single_trial(model_str):
    """Ejecuta un trial completo: monkey-patch, MDP(), metricas, unpatch."""
    from src.engine import Engine
    from src.mdp import MDP

    # Guardar metodos originales
    orig_ground = Engine.relevant_ground
    orig_compile = Engine.compile
    timings = {}

    # Monkey-patch con timing
    def timed_ground(self, queries):
        t0 = time.perf_counter()
        result = orig_ground(self, queries)
        timings['t_ground'] = time.perf_counter() - t0
        return result

    def timed_compile(self, terms=[]):
        t0 = time.perf_counter()
        result = orig_compile(self, terms)
        timings['t_compile'] = time.perf_counter() - t0
        return result

    Engine.relevant_ground = timed_ground
    Engine.compile = timed_compile

    # Suprimir prints del FluentClassifier y MDP.__prepare__
    old_stdout = sys.stdout
    sys.stdout = io.StringIO()

    try:
        t0 = time.perf_counter()
        mdp = MDP(model_str, epsilon_thr=0.0)
        t_total = time.perf_counter() - t0
    finally:
        sys.stdout = old_stdout
        Engine.relevant_ground = orig_ground
        Engine.compile = orig_compile

    metrics = extract_ddnnf_metrics(mdp._engine)
    metrics['t_ground'] = timings.get('t_ground')
    metrics['t_compile'] = timings.get('t_compile')
    metrics['t_total'] = t_total
    metrics['status'] = 'OK'

    return metrics


def _trial_worker(model_str, result_queue):
    """Worker para subproceso aislado."""
    try:
        metrics = run_single_trial(model_str)
        result_queue.put(('ok', metrics))
    except Exception as e:
        result_queue.put(('error', str(e)))


def run_trial_safe(model_str, timeout=120):
    """Ejecuta trial en subproceso aislado con timeout y deteccion OOM."""
    queue = mp.Queue()
    proc = mp.Process(target=_trial_worker, args=(model_str, queue))
    proc.start()
    proc.join(timeout=timeout)

    if proc.is_alive():
        proc.terminate()
        proc.join(timeout=5)
        if proc.is_alive():
            proc.kill()
            proc.join()
        return {'status': 'TIMEOUT'}

    if proc.exitcode != 0:
        signal_num = -proc.exitcode if proc.exitcode < 0 else proc.exitcode
        return {'status': f'OOM/KILLED (signal={signal_num})'}

    if not queue.empty():
        status, data = queue.get_nowait()
        if status == 'ok':
            return data
        else:
            return {'status': f'ERROR: {data}'}

    return {'status': 'UNKNOWN'}


# ---------------------------------------------------------------------------
# Barrido parametrico
# ---------------------------------------------------------------------------

def run_sweep(N_values, generator_fn, label, repetitions=3, timeout=120):
    """Barrido parametrico sobre N. Retorna lista de resultados."""
    print(f"\n{'=' * 80}")
    print(f" {label}")
    print(f" N values: {N_values}")
    print(f" Repetitions: {repetitions}, Timeout: {timeout}s")
    print(f"{'=' * 80}")

    results = []

    for N in N_values:
        model_str = generator_fn(N)
        trial_metrics = []

        for rep in range(repetitions):
            metrics = run_trial_safe(model_str, timeout=timeout)

            if metrics.get('status') != 'OK':
                print(f"  [N={N:>4}, rep={rep+1}] {metrics.get('status', 'FAILED')}")
                break
            else:
                trial_metrics.append(metrics)

        if not trial_metrics:
            # Todas las repeticiones fallaron
            results.append({
                'N': N,
                'status': metrics.get('status', 'FAILED'),
            })
            print(f"  [N={N:>4}] ABORTADO: {metrics.get('status')}")

            # Si fue OOM/TIMEOUT, no intentar N mayores
            if 'OOM' in str(metrics.get('status', '')) or 'TIMEOUT' in str(metrics.get('status', '')):
                print(f"  [N>{N}] Saltando N restantes (limite alcanzado)")
                for N_skip in N_values[N_values.index(N) + 1:]:
                    results.append({'N': N_skip, 'status': 'SKIPPED'})
                break
            continue

        # Tomar mediana de las repeticiones
        median_idx = len(trial_metrics) // 2
        sorted_by_total = sorted(trial_metrics, key=lambda m: m.get('t_total', float('inf')))
        best = sorted_by_total[median_idx]
        best['N'] = N
        results.append(best)

        t_c = best.get('t_compile', 0) or 0
        t_g = best.get('t_ground', 0) or 0
        t_t = best.get('t_total', 0) or 0
        gpa = best.get('gp_atoms', '?')
        nds = best.get('ddnnf_nodes', '?')
        print(f"  [N={N:>4}] t_compile={t_c:.3f}s  t_ground={t_g:.3f}s  "
              f"t_total={t_t:.3f}s  gp_atoms={gpa}  nodes={nds}")

    return results


# ---------------------------------------------------------------------------
# Analisis de escalado
# ---------------------------------------------------------------------------

def compute_scaling_exponents(results):
    """Computa exponentes de escalado (pendientes log-log) entre puntos consecutivos."""
    valid = [r for r in results if r.get('status') == 'OK' and r.get('t_compile')]
    for i in range(1, len(valid)):
        N1, N2 = valid[i - 1]['N'], valid[i]['N']

        for key in ('t_compile', 't_ground', 't_total', 'gp_atoms', 'ddnnf_nodes', 'ddnnf_edges'):
            v1 = valid[i - 1].get(key)
            v2 = valid[i].get(key)
            if v1 and v2 and v1 > 0 and v2 > 0 and N1 != N2:
                alpha = math.log(v2 / v1) / math.log(N2 / N1)
                valid[i][f'alpha_{key}'] = alpha


# ---------------------------------------------------------------------------
# Salida formateada
# ---------------------------------------------------------------------------

def print_results_table(results, title):
    """Tabla ASCII formateada."""
    print(f"\n{'=' * 100}")
    print(f" {title}")
    print(f"{'=' * 100}")

    header = (f"{'N':>5} | {'|S|':>6} | {'gp_atoms':>10} | {'ddnnf_nds':>10} | "
              f"{'ddnnf_edg':>10} | {'t_ground':>10} | {'t_compile':>11} | "
              f"{'t_total':>10} | {'alpha':>6}")
    print(header)
    print("-" * 100)

    for r in results:
        N = r.get('N', '?')
        status = r.get('status', 'FAILED')

        if status != 'OK':
            print(f"{N:>5} | {'':>6} | {'':>10} | {'':>10} | "
                  f"{'':>10} | {'':>10} | {'':>11} | "
                  f"{'':>10} | {status}")
            continue

        S = N  # Single factor: |S| = N
        gpa = r.get('gp_atoms', '-')
        nds = r.get('ddnnf_nodes', '-')
        edg = r.get('ddnnf_edges', '-')
        tg = r.get('t_ground', 0)
        tc = r.get('t_compile', 0)
        tt = r.get('t_total', 0)
        alpha = r.get('alpha_t_compile')

        gpa_s = f"{gpa:>10}" if isinstance(gpa, int) else f"{'?':>10}"
        nds_s = f"{nds:>10}" if isinstance(nds, int) else f"{'?':>10}"
        edg_s = f"{edg:>10}" if isinstance(edg, int) else f"{'?':>10}"
        tg_s = f"{tg:>10.4f}" if tg else f"{'?':>10}"
        tc_s = f"{tc:>11.4f}" if tc else f"{'?':>11}"
        tt_s = f"{tt:>10.4f}" if tt else f"{'?':>10}"
        al_s = f"{alpha:>6.2f}" if alpha else f"{'--':>6}"

        print(f"{N:>5} | {S:>6} | {gpa_s} | {nds_s} | "
              f"{edg_s} | {tg_s} | {tc_s} | "
              f"{tt_s} | {al_s}")


def print_comparison_table(mono_results, bi_results):
    """Tabla de comparacion mono-factor vs bi-factor."""
    print(f"\n{'=' * 90}")
    print(" Experimento B: Comparacion Mono-Factor vs Bi-Factor")
    print(f"{'=' * 90}")

    header = (f"{'Config':>12} | {'|S|':>6} | {'gp_atoms':>10} | {'ddnnf_nds':>10} | "
              f"{'t_compile':>11} | {'t_total':>10} | {'speedup':>8}")
    print(header)
    print("-" * 90)

    # Emparejar por |S| aproximado
    mono_by_n = {r['N']: r for r in mono_results if r.get('status') == 'OK'}
    bi_by_n = {r['N']: r for r in bi_results if r.get('status') == 'OK'}

    pairs = []
    for N_bi, r_bi in sorted(bi_by_n.items()):
        S_bi = N_bi * N_bi  # 2 factores de base N -> |S| = N^2
        # Buscar mono con N_mono = N_bi^2 o cercano
        N_mono = N_bi * N_bi
        if N_mono in mono_by_n:
            pairs.append((N_mono, mono_by_n[N_mono], N_bi, r_bi))

    for N_mono, r_mono, N_bi, r_bi in pairs:
        S = N_mono  # = N_bi^2

        # Mono
        tc_m = r_mono.get('t_compile', 0) or 0
        tt_m = r_mono.get('t_total', 0) or 0
        gpa_m = r_mono.get('gp_atoms', '?')
        nds_m = r_mono.get('ddnnf_nodes', '?')

        print(f"{'Mono-' + str(N_mono):>12} | {S:>6} | {gpa_m:>10} | {nds_m:>10} | "
              f"{tc_m:>11.4f} | {tt_m:>10.4f} | {'1.0x':>8}")

        # Bi
        tc_b = r_bi.get('t_compile', 0) or 0
        tt_b = r_bi.get('t_total', 0) or 0
        gpa_b = r_bi.get('gp_atoms', '?')
        nds_b = r_bi.get('ddnnf_nodes', '?')
        speedup = f"{tc_m / tc_b:.1f}x" if tc_b > 0 else "?"

        print(f"{'Bi-' + str(N_bi):>12} | {S:>6} | {gpa_b:>10} | {nds_b:>10} | "
              f"{tc_b:>11.4f} | {tt_b:>10.4f} | {speedup:>8}")
        print("-" * 90)


def export_csv(results, filename):
    """Exporta resultados a CSV con flush incremental."""
    keys = ['N', 'status', 'gp_atoms', 'ddnnf_nodes', 'ddnnf_edges',
            'ddnnf_atom_count', 't_ground', 't_compile', 't_total',
            'alpha_t_compile', 'alpha_gp_atoms', 'alpha_ddnnf_nodes']

    with open(filename, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=keys, extrasaction='ignore')
        writer.writeheader()
        for r in results:
            writer.writerow(r)
            f.flush()

    print(f"  CSV exportado: {filename}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    print("=" * 80)
    print(" Fase 3: Analisis de Explosion de Treewidth (Proposicion 7.1)")
    print("=" * 80)

    timeout = 120
    reps = 3

    # === Experimento A: Barrido de cardinalidad (1 factor) ===
    N_values_A = [2, 3, 5, 8, 10, 15, 20, 30, 40, 50, 75, 100, 125]

    results_A = run_sweep(
        N_values_A, generate_roulette,
        "Experimento A: Barrido de Cardinalidad (1 Factor Multivaluado)",
        repetitions=reps, timeout=timeout
    )
    compute_scaling_exponents(results_A)
    print_results_table(results_A, "Resultados Experimento A: Ruleta de N Caras")
    export_csv(results_A, "fase3_experimento_A.csv")

    # Resumen de hallazgos Exp A
    valid_A = [r for r in results_A if r.get('status') == 'OK']
    if len(valid_A) >= 2:
        last = valid_A[-1]
        print(f"\n  Hallazgos clave:")
        tg = last.get('t_ground', 0) or 0.001
        tc = last.get('t_compile', 0) or 0.001
        print(f"    N_max alcanzado: {last['N']}")
        print(f"    Ratio t_compile/t_ground en N={last['N']}: {tc/tg:.1f}x")
        if last.get('alpha_t_compile'):
            print(f"    Exponente de escalado (t_compile): {last['alpha_t_compile']:.2f}")

    # === Experimento B: Multi-factor vs Mono-factor ===
    # Bi-factor con N in {3,4,5,10} -> |S| = {9,16,25,100}
    # Necesitamos mono-factor con N in {9,16,25,100} para comparar
    N_values_mono_B = [9, 16, 25, 100]
    N_values_bi_B = [3, 4, 5, 10]

    results_mono_B = run_sweep(
        N_values_mono_B, generate_roulette,
        "Experimento B-Mono: Mono-Factor (referencia)",
        repetitions=reps, timeout=timeout
    )

    results_bi_B = run_sweep(
        N_values_bi_B, generate_two_roulettes,
        "Experimento B-Bi: Bi-Factor (2 factores independientes)",
        repetitions=reps, timeout=timeout
    )

    print_comparison_table(results_mono_B, results_bi_B)
    export_csv(results_mono_B, "fase3_experimento_B_mono.csv")
    export_csv(results_bi_B, "fase3_experimento_B_bi.csv")

    # === Resumen Final ===
    print(f"\n{'=' * 80}")
    print(" RESUMEN FASE 3")
    print(f"{'=' * 80}")

    max_ok_A = max((r['N'] for r in results_A if r.get('status') == 'OK'), default=0)
    print(f"  Exp A: Cardinalidad maxima alcanzada (< {timeout}s): N = {max_ok_A}")

    failed_A = [r for r in results_A if r.get('status') != 'OK']
    if failed_A:
        print(f"  Exp A: Primer fallo en N = {failed_A[0]['N']} ({failed_A[0].get('status')})")

    # Verificar dominancia de compilacion
    for r in valid_A:
        tg = r.get('t_ground', 0) or 0.001
        tc = r.get('t_compile', 0) or 0.001
        if r['N'] >= 30 and tc / tg < 2.0:
            print(f"  [NOTA] N={r['N']}: t_compile/t_ground = {tc/tg:.1f}x "
                  f"(compilacion NO domina como esperado)")

    print(f"{'=' * 80}")


if __name__ == "__main__":
    main()
