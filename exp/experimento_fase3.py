"""
Experimento Fase 3: Explosión de Treewidth y Densificación Proposicional
=========================================================================

Valida empíricamente la Proposición 7.1 y la Sección 7.2 de:
  docs/validacion_matematica_fluentes_multivaluados.md

── Qué se comprueba ────────────────────────────────────────────────────────

  Proposición 7.1 (Ec. 17):
      |vars| = Σ b_k'   donde b_k' = 1 (bool) o N (multivaluado)
      → gp_atoms debe crecer ~linealmente con N (α ≈ 1.0)

  Sección 7.2 (Complejidad de compilación):
      T_compile = O(|φ| · 2^tw(φ))
      → t_compile debe crecer super-polinomialmente con N (α >> 1, creciente)
      → circuit_nodes crece como O(N²) o más (α ≈ 2 o mayor)

── Experimentos ────────────────────────────────────────────────────────────

  A — Barrido de cardinalidad (1 factor multivaluado):
      Dominio "Ruleta de N Caras". Verifica Prop 7.1 y Sec 7.2 directamente.

  B — Mono-factor vs Bi-factor (mismo |S|):
      Compara 1 factor de base N² vs 2 factores de base N con |S| = N².
      La factorización debería reducir el treewidth efectivo: si el bi-factor
      compila más rápido con el mismo |S|, el treewidth es el factor limitante,
      no el tamaño del espacio de estados.

── Filosofía ───────────────────────────────────────────────────────────────

  Mismo patrón que orquestador.py:
    - Skip-if-exists por CSV (reanuda tras interrupción)
    - Aislamiento por subproceso con timeout y detección de OOM
    - Exportación CSV incremental
    - CLI con argparse

  Sin monkey-patching: MDP.timings ya expone t_ground y t_compile.

── Uso ─────────────────────────────────────────────────────────────────────

  python exp/experimento_fase3.py --exp A
  python exp/experimento_fase3.py --exp A B --timeout 300 --runs 5
  python exp/experimento_fase3.py --exp A --N_values 2 5 10 20 50
  python exp/experimento_fase3.py --exp B --N_bi 3 4 5 10
  python exp/experimento_fase3.py --exp A --compilers ddnnf sdd
"""

import os
import sys
import io
import time
import math
import argparse
import multiprocessing

import pandas as pd

project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, project_root)

from src.mdp import MDP


# ---------------------------------------------------------------------------
# Generadores de modelos ProbLog
# ---------------------------------------------------------------------------

def generate_roulette(N):
    """Ruleta de N caras: 1 factor multivaluado de base N, 1 acción.

    Este es el dominio mínimo para aislar el impacto de la cardinalidad del
    fluente sobre el circuito compilado. Cada 'giro' produce cualquier color
    con probabilidad uniforme 1/N (transición totalmente entrópica).
    """
    values = [f"c{i}" for i in range(1, N + 1)]
    lines = []

    ad_parts = "; ".join(f"1/{N}::c_values({v})" for v in values)
    lines.append(f"{ad_parts}.")
    lines.append("")
    lines.append("state_fluent(color(X), multivalued) :- c_values(X).")
    lines.append("")
    lines.append("action(spin).")
    lines.append("")
    lines.append("utility(cost, -1).")
    lines.append("cost.")
    lines.append("")

    heads = "; ".join(f"1/{N}::color({v}, 1)" for v in values)
    for src in values:
        lines.append(f"{heads} :- color({src}, 0), spin.")

    return "\n".join(lines)


def generate_two_roulettes(N):
    """Dos ruletas independientes de base N: 2 factores, |S| = N².

    Usado en Exp B para comparar con mono-factor de base N².
    La independencia de los dos fluentes debería reducir el treewidth efectivo
    respecto a un único fluente de base N² con las mismas N² ruedas.
    """
    c_values = [f"c{i}" for i in range(1, N + 1)]
    f_values = [f"f{i}" for i in range(1, N + 1)]
    lines = []

    ad_c = "; ".join(f"1/{N}::c_values({v})" for v in c_values)
    ad_f = "; ".join(f"1/{N}::f_values({v})" for v in f_values)
    lines.append(f"{ad_c}.")
    lines.append(f"{ad_f}.")
    lines.append("")
    lines.append("state_fluent(color(X), multivalued) :- c_values(X).")
    lines.append("state_fluent(forma(Y), multivalued) :- f_values(Y).")
    lines.append("")
    lines.append("action(spin).")
    lines.append("")
    lines.append("utility(cost, -1).")
    lines.append("cost.")
    lines.append("")

    c_heads = "; ".join(f"1/{N}::color({v}, 1)" for v in c_values)
    for src in c_values:
        lines.append(f"{c_heads} :- color({src}, 0), spin.")
    lines.append("")

    f_heads = "; ".join(f"1/{N}::forma({v}, 1)" for v in f_values)
    for src in f_values:
        lines.append(f"{f_heads} :- forma({src}, 0), spin.")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Definición de tareas
