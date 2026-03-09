"""
Orquestador Modular de Experimentos MDP-ProbLog
================================================

Compara tres arquitecturas de modelado (boolean, multivalued, multi_factor)
con backends de compilación (ddnnf, sdd) en términos de:
  - Fase A: eficiencia de compilación de circuitos lógicos
  - Fase B: costo del Value Iteration

Características:
  - Skip-if-exists: reanuda desde donde se interrumpió
  - Aislamiento por subproceso con timeout 
  - Exportación CSV incremental 
  - CLI con argparse para seleccionar fases, modelos, compilers, etc.

Uso:
  python exp/orquestador.py --phase smoke
  python exp/orquestador.py --phase A --timeout 3600
  python exp/orquestador.py --phase A --model_types boolean --compilers ddnnf
  python exp/orquestador.py --phase B --winner multi_factor --compilers ddnnf
"""

import os
import sys
import io
import time
import argparse
import multiprocessing

import pandas as pd


# ---------------------------------------------------------------------------
# Definición de modelos
# ---------------------------------------------------------------------------

MODELOS = {
    'boolean': [
        f'tests/model_tests/mitchell_grid/boolean/boolean_grid{i:02d}.pl'
        for i in range(8)
    ],
    'multivalued': [
        f'tests/model_tests/mitchell_grid/multivalued/multivalued_grid{i:02d}.pl'
        for i in range(8)
    ],
    'multi_factor': [
        f'tests/model_tests/mitchell_grid/multi-factor/multi_factor_grid{i:02d}.pl'
        for i in range(8)
    ],
}

COMPILERS = ['ddnnf', 'sdd']
RUNS      = [1, 2, 3]

COLS_FASE_A = [
    'phase', 'model_type', 'grid_id', 'compiler', 'run_id',
    'n_states', 'n_actions', 't_prepare', 't_ground', 't_compile',
    'gp_atoms', 'gp_nodes', 'circuit_nodes', 'circuit_edges',
    'status', 'error_msg',
]

COLS_FASE_B = COLS_FASE_A + ['gamma', 'epsilon', 't_vi', 'n_iterations', 't_per_iter']


# ---------------------------------------------------------------------------
# Generadores de tareas
# ---------------------------------------------------------------------------

def generate_tasks_fase_A(model_types=None, compilers=None, grid_ids=None, runs=None):
    """Genera lista de dicts con cada combinación a ejecutar para Fase A."""
    tasks = []
    for mtype in (model_types or list(MODELOS.keys())):
        if mtype not in MODELOS:
            print(f"[WARN] model_type desconocido: {mtype}, ignorando.")
            continue
        for gid, path in enumerate(MODELOS[mtype]):
            if grid_ids is not None and gid not in grid_ids:
                continue
            if not os.path.exists(path):
                print(f"[WARN] Modelo no encontrado: {path}, ignorando.")
                continue
            for compiler in (compilers or COMPILERS):
                for run in (runs or RUNS):
                    tasks.append({
                        'phase':      'A',
                        'model_type': mtype,
                        'grid_id':    gid,
                        'model_path': path,
                        'compiler':   compiler,
                        'run_id':     run,
                        'gamma':      0.95,
                        'epsilon':    0.001,
                    })
    return tasks


def generate_tasks_fase_B(winning_model_type, compilers=None, grid_ids=None,
                          gammas=None, epsilons=None, runs=None):
    """Genera tareas para Fase B con el modelo ganador."""
    if gammas is None:
        gammas = [0.90, 0.99]
    if epsilons is None:
        epsilons = [0.1, 0.0001]

    tasks = []
    if winning_model_type not in MODELOS:
        print(f"[ERROR] winner '{winning_model_type}' no reconocido.")
        return tasks

    for gid, path in enumerate(MODELOS[winning_model_type]):
        if grid_ids is not None and gid not in grid_ids:
            continue
        if not os.path.exists(path):
            print(f"[WARN] Modelo no encontrado: {path}, ignorando.")
            continue
        for compiler in (compilers or COMPILERS):
            for gamma in gammas:
                for epsilon in epsilons:
                    for run in (runs or RUNS):
                        tasks.append({
                            'phase':      'B',
                            'model_type': winning_model_type,
                            'grid_id':    gid,
                            'model_path': path,
                            'compiler':   compiler,
                            'run_id':     run,
                            'gamma':      gamma,
                            'epsilon':    epsilon,
                        })
    return tasks


