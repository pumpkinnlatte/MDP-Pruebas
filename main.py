from src.mdp import MDP
from src.engine import Engine
from src.debugger import MDPDebugger
from src.fluent import Fluent, FluentSchema

def load_model(domain_path):
    with open(domain_path, 'r') as f:
        domain_model = f.read()
    return domain_model


if __name__ == "__main__":

    prog_dir = 'tests/ads_tests/ads_case_02.pl' 
    #prog_dir = 'pruebas/mv_state.pl' 
    #prog_dir = 'pruebas/test_env.pl' 

    print("--- Cargando Modelo ---")
    model_str = load_model(prog_dir)
    
    # Inicialización del MDP
    mdp = MDP(model_str)
    
    # DEBUG: Tabla post-inyección 
    MDPDebugger.save_instructions_table(mdp._engine._db, filename="post_injection_instructions.txt")

    #DEBUG ORIGENES
    print("\n--- Inferencia de Orígenes de Fluentes ---")
    print(mdp.infer_types())
