from src.mdp import MDP
from src.engine import Engine
from src.tester import Tester
from src.debugger import MDPDebugger
from src.fluent import Fluent, FluentSchema

def load_model(domain_path):
    with open(domain_path, 'r') as f:
        domain_model = f.read()
    return domain_model


if __name__ == "__main__":

    #prog_dir = 'pruebas/bool_state.pl' 
    #prog_dir = 'pruebas/mv_state.pl' 
    prog_dir = 'pruebas/test_env.pl' 

    print("--- Cargando Modelo ---")
    model_str = load_model(prog_dir)
    
    # Inicialización del MDP
    mdp = MDP(model_str)
    
    # DEBUG: Tabla de Instrucciones (ClauseDB)
    clause_db = mdp._engine._db
    MDPDebugger.save_instructions_table(clause_db, filename="initial_instructions.txt")

    #MDPDebugger.inspect_by_index(clause_db)

    # Obtenemos el equema de los fluentes declarados
    state_fluent_schema = mdp.state_fluents()
    print(state_fluent_schema.__str__())

    # 2. Inyección de hechos probabilísticos para ISF
    isf_fluents = state_fluent_schema.isf 

    for term in isf_fluents:
        fact_node = mdp._engine.add_fact(Fluent.create_fluent(term, 0), 0.5)
        print(f"   + Inyectado: {term} (Node ID: {fact_node})")

    # 2.1 Inyección de hechos probabilísticos para ADS
    for group in state_fluent_schema.groups:
        ad_fluents = []
        for option in group:
            ad_fluents.append(Fluent.create_fluent(option, 0))
        ad_group = mdp._engine.add_annotated_disjunction(ad_fluents, [1.0 / len(ad_fluents)] * len(ad_fluents))
        print(f"   + Inyectado: {group} (Node ID: {ad_group})")
            
    # DEBUG: Tabla post-inyección 
    MDPDebugger.save_instructions_table(mdp._engine._db, filename="post_injection_instructions.txt")


    #DEBUG ORIGENES
    print("\n--- Inferencia de Orígenes de Fluentes ---")
    print(mdp.infer_types())
