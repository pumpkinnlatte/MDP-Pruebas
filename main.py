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

def cpt_analysis(mdp, target_term_str):
    """
    Genera la CPT para un TÉRMINO COMPLETO específico.
    
    Lógica de detección:
    1. Busca el término exacto en el esquema.
    2. Si el término pertenece a un factor de tamaño > 1 (ADS), muestra TODO el grupo 
       (necesario para verificar que sumen 1.0).
    3. Si el término está solo en el factor (ISF), muestra probabilidad True/False.
    """
    
    schema = mdp.state_schema
    target_factor = None
    is_ads = False

    # 1. Búsqueda del Factor por Término Exacto
    # [cite_start]Iteramos sobre los factores definidos en el esquema [cite: 5]
    for factor in schema.factors:
        # Convertimos cada término del factor a string para comparar
        factor_terms_str = [str(term) for term in factor]
        
        if target_term_str in factor_terms_str:
            target_factor = factor
            # Determinamos si es Multivaluado (ADS) o Booleano (ISF)
            if len(factor) > 1:
                is_ads = True
            break

    if target_factor is None:
        print(f"[ERROR] No se encontró el término exacto '{target_term_str}' en el esquema.")
        return

    # 2. Configuración de Archivo y Encabezados
    # Limpiamos el nombre del archivo para evitar caracteres inválidos (opcional)
    safe_name = target_term_str.replace("(", "_").replace(")", "").replace(",", "_")
    filename = f"src/debug/cpt_term_{safe_name}.txt"
    
    with open(filename, "w", encoding="utf-8") as f:
        
        f.write("="*120 + "\n")
        f.write(f"CPT PARA: '{target_term_str}'\n")
        f.write(f" TIPO: {'Multivaluado (ADS - Grupo Completo)' if is_ads else 'Booleano (ISF - Individual)'}\n")
        f.write("="*120 + "\n")

        # --- Encabezados de Estado (Izquierda) ---
        all_state_fluents = schema.get_flat_list()
        state_headers = [str(term) for term in all_state_fluents]

  
        action_header = ["ACCIÓN"]

        if is_ads:
            prob_headers = [str(term) for term in target_factor] + ["SUMA"]
        else:
            prob_headers = [f"{target_factor[0]} (True)", f"{target_factor[0]} (False)"]

        col_width = 25
        total_headers = state_headers + action_header + prob_headers
 
        row_fmt = " | ".join([f"{{:<{col_width}}}"] * len(total_headers)) + "\n"
        separator = "-" * (len(total_headers) * (col_width + 3)) + "\n"

        f.write(row_fmt.format(*total_headers))
        f.write(separator)


        states = StateSpace(mdp.state_schema)
        actions = ActionSpace(mdp.actions())

        for state in states:

            state_str_lookup = {str(k): v for k, v in state.items()}

            state_values = []
            for term in all_state_fluents:
                term_t0 = Fluent.create_fluent(term, 0)
                val = state_str_lookup.get(str(term_t0), 0)
                state_values.append(str(val))
            
            for action in actions:
                action_name = _get_action_name(action)
                
                # P(X'|Obs(x,a))
                next_state_probs = mdp.structured_transition(state, action)


                prob_map = {str(term): prob for term, prob in next_state_probs}
                prob_values = []
                
                if is_ads:
                    # ADS: Recuperar probs de todo el grupo para validar suma
                    current_sum = 0.0
                    for term in target_factor:
                        term_t1 = Fluent.create_fluent(term, 1)
                        p = prob_map.get(str(term_t1), 0.0)
                        prob_values.append(p)
                        current_sum += p
                    prob_values.append(current_sum)
                else:
                    # ISF: Recuperar prob del término único
                    term = target_factor[0]
                    term_t1 = Fluent.create_fluent(term, 1)
                    p_true = prob_map.get(str(term_t1), 0.0)
                    prob_values.append(p_true)
                    prob_values.append(1.0 - p_true)

                # Formateo y Alertas
                formatted_probs = []
                for idx, v in enumerate(prob_values):
                    v_str = f"{v:.4f}"
                    if is_ads and idx == len(prob_values)-1 and abs(v - 1.0) > 1e-6:
                        v_str += " [!]"
                    formatted_probs.append(v_str)

                # Escritura
                full_row_data = state_values + [action_name] + formatted_probs
                f.write(row_fmt.format(*full_row_data))

    print(f"\n[INFO] Análisis de término generado en: {filename}")

def _get_action_name(valuation):
    """Auxiliar: Devuelve el nombre de la acción activa."""
    for term, value in valuation.items():
        if value == 1:
            return str(term)
    return "None"

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


if __name__ == "__main__":

    #prog_dir = "tests/model_tests/dice_cpt_02.pl"
    #prog_dir = "tests/model_tests/weather.pl"
    prog_dir = "pruebas/vm1.pl"

    # Cargar modelo
    model_str = load_model(prog_dir)

    # Inicialización del MDP
    mdp = MDP(model_str)

    # VALUE ITERATION
    start = time.perf_counter()     
    V, policy, iterations = solve_model(mdp, 0.9, 0.1)
    end = time.perf_counter()
    uptime = end - start

    print_solution(V, policy, iterations, uptime)