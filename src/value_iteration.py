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

from mdpproblog.debugger import MDPDebugger #DEBUG

import sys

from mdpproblog.fluent import StateSpace, ActionSpace

class ValueIteration(object):
    """
    Implementation of the enumerative Value Iteration algorithm.
    It performs successive, synchronous Bellman backups until
    convergence is achieved for the given error epsilon for the
    infinite-horizon MDP with discount factor gamma.

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

        states  = StateSpace(mdp.state_schema)
        actions = ActionSpace(mdp.actions())

        iteration = 0
        while True:
            iteration += 1            
            max_residual = -sys.maxsize
            for (i, state) in enumerate(states):

                max_value = -sys.maxsize
                greedy_action = None
                for (j, action) in enumerate(actions):

                    transition = self._mdp.transition(state, action, (i, j))        # Obtiene la probabilidad de transición P(s'|s,a)
                    reward = self._mdp.reward(state, action, (i, j))                # Obtiene la recompensa asignada R(s,a)

                    Q = reward + gamma * self.__expected_value(transition, V)       # Calcula el action value Q(s,a)

                    if Q >= max_value:                      # Si el action value es mayor o igual al valor máximo actual
                        max_value = Q                       # Actualiza el valor máximo   
                        greedy_action = actions[j]          # Actualiza la acción greedy 

                residual = abs(V.get(i, 0) - max_value)
                max_residual = max(max_residual, residual)  # Compara el residual máximo actual con el residual de este estado
                V[i] = max_value                            # Actualiza el valor del estado 
                policy[i] = greedy_action                   # Asigna como acción óptima la acción greedy encontrada

            # Criterio de convergencias
            if max_residual <= 2 * epsilon * (1 - gamma) / gamma:
                break

        V = { states[i]: value for i, value in V.items() }
        policy = { states[i]: action for i, action in policy.items() }

        return V, policy, iteration


    def __expected_value(self, transition, V, k=0, index=0, joint=1.0):
        """
        Computa el valor esperado futuro dada una transición y un valor de estado V.
        """

        """
        Compute the expected future value for the given `transition` with
        state value given by `V`.

        :param transition: transition probabilities
        :type transition: list of pairs (fluent, float)
        :param V: current value function
        :type V: dict(int,float)
        :rtype: float
        """

        # --- CASO BASE: Hoja del Árbol ---
        # Si la lista de transiciones está vacía, hemos tomado una decisión (0 o 1) 
        # para todas las variables de estado.
        if len(transition) == 0:
            # 'index': Es el identificador entero único del estado resultante s' (construido bit a bit).
            # 'joint': Es la probabilidad acumulada de haber llegado a esta hoja específica.
            # Retornamos la contribución ponderada de este estado: P(s') * V(s').
            return joint * V.get(index, 0.0)

        # --- PASO RECURSIVO: Nodo del Árbol ---
        
        # Obtenemos la probabilidad de que la variable actual (nivel k) sea VERDADERA (1).
        # transition[0] es la variable actual, [1] es su probabilidad.
        probability = transition[0][1]

        # --- RAMIFICACIÓN (Branching) ---
        
        # CASO 1: Determinista Positivo (P ≈ 1.0)
        # La variable es ciertamente 1. No ramificamos, solo avanzamos.
        if abs(probability - 1.0) <= 1e-06:
            # transition[1:]: Avanzamos a la siguiente variable en la lista.
            # k + 1: Incrementamos la posición del bit.
            # index + 2**k: ASUNCIÓN BINARIA. "Encendemos" el bit k sumando su potencia de 2.
            ret1 = self.__expected_value(transition[1:], V, k + 1, index + 2**k, joint)
            ret2 = 0.0 # La rama negativa tiene probabilidad 0.

        # CASO 2: Determinista Negativo (P ≈ 0.0)
        # La variable es ciertamente 0.
        elif abs(probability - 0.0) <= 1e-06:
            ret1 = 0.0 # La rama positiva tiene probabilidad 0.
            # index: NO sumamos 2**k. El bit k permanece en 0.
            ret2 = self.__expected_value(transition[1:], V, k + 1, index, joint)

        # CASO 3: Estocástico (0 < P < 1)
        # El estado se divide en dos mundos posibles. Debemos sumar el valor esperado de ambos.
        else:
            # Rama Derecha (La variable es 1):
            # - Actualizamos la probabilidad conjunta multiplicando por 'probability'.
            # - Actualizamos el índice sumando 2**k.
            ret1 = self.__expected_value(transition[1:], V, k + 1, index + 2**k, joint * probability)
            
            # Rama Izquierda (La variable es 0):
            # - Actualizamos la probabilidad conjunta multiplicando por el complemento (1 - probability).
            # - El índice se mantiene igual (bit k en 0).
            ret2 = self.__expected_value(transition[1:], V, k + 1, index, joint * (1 - probability))

        # Principio de Aditividad de la Esperanza: E[X] = P(A)E[X|A] + P(¬A)E[X|¬A]
        return ret1 + ret2