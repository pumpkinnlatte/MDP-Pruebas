from mdp_t import MDP
from fluent_t import FluentSchema
import os

from debug.tester import Tester

# Importamos el framework de pruebas que definimos anteriormente
# Si lo pusiste en un archivo aparte, impórtalo. Si no, puedes pegarlo aquí.

def ejecutar_suite():
    # Instanciamos el Tester   
    tester = Tester(output_dir="test_results")

    print("\n--- RESUMEN DE PRUEBAS ---")
    for res in tester.results:
        print(f"ID: {res['id']} | Estatus: {res['status']}")

if __name__ == "__main__":
    ejecutar_suite()