# ---------------------------------------------------------------------------

# Valores por defecto para cada experimento
DEFAULT_N_A  = [2, 3, 5, 8, 10, 15, 20, 30, 40, 50, 75, 100, 125]
DEFAULT_N_BI = [3, 4, 5, 10]   # N_mono_B = [N² for N in DEFAULT_N_BI] = [9,16,25,100]

COLS = [
    'experiment', 'N', 'S', 'generator', 'compiler', 'run_id',
    'n_states', 'n_actions',
    't_prepare', 't_ground', 't_compile',
    'gp_atoms', 'circuit_nodes', 'circuit_edges',
    'status', 'error_msg',
]

CSV_PATH = 'resultados/fase3_treewidth.csv'


def generate_tasks(exp_ids, compilers, run_ids, N_values_A=None, N_bi=None):
    """Genera lista de dicts con cada combinación a ejecutar."""
    N_a   = N_values_A or DEFAULT_N_A
    N_bi_ = N_bi       or DEFAULT_N_BI
    N_mono_b = [n * n for n in N_bi_]

    tasks = []
    for exp_id in exp_ids:
        if exp_id == 'A':
            configs = [('mono', n, n) for n in N_a]
        elif exp_id == 'B_mono':
            configs = [('mono', n, n) for n in N_mono_b]
        elif exp_id == 'B_bi':
            configs = [('bi', n, n * n) for n in N_bi_]
        else:
            continue

        for generator, N, S in configs:
            for compiler in compilers:
                for run_id in run_ids:
                    tasks.append({
                        'experiment': exp_id,
                        'N': N,
                        'S': S,
                        'generator': generator,
                        'compiler': compiler,
                        'run_id': run_id,
                    })
    return tasks


def task_key(task):
    return (task['experiment'], task['N'], task['generator'],
            task['compiler'], task['run_id'])


# ---------------------------------------------------------------------------
# Skip-if-exists
# ---------------------------------------------------------------------------

def load_completed(csv_path):
    """Lee el CSV y retorna el set de claves de tareas con status=success."""
    if not os.path.exists(csv_path):
        return set()
    try:
        df = pd.read_csv(csv_path)
        ok = df[df['status'] == 'success']
        return set(zip(ok.experiment, ok.N, ok.generator, ok.compiler, ok.run_id))
    except Exception:
        return set()


# ---------------------------------------------------------------------------
# Extracción de métricas del circuito
# ---------------------------------------------------------------------------

def extract_circuit_metrics(engine):
    """Extracción defensiva de métricas del circuito compilado (d-DNNF o SDD)."""
    m = {'gp_atoms': None, 'circuit_nodes': None, 'circuit_edges': None}

    try:
        m['gp_atoms'] = engine._gp.atomcount
    except Exception:
        pass

    knowledge = engine._knowledge
    if knowledge is None:
        return m

    # d-DNNF: acceso directo por _nodes
    try:
        nodes = knowledge._nodes
        m['circuit_nodes'] = len(nodes)
        m['circuit_edges'] = sum(
            len(n.children) for n in nodes if hasattr(n, 'children')
        )
        return m
    except AttributeError:
        pass

    # SDD u otro backend: fallback a DOT
    try:
        dot = knowledge.to_dot()
        m['circuit_nodes'] = dot.count('[label=')
        m['circuit_edges'] = dot.count('->')
    except Exception:
        pass

    return m


# ---------------------------------------------------------------------------
# Worker aislado (ejecuta dentro de subproceso)
# ---------------------------------------------------------------------------

