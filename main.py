from src.mdp import MDP
from src.engine import Engine
from src.debugger import MDPDebugger
from src.fluent import Fluent, FluentSchema, ActionSpace, StateSpace

def load_model(domain_path):
    with open(domain_path, 'r') as f:
        domain_model = f.read()
    return domain_model


def print_transitions(mdp, states, actions):
    print("\n" + "="*60)
    print("      ANÁLISIS DE TRANSICIONES (VI)")
    print("="*60)

    for i, state in enumerate(states):
        print(f"\n[ESTADO #{i}]")
        print("-" * 60)
    
        state_repr = ", ".join([f"{k}={v}" for k, v in state.items()])
        print(f"  Configuración: {{ {state_repr} }}")
        print("-" * 60)

        for j, action in enumerate(actions):
            action_repr = ", ".join([f"{k}={v}" for k, v in action.items() if v == 1]) 
            
            print(f"  > Acción #{j}: [{action_repr}]")
            
            # Cálculo de la transición
            transition_probs = mdp.transition(state, action, (i, j))
            
            print("    Resultado (Siguientes Estados Probables):")
            if not transition_probs:
                print("      (Sin transiciones definidas o probabilidad 0)")
            else:
                for term, prob in transition_probs:
                    if prob > 0.0001: 
                        print(f"      - {str(term):<30} : {prob:.4f}")
            
            print("")


if __name__ == "__main__":

    #prog_dir = "tests/model_tests/test_model_02.pl"
    prog_dir = "pruebas/vm1.pl"

    # Cargar modelo
    model_str = load_model(prog_dir)

    # Inicialización del MDP
    mdp = MDP(model_str)

    #DEBUG Inferencia de fluentes
    print("\n--- Inferencia de Orígenes de Fluentes ---")
    print(mdp.infer_types())

    #Preparar espacio de estados
    states  = StateSpace(mdp.state_schema) 
    actions = ActionSpace(mdp.actions())

    print("\n------ VI States: ----\n")
    for i, state in enumerate(states):
        print(f"  {i}: {state}")


    print_transitions(mdp, states, actions)

