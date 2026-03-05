"""
Fase 1: Auditoría de Conservación de Masa Probabilística.
Valida el Supuesto A4 (Proposición 4.2) del análisis matemático.

Ejecuta el Linter Semántico sobre modelos MDP-ProbLog existentes
para verificar que las reglas de transición del usuario respetan
la masa unitaria en cada factor del estado siguiente.
"""

import sys
import time
from src.mdp import MDP
from src.auditor import MDPAuditor


def load_model(path):
    with open(path, 'r') as f:
        return f.read()


def run_audit(model_path, tolerance=1e-9):
    """Ejecuta auditoría exhaustiva sobre un modelo ProbLog."""
    print(f"\n{'=' * 64}")
    print(f" Auditoría de Conservación de Masa")
    print(f" Modelo: {model_path}")
    print(f" Tolerancia: {tolerance:.0e}")
    print(f"{'=' * 64}\n")

    # Inicializar MDP
    print("[1/3] Inicializando MDP y compilando circuito WMC...")
    mdp = MDP(load_model(model_path))

    # Instanciar auditor por inyección de dependencias
    auditor = MDPAuditor(mdp)

    total_states = mdp.state_schema.total_states
    total_actions = len(mdp.actions())
    total_pairs = total_states * total_actions

    print(f"[2/3] Espacio de estados: {total_states}")
    print(f"      Acciones: {total_actions}")
    print(f"      Pares (s, a) a auditar: {total_pairs}")

    # Ejecutar auditoría exhaustiva
    print(f"[3/3] Ejecutando escaneo exhaustivo...\n")
    start = time.perf_counter()
    violations = auditor.audit_mass_conservation(tolerance=tolerance)
    elapsed = time.perf_counter() - start

    # Reporte
    if violations:
        print(auditor.format_report(violations))
        print(f"\n[FALLO] {len(violations)} violación(es) detectadas en {elapsed:.3f}s.")
    else:
        print(f"[ÉXITO] Las {total_pairs} transiciones conservan masa probabilística.")
        print(f"        Tolerancia aplicada: {tolerance:.0e}")
        print(f"        Tiempo de auditoría: {elapsed:.3f}s")

    return violations


if __name__ == "__main__":
    # Modelos de prueba disponibles
    models = [
        "tests/model_tests/mitchell_grid/grid01.pl",
        "tests/model_tests/student_MDP.pl",
        "tests/model_tests/weather.pl",
    ]

    # Permitir selección por argumento de línea de comando
    if len(sys.argv) > 1:
        target_models = [sys.argv[1]]
    else:
        target_models = models

    all_passed = True
    for model_path in target_models:
        try:
            violations = run_audit(model_path)
            if violations:
                all_passed = False
        except FileNotFoundError:
            print(f"[SKIP] Modelo no encontrado: {model_path}")
        except Exception as e:
            print(f"[ERROR] {model_path}: {e}")
            all_passed = False
        print()

    if all_passed:
        print("=" * 64)
        print(" Todos los modelos superaron la auditoría estocástica.")
        print("=" * 64)
    else:
        print("=" * 64)
        print(" Algunos modelos presentaron violaciones. Revise el reporte.")
        print("=" * 64)
