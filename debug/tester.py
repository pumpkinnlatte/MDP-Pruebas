import os
import json
from datetime import datetime

from mdp_t import MDP 

class Tester:
    """
    Automatización de pruebas para la validación de 
    esquemas de fluentes y detección de ADs.
    """
    def __init__(self, output_dir="test_results"):
        self.output_dir = output_dir
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        self.results = []

    def run_test_case(self, tc_id, pl_content, expected_values):
        """
        Ejecuta un caso de prueba individual.
        :param tc_id: Identificador único del test.
        :param pl_content: Contenido del programa Problog.
        :param expected_values: Diccionario con los valores que se esperan (total_states, isf_count, etc.)
        """
        print(f"[TEST] Ejecutando {tc_id}...")
        report = {"id": tc_id, "timestamp": str(datetime.now()), "status": "FAIL", "errors": []}
        
        try:
            # 1. Instanciación del MDP (dispara la inferencia de tipos)
            mdp = MDP(pl_content)
            schema = mdp.state_fluents()
            
            # 2. Extracción de métricas actuales
            actual_total_states = schema.total_states
            actual_isf_list = [str(f) for f in schema.isf]
            actual_radix = schema.radix_bases
            
            # 3. Validación de expectativas
            if actual_total_states != expected_values.get("total_states"):
                report["errors"].append(f"Espacio de estados erróneo: Esperado {expected_values['total_states']}, Obtenido {actual_total_states}")

            if len(actual_isf_list) != expected_values.get("isf_count"):
                report["errors"].append(f"Cantidad de ISF errónea: Esperado {expected_values['isf_count']}, Obtenido {len(actual_isf_list)}")

            # 4. Determinación de resultado
            if not report["errors"]:
                report["status"] = "PASS"
            
            report["actual_schema"] = str(schema)
            
        except Exception as e:
            report["status"] = "ERROR"
            report["errors"].append(f"Excepción durante la ejecución: {str(e)}")

        self.results.append(report)
        self._save_log(tc_id, report)

    def _save_log(self, tc_id, report):
        log_path = os.path.join(self.output_dir, f"{tc_id}_log.txt")
        with open(log_path, "w") as f:
            f.write(f"RESULTADO: {report['status']}\n")
            if report["errors"]:
                f.write("ERRORES DETECTADOS:\n" + "\n".join(report["errors"]) + "\n")
            f.write("\nESQUEMA RESULTANTE:\n")
            f.write(report.get("actual_schema", "N/A"))