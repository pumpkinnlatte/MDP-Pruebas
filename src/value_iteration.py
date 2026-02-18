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

    Refactored to support Mixed-Radix Indexing and Annotated Disjunctions (ADS).

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

        states  = StateSpace(self._mdp.state_schema)
        actions = ActionSpace(self._mdp.actions())

        # Distancias de cada fluente a su posición en el vector de estado
        strides = self._mdp.state_schema.strides

        iteration = 0
        while True:
            iteration += 1            
            max_residual = -sys.maxsize
            for (i, state) in enumerate(states):

                max_value = -sys.maxsize
                greedy_action = None
           
                for (j, action) in enumerate(actions):

                    # Obtengo una lista de factores: [[(termino, prob), ...]]
                    transition_groups = self._mdp.structured_transition(state, action, (i, j))
                    
                    reward = self._mdp.reward(state, action, (i, j))           

                    # Expected value con strides
                    expected_v = self.__expected_value(transition_groups, strides, V)  

                    Q = reward + gamma * expected_v

                    if Q >= max_value:                      
                        max_value = Q                       # Actualiza el valor máximo  
                        greedy_action = actions[j]          # Actualiza la acción greedy 

                residual = abs(V.get(i, 0) - max_value)
                max_residual = max(max_residual, residual)  
                
                V[i] = max_value                            # Actualiza el valor del estado 
                policy[i] = greedy_action                   # Asigna como acción óptima la acción greedy encontrada

            # Criterio de convergencia
            if max_residual <= 2 * epsilon * (1 - gamma) / gamma:
                break

        V_final = {}
        policy_final = {}
        
        for i in range(len(states)):
            
            state_obj = states[i]
            state_key = tuple(state_obj.items())
            
            V_final[state_key] = V[i]
    
            raw_action = policy.get(i)
            clean_action = None
            
            if raw_action is not None:
                for term, val in raw_action.items():
                    if val == 1:
                        clean_action = term
                        break
            
            policy_final[state_key] = clean_action

        return V_final, policy_final, iteration


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
            return joint * V.get(current_index, 0.0) #retorna el expected value para estados finales

        factor = transition_groups[k]
        stride = strides[k]

        if(len(factor) == 1):
            term, p_true = factor[0]
            options = [(None, 1.0 - p_true), (term, p_true)]
        else:
            options = factor

        expected_sum = 0.0
        
        for val, (term, prob) in enumerate(options):
            if abs(prob - 0.0) <= 1e-06: # Si la probabilidad es 0, no se expande esa rama
                continue
            expected_sum += self.__expected_value( transition_groups, strides, V, k + 1, current_index + val * stride, joint * prob)

        return expected_sum # retorna el expected value for para la rama actual