# ---------------------------------------------------------------------------
# Skip-if-exists
# ---------------------------------------------------------------------------

def load_existing_results(csv_path, phase):
    """Lee CSV y retorna set de claves de tareas ya completadas con éxito."""
    if not os.path.exists(csv_path):
        return set()
    try:
        df = pd.read_csv(csv_path)
    except Exception:
        return set()
    completed = df[df['status'] == 'success']
    if phase == 'B':
        keys = set(zip(
            completed.model_type, completed.grid_id,
            completed.compiler, completed.run_id,
            completed.gamma, completed.epsilon,
        ))
    else:
        keys = set(zip(
            completed.model_type, completed.grid_id,
            completed.compiler, completed.run_id,
        ))
    return keys


def task_key(task):
    if task['phase'] == 'B':
        return (task['model_type'], task['grid_id'],
                task['compiler'], task['run_id'],
                task['gamma'], task['epsilon'])
    return (task['model_type'], task['grid_id'], task['compiler'], task['run_id'])


# ---------------------------------------------------------------------------
# Extracción de métricas de circuito (defensiva, compatible d-DNNF y SDD)
# ---------------------------------------------------------------------------

def extract_circuit_metrics(engine):
    """Extracción defensiva de métricas del circuito compilado."""
    m = {
        'gp_atoms':      None,
        'gp_nodes':      None,
        'circuit_nodes': None,
        'circuit_edges': None,
    }

    # Ground program
    try:
        m['gp_atoms'] = engine._gp.atomcount
    except Exception:
        pass
    try:
        m['gp_nodes'] = len(engine._gp)
    except Exception:
        pass

    knowledge = engine._knowledge
    if knowledge is None:
        return m

    # d-DNNF path: acceso por _nodes
    try:
        nodes = knowledge._nodes
        m['circuit_nodes'] = len(nodes)
        m['circuit_edges'] = sum(
            len(n.children) for n in nodes if hasattr(n, 'children')
        )
        return m
    except AttributeError:
        pass

    # SDD path: método count()
    try:
        m['circuit_nodes'] = knowledge.count()
        return m
    except AttributeError:
        pass

    # Fallback: parsear DOT
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
    """Ejecuta UNA tarea en proceso aislado y envía resultado por queue."""
    # Suprimir prints del framework
    old_stdout = sys.stdout
    old_stderr = sys.stderr
    sys.stdout = io.StringIO()
    sys.stderr = io.StringIO()

    try:
        from src.mdp import MDP
        from src.value_iteration import ValueIteration

        backend = None if task['compiler'] == 'ddnnf' else task['compiler']
        model_str = open(task['model_path']).read()

        t0 = time.perf_counter()
        mdp = MDP(model_str, backend=backend)
        t_prepare = time.perf_counter() - t0

        metrics = extract_circuit_metrics(mdp._engine)

        result = {
            'status':    'success',
            'error_msg': None,
            't_prepare': t_prepare,
            't_ground':  mdp.timings.get('t_ground'),
            't_compile': mdp.timings.get('t_compile'),
            'n_states':  mdp.state_schema.total_states,
            'n_actions': len(mdp.actions()),
            **metrics,
        }

        # Fase B: ejecutar Value Iteration
        if task['phase'] == 'B':
            vi = ValueIteration(mdp)
            t0 = time.perf_counter()
            V, policy, Q, V_hist, iters = vi.run(task['gamma'], task['epsilon'])
            t_vi = time.perf_counter() - t0
            result.update({
                't_vi':        t_vi,
                'n_iterations': iters,
                't_per_iter':  t_vi / iters if iters else None,
            })

        queue.put(result)

    except Exception as e:
        queue.put({'status': 'error', 'error_msg': str(e)})
    finally:
        sys.stdout = old_stdout
        sys.stderr = old_stderr


