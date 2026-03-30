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
import time
import logging

from mdpproblog.fluent import StateSpace, ActionSpace
from mdpproblog.verbosity import VerbosityLevel

_logger = logging.getLogger(__name__)

class VIResult(tuple):
    """
    Result container for Value Iteration.

    Inherits from tuple to support positional unpacking three fields (V, policy, iterations).
    Extended fields (Q, history) are accessible only by name
    """
    def __new__(cls, V, policy, iterations, Q=None, history=None):
        return super(VIResult, cls).__new__(cls, (V, policy, iterations))

    def __init__(self, V, policy, iterations, Q=None, history=None):
        self.V = V
        self.policy = policy
        self.iterations = iterations
        self.Q = Q
        self.history = history

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

    def run(self, gamma=0.9, epsilon=0.1, compute_q=False, track_history=False, verbosity=None):
        """
        Execute value iteration until convergence.
        Return optimal value function, greedy policy and number
        of iterations.

        :param gamma: discount factor
        :type gamma: float
        :param epsilon: maximum error
        :type epsilon: float
        :param compute_q: If True, computes and returns the final Q-table.
        :type compute_q: bool
        :param track_history: If True, tracks the value function at each iteration.
        :type track_history: bool
        :rtype: VIResult
        """
        V = {}
        policy = {}
        history_log = [] if track_history else None # only if required

        states = StateSpace(self._mdp.state_schema)
        actions = ActionSpace(self._mdp.actions())
        strides = self._mdp.state_schema.strides

        threshold = 2 * epsilon * (1 - gamma) / gamma

        traced = verbosity is not None and verbosity.level >= VerbosityLevel.TRACE 

        if traced:
            from mdpproblog.trace import trace_vi_iteration, trace_vi_summary

        iteration = 0
        while True:
            iteration += 1

            if traced:
                t0 = time.perf_counter() 

            max_residual = -sys.maxsize
            Q_current = {} if compute_q else None # only if required

            for (i, state) in enumerate(states):
                max_value = -sys.maxsize
                greedy_action = None
                for (j, action) in enumerate(actions):
                    transition_groups = self._mdp.structured_transition(state, action, (i, j))
                    reward = self._mdp.reward(state, action, (i, j))
                    Q_val = reward + gamma * self.__expected_value(transition_groups, strides, V)

                    # only if required
                    if compute_q:
                        Q_current[(i, j)] = Q_val

                    if Q_val >= max_value:
                        max_value = Q_val
                        greedy_action = actions[j]

                residual = abs(V.get(i, 0) - max_value)
                max_residual = max(max_residual, residual)
                V[i] = max_value
                policy[i] = greedy_action

            if traced:
                elapsed = time.perf_counter() - t0
                trace_vi_iteration(iteration, max_residual, elapsed)

            if track_history:
                history_log.append(dict(V))

            if max_residual <= threshold:
                break

        # === Resumen final ===
        if traced:
            transition_hits = self._mdp.transition_cache_size
            reward_hits = self._mdp.reward_cache_size
            total_pairs = len(states) * len(actions)

            trace_vi_summary(
                iterations=iteration,
                residual=max_residual,
                threshold=threshold,
                transition_hits=transition_hits,
                reward_hits=reward_hits,
                total_pairs=total_pairs
            )

        return self.__format_results(V, policy, iteration, Q_current, history_log, states, actions)

    def __expected_value(self, transition_groups, strides, V, k=0, current_index=0, joint=1.0):
        """
        Compute the expected future value by recursing over the factored transition tree.

        :param transition_groups: factored transition, one list of (term, prob) pairs per factor
        :type transition_groups: list[list[tuple]]
        :param strides: positional strides from the fluent schema
        :type strides: list[int]
        :param V: current value function mapping state index to value
        :type V: dict[int, float]
        :param k: current recursion depth (factor index)
        :type k: int
        :param current_index: accumulated mixed-radix state index
        :type current_index: int
        :param joint: accumulated joint probability of the current branch
        :type joint: float
        :rtype: float
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


    def __format_results(self, V, policy, iteration, Q_current, history_log, states, actions):
        """
        Translate internal integer indices to logical representations 
        and package the data into a VIResult structure.
        """
        def decode_state(i):
            return tuple(states[i].items())
            
        def decode_action(j):
            return tuple(actions[j].items())

        V_final = {decode_state(i): value for i, value in V.items()}
        policy_final = {decode_state(i): action for i, action in policy.items()}
        
        Q_final = None
        if Q_current is not None:
            Q_final = {(decode_state(i), decode_action(j)): q_val 
                    for (i, j), q_val in Q_current.items()}
        
        history_final = None
        if history_log is not None:
            history_final = []
            for v_dict in history_log:
                history_final.append({decode_state(i): val for i, val in v_dict.items()})

        return VIResult(V_final, policy_final, iteration, Q=Q_final, history=history_final)