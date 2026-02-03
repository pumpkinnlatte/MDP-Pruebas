from mdp_t import MDP
from fluent_t import FluentSchema
import os

from debug.tester import Tester

# Importamos el framework de pruebas que definimos anteriormente
if __name__ == "__main__":
    engine_test = Tester(output_dir="auditoria_mdp")
    loader = MDPLoader(engine_test)
    loader.run_all()