# This file is part of MDP-ProbLog.

# MDP-ProbLog is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# MDP-ProbLog is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with MDP-ProbLog.  If not, see <http://www.gnu.org/licenses/>.

import sys

from src.fluent import StateSpace, ActionSpace

class ValueIteration(object):
    """
    Implementation of the enumerative Value Iteration algorithm.
    It performs successive, synchronous Bellman backups until
    convergence is achieved for the given error epsilon for the
    infinite-horizon MDP with discount factor gamma.

    The implementation operates on integer-indexed state representations using
    a mixed-radix encoding defined by the :class:`~mdpproblog.fluent.FluentSchema`.
    Both Boolean State Fluents (Bool, binary) and Annotated Disjunction groups
    (Enum, multi-valued) are handled uniformly through the same Bellman backup.

    :param mdp: MDP representation
    :type mdp: mdpproblog.MDP
    """

    def __init__(self, mdp):
        self._mdp = mdp

    def run(self, gamma=0.9, epsilon=0.1):
        """
        Execute value iteration until convergence.
        Return optimal value function, greedy policy and number
        of iterations.

        :param gamma: discount factor
        :type gamma: float
        :param epsilon: maximum error
        :type epsilon: float
        :rtype: triple (dict(state, value), dict(policy, action), float)
        """
        
        V = {}
        policy = {}
        Q_table_internal = {}
        V_history = {}

        states = StateSpace(self._mdp.state_schema)
        actions = ActionSpace(self._mdp.actions())
        strides = self._mdp.state_schema.strides

        iteration = 0
        while True:
            iteration += 1            
            max_residual = -sys.maxsize

            for (i, state) in enumerate(states):
                max_value = -sys.maxsize
                greedy_action = None
           
                for (j, action) in enumerate(actions):
                    cache_key = (i, j)  # (state_index, action_index)

                    transition_groups = self._mdp.structured_transition(state, action, cache_key)
                    reward = self._mdp.reward(state, action, cache_key)
                    expected_v = self.__expected_value(transition_groups, strides, V)

                    Q = reward + gamma * expected_v
                    Q_table_internal[(i, j)] = Q 

                    if Q >= max_value:                      
                        max_value = Q                      
                        greedy_action = actions[j]        

                residual = abs(V.get(i, 0) - max_value)
                max_residual = max(max_residual, residual)  
                
                V[i] = max_value                            
                policy[i] = greedy_action                  

                V_history[iteration] = V.copy()

            # Criterio de convergencia
            if max_residual <= 2 * epsilon * (1 - gamma) / gamma:
                break

        return *self.__build_output(V, policy, Q_table_internal, states, actions), V_history, iteration


    def __expected_value(self, transition_groups, strides, V, k=0, current_index=0, joint=1.0):
        """
        Calcula de manera recursiva el valor esperado futuro para espacios de estado de bases mixtas.
        
        :param transition_groups: Lista de factores, cada factor es una lista de (term, prob).
        :param strides: Lista de desplazamientos posicionales para indexación.
        :param V: Current Value Function dictionary (Integer Index -> Float Value).
        :param k: Recursion depth (Index of the current factor being processed).
        :param current_index: Accumulated integer index for the state branch.
        :param joint: Accumulated probability of the current branch.
        """

        if len(transition_groups) == k:
            return joint * V.get(current_index, 0.0)

        factor = transition_groups[k]
        stride = strides[k]
        expected_sum = 0.0
        
        for term, prob in factor:
            val = self._mdp.state_schema.get_local_index(k, term) 
            expected_sum += self.__expected_value(transition_groups, strides, V, k + 1, current_index + val * stride, joint * prob)

        return expected_sum

    def __build_output(self, V, policy,Q_table_internal,  states, actions):
        """
        Convert the integer-indexed value function, policy, and Q-table to readable form.

        :param V: integer-indexed value function
        :type V: dict of (int, float)
        :param policy: integer-indexed greedy policy
        :type policy: dict of (int, collections.OrderedDict)
        :param states: state space iterator
        :type states: mdpproblog.fluent.StateSpace
        :param Q_table_internal: integer-indexed Q-values
        :type Q_table_internal: dict of ((int, int), float)
        :param actions: action space iterator
        :type actions: mdpproblog.fluent.ActionSpace
        :returns: formatted V_final, policy_final, and Q_final
        :rtype: tuple(dict, dict, dict)
        """
        V_final = {}
        policy_final = {}
        Q_final = {}

        for i in range(len(states)):
            state_key = tuple(states[i].items())

            V_final[state_key] = V.get(i, 0.0)

            raw_action = policy.get(i)
            clean_action = None
            if raw_action is not None:
                for term, val in raw_action.items():
                    if val == 1:
                        clean_action = term
                        break

            policy_final[state_key] = clean_action

        for (i, j), q_val in Q_table_internal.items():
            state_key = tuple(states[i].items())

            raw_action = actions[j]
            clean_action = None
            for term, val in raw_action.items():
                if val == 1:
                    clean_action = str(term)
                    break

            Q_final[(state_key, clean_action)] = q_val

        return V_final, policy_final, Q_final
        