def _worker(task, queue):
    """Ejecuta UNA tarea en proceso aislado y envía resultado por queue.

    No usa monkey-patching: MDP.timings ya expone t_ground y t_compile
    tras la construcción del objeto.
    """
    old_stdout, old_stderr = sys.stdout, sys.stderr
    sys.stdout = io.StringIO()
    sys.stderr = io.StringIO()
    try:
        N         = task['N']
        generator = task['generator']
        compiler  = task['compiler']

        model_str = (generate_roulette(N) if generator == 'mono'
                     else generate_two_roulettes(N))
        backend = None if compiler == 'ddnnf' else compiler

        t0 = time.perf_counter()
        mdp = MDP(model_str, backend=backend)
        t_prepare = time.perf_counter() - t0

        metrics = extract_circuit_metrics(mdp._engine)

        queue.put({
            'status':    'success',
            'error_msg': None,
            't_prepare': t_prepare,
            't_ground':  mdp.timings.get('t_ground'),
            't_compile': mdp.timings.get('t_compile'),
            'n_states':  mdp.state_schema.total_states,
            'n_actions': len(mdp.actions()),
            **metrics,
        })

    except Exception as e:
        queue.put({'status': 'error', 'error_msg': str(e)})
    finally:
        sys.stdout = old_stdout
        sys.stderr = old_stderr


def run_task_safe(task, timeout_seconds=120):
    """Lanza _worker en subproceso aislado con timeout. Retorna dict de métricas."""
    q = multiprocessing.Queue()
    p = multiprocessing.Process(target=_worker, args=(task, q))
    p.start()
    p.join(timeout=timeout_seconds)

    if p.is_alive():
        p.terminate()
        p.join(timeout=5)
        if p.is_alive():
            p.kill()
            p.join()
        return {'status': 'timeout', 'error_msg': f'exceeded {timeout_seconds}s'}

    if p.exitcode != 0:
        signal_num = -p.exitcode if p.exitcode < 0 else p.exitcode
        return {'status': 'oom_killed', 'error_msg': f'signal={signal_num}'}

    if not q.empty():
        return q.get()

    return {'status': 'error', 'error_msg': 'worker died without output'}


# ---------------------------------------------------------------------------
# Exportación CSV incremental
# ---------------------------------------------------------------------------

def append_result(csv_path, task, result):
    row = {**task, **result}
    row = {k: row.get(k) for k in COLS}
    df = pd.DataFrame([row])
    write_header = not os.path.exists(csv_path)
    df.to_csv(csv_path, mode='a', header=write_header, index=False)


# ---------------------------------------------------------------------------
# Análisis y resumen teórico
# ---------------------------------------------------------------------------

def _alpha(v1, v2, N1, N2):
    """Pendiente log-log entre dos puntos (exponente de escalado)."""
    if v1 and v2 and v1 > 0 and v2 > 0 and N1 != N2:
        return math.log(v2 / v1) / math.log(N2 / N1)
    return None


