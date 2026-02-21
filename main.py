import pandas as pd

from src.mdp import MDP
from src.engine import Engine
from src.debugger import MDPDebugger, CPTAnalyzer
from src.fluent import Fluent, FluentSchema, ActionSpace, StateSpace
from src.value_iteration import ValueIteration
import time

def load_model(domain_path):
    with open(domain_path, 'r') as f:
        domain_model = f.read()
    return domain_model

def print_transitions(mdp, states, actions):
    print("\n" + "="*60)
    print("      ANÁLISIS DE TRANSICIONES ESTRUCTURADAS (ADS/ISF)")
    print("="*60)

    # Obtenemos los términos de estado actual (t=0) para validación visual
    current_state_queries = mdp._engine.compile(mdp.current_state_fluents())

    for i, state in enumerate(states):
        print(f"\n[ESTADO #{i}]")
        print("-" * 60)
        
        # Representación legible del estado
        state_repr = ", ".join([f"{k}={v}" for k, v in state.items()])
        print(f"  Configuración: {{ {state_repr} }}")
    
        # (Opcional) Verificación rápida de t=0 para asegurar que el estado de origen es válido
        # print("  Check t=0 (Debug):")
        # prob_t0 = mdp._engine.evaluate(current_state_queries, state)
        # for term, prob in prob_t0:
        #    if prob > 0: print(f"      - {str(term):<30} : {prob:.4f}")
        
        print("-" * 60)

        for j, action in enumerate(actions):
            # Representación legible de la acción (solo las activas)
            action_repr = ", ".join([f"{k}={v}" for k, v in action.items() if v == 1]) 
            print(f"  > Acción #{j}: [{action_repr}]")
            
            # --- CAMBIO CRÍTICO: Llamada a structured_transition ---
            # Retorna: [[(term, p), ...], [(term, p)]]
            transition_groups = mdp.structured_transition(state, action, (i, j))
            
            print("    Resultado Estructurado (t=1):")
            
            if not transition_groups:
                print("      (Sin transiciones definidas)")
            else:
                # Iteramos por FACTOR (Grupo)
                for f_idx, factor in enumerate(transition_groups):
                    
                    # Determinamos tipo para display
                    is_ads = len(factor) > 1
                    type_label = "ADS (Multivaluado)" if is_ads else "ISF (Binario)"
                    
                    print(f"      [Factor #{f_idx} - {type_label}]")
                    
                    group_sum = 0.0
                    
                    # Iteramos por OPCIÓN dentro del factor
                    for term, prob in factor:
                        # Sumamos para validación
                        group_sum += prob
                        
                        # Visualización: Destacamos probabilidades significativas
                        marker = "*" if prob > 0.0001 else " "
                        print(f"        {marker} {str(term):<30} : {prob:.4f}")
                    
                    # --- VALIDACIÓN DE SUMA ---
                    if is_ads:
                        # En ADS la suma debe ser ~1.0
                        status = "OK" if abs(group_sum - 1.0) < 1e-5 else "¡PÉRDIDA DE MASA!"
                        print(f"        >> Suma del grupo: {group_sum:.4f} [{status}]")
                    else:
                        # En ISF, prob es P(True). Mostramos P(False) por claridad.
                        print(f"        >> P(True)={group_sum:.4f}, P(False)={1.0 - group_sum:.4f}")
                    
                    print("") # Separador entre factores


# Resuelve el MDP usando el módulo de Value Iteration
def solve_model(mdp, gamma, epsilon):
    vi = ValueIteration(mdp)
    return vi.run(gamma, epsilon) 

def print_solution(V, policy, iterations, uptime):
    print()
    for state, value in V.items():
        state = ', '.join(["{f}={v}".format(f=f, v=v) for f, v in state])
        print("Value({state}) = {value:.3f}".format(state=state, value=value))
    print()
    for state, action in policy.items():
        state = ', '.join(["{f}={v}".format(f=f, v=v) for f, v in state])
        print("Policy({state}) = {action}".format(state=state, action=action))
    print()
    print(">> Value iteration converged in {0:.3f}sec after {1} iterations.".format(uptime, iterations))
    print(">> Average time per iteration = {0:.3f}sec.".format(uptime / iterations))


def show_state_space(schema):

    states = StateSpace(schema)

    print("\n------ VI States: ----\n")
    for i, state in enumerate(states):
        print(f"  {i}: {state}")

    

if __name__ == "__main__":

    prog_dir = "tests/model_tests/mitchell_grid.pl"
    #prog_dir = "tests/model_tests/student_MDP.pl"
    #prog_dir = "tests/model_tests/mobile_robot_j.pl"

    #prog_dir = "pruebas/vm1.pl"

    # Cargar modelo
    model_str = load_model(prog_dir)

    # Inicialización del MDP
    mdp = MDP(model_str)

    #DEBUG
    MDPDebugger.export_transition_model(mdp)
    MDPDebugger.export_reward_model(mdp)

    show_state_space(mdp.state_schema)

    # VALUE ITERATION
    start = time.perf_counter()     
    V, policy, iterations, Q_table, V_history = solve_model(mdp, 0.9, 0.1)
    end = time.perf_counter()
    uptime = end - start

    print_solution(V, policy, iterations, uptime)

    MDPDebugger.export_q_table(mdp, Q_table)
    MDPDebugger.export_value_history(mdp, V_history)


