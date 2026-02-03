import os
import json
from datetime import datetime
from mdp_t import MDP  #

class Tester:
    """
    Motor central de validación. Maneja la ejecución de MDP, 
    comparación de esquemas y generación de logs persistentes.
    """
    def __init__(self, output_dir="test_results"):
        self.output_dir = output_dir
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        self.results = []

    def execute_test(self, tc_id, pl_content, expectations):
        """
        Lógica unificada de ejecución.
        """
        print(f"[TEST] Iniciando: {tc_id}...")
        report = {
            "id": tc_id, 
            "timestamp": str(datetime.now()), 
            "status": "FAIL", 
            "errors": [],
            "actual_schema": "N/A"
        }
        
        try:
            # 1. Construcción del MDP e inferencia de tipos
            mdp = MDP(pl_content)
            schema = mdp.state_fluents() # Genera FluentSchema
            
            # 2. Extracción de métricas
            actual_total_states = schema.total_states
            actual_isf_count = len(schema.isf)
            actual_radix = schema.radix_bases
            
            # 3. Validación de expectativas contra el oráculo (JSON o Dict)
            if "total_states" in expectations:
                if actual_total_states != expectations["total_states"]:
                    report["errors"].append(
                        f"Espacio de estados erróneo: Esperado {expectations['total_states']}, Obtenido {actual_total_states}"
                    )

            if "isf_count" in expectations:
                if actual_isf_count != expectations["isf_count"]:
                    report["errors"].append(
                        f"Cantidad de ISF errónea: Esperado {expectations['isf_count']}, Obtenido {actual_isf_count}"
                    )

            if "radix" in expectations:
                if actual_radix != expectations["radix"]:
                    report["errors"].append(
                        f"Bases Radix inconsistentes: Esperado {expectations['radix']}, Obtenido {actual_radix}"
                    )

            # 4. Determinación de estatus
            if not report["errors"]:
                report["status"] = "PASS"
                print(f"[OK] {tc_id} completado con éxito.")
            else:
                print(f"[FAIL] {tc_id} detectó discrepancias.")
            
            report["actual_schema"] = str(schema) #
            
        except Exception as e:
            report["status"] = "ERROR"
            report["errors"].append(f"Falla crítica: {str(e)}")
            print(f"[CRITICAL] Error en {tc_id}")

        self.results.append(report)
        self._save_log(tc_id, report)
        return report

    def _save_log(self, tc_id, report):
        """Guarda la evidencia técnica en la carpeta test_results."""
        log_path = os.path.join(self.output_dir, f"{tc_id}_log.txt")
        with open(log_path, "w", encoding="utf-8") as f:
            f.write(f"=== REPORTE DE TEST: {tc_id} ===\n")
            f.write(f"STATUS: {report['status']}\n")
            f.write(f"FECHA: {report['timestamp']}\n\n")
            if report["errors"]:
                f.write("DETALLE DE ERRORES:\n")
                for err in report["errors"]:
                    f.write(f"- {err}\n")
            f.write("\n--- ESQUEMA DE FLUENTES INFERIDO ---\n")
            f.write(report["actual_schema"])


class MDPLoader:
    """
    Componente encargado del descubrimiento y carga de archivos.
    Delega la ejecución al motor Tester.
    """
    def __init__(self, tester, scenarios_dir="tests/scenarios", expectations_dir="tests/expectations"):
        self.tester = tester
        self.scenarios_dir = scenarios_dir
        self.expectations_dir = expectations_dir

    def run_all(self):
        """Itera sobre la carpeta de escenarios y ejecuta cada archivo .pl."""
        if not os.path.exists(self.scenarios_dir):
            print(f"[ERROR] Directorio no encontrado: {self.scenarios_dir}")
            return

        files = [f for f in os.listdir(self.scenarios_dir) if f.endswith('.pl')]
        print(f"--- Descubiertos {len(files)} archivos de prueba ---\n")

        for file_name in files:
            test_id = file_name.replace('.pl', '')
            path_pl = os.path.join(self.scenarios_dir, file_name)
            path_json = os.path.join(self.expectations_dir, f"{test_id}.json")

            # Carga de contenido
            with open(path_pl, 'r', encoding="utf-8") as f:
                model_str = f.read() #

            # Carga de expectativas
            expectations = {}
            if os.path.exists(path_json):
                with open(path_json, 'r', encoding="utf-8") as f:
                    expectations = json.load(f)
            else:
                print(f"[WARN] No se encontró JSON de expectativas para {test_id}. Se ejecutará validación básica.")

            # Delegación al Tester
            self.tester.execute_test(test_id, model_str, expectations)