def print_summary(csv_path):
    """Imprime tabla de resultados y verifica predicciones teóricas."""
    if not os.path.exists(csv_path):
        return

    df = pd.read_csv(csv_path)
    ok = df[df['status'] == 'success']
    if ok.empty:
        return

    exp_labels = {
        'A':      'Exp A — Barrido de cardinalidad (1 factor multivaluado)',
        'B_mono': 'Exp B_mono — Referencia mono-factor',
        'B_bi':   'Exp B_bi  — Bi-factor (2 factores, misma |S|)',
    }

    for exp_id in ['A', 'B_mono', 'B_bi']:
        sub = ok[ok['experiment'] == exp_id]
        if sub.empty:
            continue

        # Mediana sobre runs y compilers para cada N
        avg = (sub.groupby('N')[
            ['S', 't_compile', 't_ground', 't_prepare', 'circuit_nodes', 'gp_atoms']
        ].median().reset_index().sort_values('N'))

        rows = avg.to_dict('records')

        # Calcular alpha(t_compile) entre puntos consecutivos
        for i in range(len(rows)):
            if i == 0:
                rows[i]['alpha_tc']  = None
                rows[i]['alpha_nds'] = None
            else:
                N1, N2 = rows[i-1]['N'], rows[i]['N']
                rows[i]['alpha_tc']  = _alpha(rows[i-1]['t_compile'],  rows[i]['t_compile'],  N1, N2)
                rows[i]['alpha_nds'] = _alpha(rows[i-1]['circuit_nodes'], rows[i]['circuit_nodes'], N1, N2)

        print(f"\n{'='*105}")
        print(f" {exp_labels.get(exp_id, exp_id)}")
        print(f"{'='*105}")
        hdr = (f"{'N':>6} | {'|S|':>6} | {'gp_atoms':>10} | {'circ_nds':>10} | "
               f"{'t_ground':>10} | {'t_compile':>11} | {'α(tc)':>7} | {'α(nds)':>7}")
        print(hdr)
        print('-' * 105)
        for r in rows:
            gpa = f"{int(r['gp_atoms']):>10}" if r.get('gp_atoms') and not math.isnan(r['gp_atoms']) else f"{'?':>10}"
            nds = f"{int(r['circuit_nodes']):>10}" if r.get('circuit_nodes') and not math.isnan(r['circuit_nodes']) else f"{'?':>10}"
            tg  = f"{r['t_ground']:>10.4f}"  if r.get('t_ground')  else f"{'?':>10}"
            tc  = f"{r['t_compile']:>11.4f}" if r.get('t_compile') else f"{'?':>11}"
            atc = f"{r['alpha_tc']:>7.2f}"   if r.get('alpha_tc')  else f"{'--':>7}"
            and_ = f"{r['alpha_nds']:>7.2f}" if r.get('alpha_nds') else f"{'--':>7}"
            print(f"{int(r['N']):>6} | {int(r['S']):>6} | {gpa} | {nds} | {tg} | {tc} | {atc} | {and_}")

    # ── Verificación de predicciones teóricas ──────────────────────────────
    print(f"\n{'='*70}")
    print(" Verificación de predicciones teóricas")
    print(f"{'='*70}")

    exp_a = ok[ok['experiment'] == 'A']
    if not exp_a.empty:
        med_a = exp_a.groupby('N')[['gp_atoms', 'circuit_nodes', 't_compile']].median()
        Ns = sorted(med_a.index)

        # Prop 7.1: gp_atoms ~ O(N) → α_atoms ≈ 1.0
        if len(Ns) >= 2:
            N1, N2 = Ns[-2], Ns[-1]
            a_atoms = _alpha(med_a.loc[N1, 'gp_atoms'], med_a.loc[N2, 'gp_atoms'], N1, N2)
            verdict = "✓ CONFORME" if a_atoms and 0.8 <= a_atoms <= 1.3 else "⚠ REVISAR"
            print(f"  Prop 7.1 (gp_atoms ~ O(N))     α={a_atoms:.2f if a_atoms else '?':>5}  esperado ≈ 1.0  {verdict}")

        # Sec 7.2: t_compile crece super-polinomialmente → α_tc creciente y >> 1
        alphas_tc = []
        for i in range(1, len(Ns)):
            a = _alpha(med_a.loc[Ns[i-1], 't_compile'], med_a.loc[Ns[i], 't_compile'], Ns[i-1], Ns[i])
            if a:
                alphas_tc.append(a)
        if alphas_tc:
            max_alpha = max(alphas_tc)
            is_growing = all(alphas_tc[i] >= alphas_tc[i-1] - 0.5 for i in range(1, len(alphas_tc)))
            verdict = "✓ CONFORME" if max_alpha > 2.0 else "⚠ REVISAR"
            trend   = "creciente" if is_growing else "no monótona"
            print(f"  Sec 7.2 (t_compile super-polin.) α_max={max_alpha:.2f}  tendencia={trend}  {verdict}")

    # Exp B: factorización debería reducir tiempo de compilación
    b_mono = ok[ok['experiment'] == 'B_mono']
    b_bi   = ok[ok['experiment'] == 'B_bi']
    if not b_mono.empty and not b_bi.empty:
        mono_med = b_mono.groupby('N')['t_compile'].median()
        bi_med   = b_bi.groupby('N')['t_compile'].median()
        print()
        print("  Exp B — Speedup de factorización (mismo |S|):")
        print(f"  {'N_bi':>5} | {'|S|':>6} | {'t_mono':>10} | {'t_bi':>10} | {'speedup':>9}")
        print(f"  {'-'*50}")
        for N_bi in sorted(bi_med.index):
            N_mono = N_bi * N_bi
            if N_mono in mono_med.index:
                tc_m = mono_med[N_mono]
                tc_b = bi_med[N_bi]
                speedup = tc_m / tc_b if tc_b > 0 else float('inf')
                verdict = "✓" if speedup > 1.0 else "✗"
                print(f"  {N_bi:>5} | {N_mono:>6} | {tc_m:>10.4f} | {tc_b:>10.4f} | {speedup:>8.2f}x {verdict}")
        print()
        print("  Si speedup > 1 → la factorización reduce el treewidth efectivo (Sec 7.2)")
        print("  Si speedup ≈ 1 → el treewidth no depende de la factorización en este dominio")

    print(f"{'='*70}\n")


