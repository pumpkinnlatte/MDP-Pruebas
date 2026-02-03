import os
import json
from datetime import datetime
from src.mdp import MDP


class Tester:
    """
    Motor central de validación. Maneja la ejecución de MDP, diferentes tipos de tests,
    comparación de esquemas y generación de logs.
    """

    def __init__(self, output_dir="test_results"):
        self.output_dir = output_dir
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        self.results = []

    def execute_test(self, file_path, test_type, expectations=None):
        """
        Ejecuta un test con base en el archivo especificado, tipo de test y expectativas provistas.

        :param file_path: Ruta del archivo a testear.
        :param test_type: Tipo de test que se ejecutará.
        :param expectations: Expectativas esperadas (opcional).
        """
        tc_id = os.path.splitext(os.path.basename(file_path))[0]
        print(f"[TEST] Iniciando: {tc_id} con tipo de test '{test_type}'...")
        report = {
            "id": tc_id,
            "file_path": file_path,
            "test_type": test_type,
            "timestamp": str(datetime.now()),
            "status": "FAIL",
            "errors": [],
            "output": "N/A",
        }

        try:
            # Lectura del archivo de entrada
            with open(file_path, "r", encoding="utf-8") as f:
                pl_content = f.read()

            # Ejecución basada en el tipo de test
            output = None
            if test_type == "schema_validation":
                output = self._validate_schema(pl_content, expectations, report)
            elif test_type == "performance_analysis":
                output = self._analyze_performance(pl_content, report)
            else:
                raise ValueError(f"Tipo de test no reconocido: {test_type}")

            # Determinar el estatus general
            if not report["errors"]:
                report["status"] = "PASS"
                print(f"[OK] {tc_id} completado con éxito.")
            else:
                print(f"[FAIL] {tc_id} detectó discrepancias.")

            report["output"] = output

        except Exception as e:
            report["status"] = "ERROR"
            report["errors"].append(f"Falla crítica: {str(e)}")
            print(f"[CRITICAL] Error en {tc_id}: {e}")

        self.results.append(report)
        self._save_log(file_path, report)
        return report

    def execute_batch(self, file_list, test_type):
        """
        Ejecuta test en una lista de archivos, reportando resultados totales.

        :param file_list: Lista de rutas de archivos a testear.
        :param test_type: Tipo de test a ejecutar.
        """
        print("--- Iniciando ejecución de pruebas en lote ---\n")
        overall_report = []
        for file_path in file_list:
            result = self.execute_test(file_path, test_type)
            overall_report.append(result)

        # Resumen de resultados
        total_tests = len(overall_report)
        passed_tests = sum(1 for r in overall_report if r["status"] == "PASS")
        failed_tests = total_tests - passed_tests
        print(f"\n--- Resultados Totales ---")
        print(f"Total: {total_tests}, Aprobados: {passed_tests}, Fallidos: {failed_tests}")
        return overall_report

    def _validate_schema(self, pl_content, expectations, report):
        """
        Valida el esquema generado a partir del contenido proporcionado.
        """
        mdp = MDP(pl_content)
        schema = mdp.state_fluents()  # Genera FluentSchema

        # Validación de expectativas
        if expectations:
            if "total_states" in expectations:
                actual_total_states = schema.total_states
                if actual_total_states != expectations["total_states"]:
                    report["errors"].append(
                        f"Espacio de estados erróneo: Esperado {expectations['total_states']}, Obtenido {actual_total_states}"
                    )

            if "isf_count" in expectations:
                actual_isf_count = len(schema.isf)
                if actual_isf_count != expectations["isf_count"]:
                    report["errors"].append(
                        f"Cantidad de ISF errónea: Esperado {expectations['isf_count']}, Obtenido {actual_isf_count}"
                    )

            if "radix" in expectations:
                actual_radix = schema.radix_bases
                if actual_radix != expectations["radix"]:
                    report["errors"].append(
                        f"Bases Radix inconsistentes: Esperado {expectations['radix']}, Obtenido {actual_radix}"
                    )
        
        return str(schema)

    def _analyze_performance(self, pl_content, report):
        """
        Realiza un análisis de rendimiento o calcula métricas específicas.
        """
        # Simulación de análisis de rendimiento (por implementar)
        performance_data = {
            "execution_time": "120ms",  # Simulado
            "memory_usage": "15MB",  # Simulado
        }
        return json.dumps(performance_data)

    def _save_log(self, file_path, report):
        """
        Guarda los resultados en un archivo de log específico.
        """
        file_name = os.path.basename(file_path)
        log_name = f"{os.path.splitext(file_name)[0]}_result.txt"
        log_path = os.path.join(self.output_dir, log_name)

        with open(log_path, "w", encoding="utf-8") as f:
            f.write(f"=== REPORTE DE TEST: {report['id']} ===\n")
            f.write(f"STATUS: {report['status']}\n")
            f.write(f"FECHA: {report['timestamp']}\n\n")
            if report["errors"]:
                f.write("DETALLE DE ERRORES:\n")
                for err in report["errors"]:
                    f.write(f"- {err}\n")
            f.write("\n--- OUTPUT ---\n")
            f.write(report["output"])