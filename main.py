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

    #prog_dir = "tests/model_tests/mitchell_grid/base_models/gridMultivalued.pl"
    #prog_dir = "tests/model_tests/student/student01.pl"
    #prog_dir = "tests/semaforo.pl"
    #prog_dir = "tests/model_tests/rn_gridworld/rn_gridworld01.pl"
    #prog_dir = "tests/model_tests/mitchell_grid/boolean/boolean_grid02.pl"
    #prog_dir = "tests/model_tests/mitchell_grid/multi-factor/multi_factor_grid03.pl"
    prog_dir = "tests/model_tests/mitchell_grid/multivalued/multivalued_grid07.pl"

    # Cargar modelo
    model_str = load_model(prog_dir)

    # Inicialización del MDP
    mdp = MDP(model_str)

    #DEBUG
    #MDPDebugger.export_transition_model(mdp)
    #MDPDebugger.export_reward_model(mdp)

    show_state_space(mdp.state_schema)

    # VALUE ITERATION
    start = time.perf_counter()     
    V, policy, Q_table, V_history, iterations = solve_model(mdp, 0.9, 0.1)
    end = time.perf_counter()
    uptime = end - start

    print_solution(V, policy, iterations, uptime)

    #MDPDebugger.export_q_table(mdp, Q_table)
    #MDPDebugger.export_value_history(mdp, V_history)