# ---------------------------------------------------------------------------
# Orquestador principal
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description='Experimento Fase 3: Análisis de Explosión de Treewidth'
    )
    parser.add_argument('--exp', nargs='+', default=['A'],
                        choices=['A', 'B'],
                        help='Experimentos a ejecutar (B incluye B_mono y B_bi)')
    parser.add_argument('--compilers', nargs='+', default=['ddnnf'],
                        choices=['ddnnf', 'sdd'],
                        help='Backends de compilación')
    parser.add_argument('--runs', type=int, default=3,
                        help='Número de repeticiones por tarea')
    parser.add_argument('--timeout', type=int, default=120,
                        help='Timeout por tarea en segundos')
    parser.add_argument('--N_values', nargs='+', type=int, default=None,
                        help='Override de valores N para Exp A')
    parser.add_argument('--N_bi', nargs='+', type=int, default=None,
                        help='Valores N (bi-factor) para Exp B; N_mono se calcula como N²')
    args = parser.parse_args()

    # Expandir 'B' → 'B_mono' + 'B_bi'
    exp_ids = []
    for e in args.exp:
        if e == 'B':
            exp_ids += ['B_mono', 'B_bi']
        else:
            exp_ids.append(e)

    tasks = generate_tasks(
        exp_ids,
        compilers=args.compilers,
        run_ids=list(range(1, args.runs + 1)),
        N_values_A=args.N_values,
        N_bi=args.N_bi,
    )

    os.makedirs('resultados', exist_ok=True)
    completed = load_completed(CSV_PATH)

    total   = len(tasks)
    skipped = done = errors = 0

    # Rastrear el último N que falló por (exp_id, generator, compiler)
    # para aplicar early-stop dentro de cada configuración.
    oom_ceiling = {}  # (exp_id, generator, compiler) → N_max_failed

    print(f"[Fase3] Experimentos={args.exp}  Tareas={total}  Timeout={args.timeout}s")
    print(f"[Fase3] CSV={CSV_PATH}")
    print()

    for task in tasks:
        key = task_key(task)

        if key in completed:
            skipped += 1
            continue

        # Early-stop: si ya hubo OOM/timeout para N' < N en esta configuración,
        # registrar como skipped sin intentar.
        cfg_key = (task['experiment'], task['generator'], task['compiler'])
        if cfg_key in oom_ceiling and task['N'] > oom_ceiling[cfg_key]:
            result = {'status': 'skipped', 'error_msg': f"N>{oom_ceiling[cfg_key]} omitido tras OOM/timeout"}
            append_result(CSV_PATH, task, result)
            skipped += 1
            print(f"[SKIP] {key}  → skipped (N>{oom_ceiling[cfg_key]})")
            continue

        label = (task['experiment'], task['N'], task['generator'],
                 task['compiler'], task['run_id'])
        print(f"[RUN]  {label}", end='', flush=True)

        result = run_task_safe(task, timeout_seconds=args.timeout)
        append_result(CSV_PATH, task, result)

        status = result.get('status', '?')
        if status == 'success':
            done += 1
            tc  = result.get('t_compile', 0) or 0
            nds = result.get('circuit_nodes', '?')
            print(f"  → OK  t_compile={tc:.3f}s  nodes={nds}")
        else:
            errors += 1
            msg = result.get('error_msg', '')
            print(f"  → {status}  {msg}")
            # Activar early-stop para N mayores en esta configuración
            if status in ('oom_killed', 'timeout'):
                if cfg_key not in oom_ceiling or task['N'] < oom_ceiling[cfg_key]:
                    oom_ceiling[cfg_key] = task['N']

    print()
    print(f"[Fase3] Completado: {done} OK  |  {skipped} skip  |  {errors} error/timeout")
    print(f"[Fase3] Resultados en: {CSV_PATH}")

    print_summary(CSV_PATH)


if __name__ == '__main__':
    main()