def run_task_safe(task, timeout_seconds=3600):
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
        return {'status': f'oom_killed', 'error_msg': f'signal={signal_num}'}

    if not q.empty():
        return q.get()

    return {'status': 'error', 'error_msg': 'worker died without output'}


# ---------------------------------------------------------------------------
# Exportación CSV incremental
# ---------------------------------------------------------------------------

def append_result(csv_path, task, result, phase):
    cols = COLS_FASE_B if phase == 'B' else COLS_FASE_A
    row = {**task, **result}
    row = {k: row.get(k) for k in cols}
    df = pd.DataFrame([row])
    write_header = not os.path.exists(csv_path)
    df.to_csv(csv_path, mode='a', header=write_header, index=False)


# ---------------------------------------------------------------------------
# Orquestador principal
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description='Orquestador de experimentos MDP-ProbLog'
    )
    parser.add_argument('--phase',       choices=['smoke', 'A', 'B'], default='smoke',
                        help='Fase a ejecutar (smoke=grid00+grid01, A=compilación, B=VI)')
    parser.add_argument('--model_types', nargs='+', default=None,
                        choices=['boolean', 'multivalued', 'multi_factor'],
                        help='Tipos de modelo a incluir')
    parser.add_argument('--compilers',   nargs='+', default=None,
                        choices=['ddnnf', 'sdd'],
                        help='Backends de compilación')
    parser.add_argument('--grid_ids',    nargs='+', type=int, default=None,
                        help='IDs de grid a incluir (0-7)')
    parser.add_argument('--timeout',     type=int, default=3600,
                        help='Timeout por tarea en segundos')
    parser.add_argument('--winner',      default=None,
                        help='Tipo de modelo ganador para Fase B')
    args = parser.parse_args()

    # Generar tareas
    if args.phase == 'smoke':
        tasks = generate_tasks_fase_A(grid_ids=[0, 1], runs=[1])
        csv_name = 'resultados/fase_smoke.csv'
    elif args.phase == 'A':
        tasks = generate_tasks_fase_A(args.model_types, args.compilers, args.grid_ids)
        csv_name = 'resultados/fase_A.csv'
    elif args.phase == 'B':
        if not args.winner:
            parser.error('--winner es requerido para --phase B')
        tasks = generate_tasks_fase_B(
            args.winner, args.compilers, args.grid_ids
        )
        csv_name = 'resultados/fase_B.csv'

    os.makedirs('resultados', exist_ok=True)
    completed = load_existing_results(csv_name, args.phase)

    total   = len(tasks)
    skipped = 0
    done    = 0
    errors  = 0

    print(f"[Orquestador] Fase={args.phase}  Tareas={total}  Timeout={args.timeout}s")
    print(f"[Orquestador] CSV={csv_name}")
    print()

    for task in tasks:
        key = task_key(task)
        if key in completed:
            skipped += 1
            print(f"[SKIP] {key}")
            continue

        print(f"[RUN]  {key}", end='', flush=True)
        result = run_task_safe(task, timeout_seconds=args.timeout)
        append_result(csv_name, task, result, args.phase)

        status = result.get('status', '?')
        if status == 'success':
            done += 1
            t_p = result.get('t_prepare', 0) or 0
            t_c = result.get('t_compile', 0) or 0
            print(f"  → OK  t_prepare={t_p:.2f}s  t_compile={t_c:.2f}s")
        else:
            errors += 1
            msg = result.get('error_msg', '')
            print(f"  → {status}  {msg}")

    print()
    print(f"[Orquestador] Completado: {done} OK  |  {skipped} skip  |  {errors} error/timeout")
    print(f"[Orquestador] Resultados en: {csv_name}")


if __name__ == '__main__':
    main()
