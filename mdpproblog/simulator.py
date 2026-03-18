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

import random
from collections import OrderedDict
from mdpproblog.fluent import StateSpace, ActionSpace

class Simulator(object):
    """
    Simulator class for MDPs. Given an `mdp` and a `policy`,
    it generates histories and its corresponding
    expected cummulative discounted rewards.

    :param mdp: an MDP formulation
    :type mdp: mdpproblog.mdp.MDP object
    :param policy: mapping from state to action
    :type policy: dict of (tuple, str)
    """

    def __init__(self, mdp, policy):
        self._mdp = mdp
        self._policy = policy

        # Espacios factorizados (nueva arquitectura)
        self._schema = mdp.state_schema
        self._state_space = StateSpace(self._schema)
        self._action_space = ActionSpace(mdp.actions())
        self._state_factors = self._schema.get_factors_at(0)  # términos t=0 para construir estado nuevo

    def run(self, trials, horizon, start_state, gamma=0.9):
        """
        Simulate a number of `trials` of given `horizon` from `start_state`
        following its policy. Compute the discounted expected reward using
        `gamma` as discount factor. Return average reward over all trials,
        a list of rewards received at each trial and list of sampled states
        for each trial.

        :param trials: number of trials
        :type trials: int
        :param horizon: number of timesteps
        :type horizon: int
        :param start_state: state from which the simulation starts
        :param gamma: discount factor
        :type gamma: float
        :rtype: tuple (float, list of list of floats, list of list of states)
        """
        rewards = []
        paths = []
        for i in range(trials):
            total_reward, trial_path = self.run_trial(horizon, start_state, gamma)
            rewards.append(total_reward)
            paths.append(trial_path)
        avg = sum(rewards) / trials
        return avg, rewards, paths

    def run_trial(self, horizon, start_state, gamma=0.9):
        """
        Simulate a single trial of given `horizon` from `start_state`
        following its policy. Compute the discounted expected reward using
        `gamma` as discount factor. Return total discounted reward over all
        steps of the horizon and a list of sampled states in the trial.

        :param trials: number of trials
        :type trials: int
        :param horizon: number of timesteps
        :type horizon: int
        :param start_state: state from which the simulation starts
        :param gamma: discount factor
        :type gamma: float
        :rtype: tuple (float, list of states)
        """
        state = start_state
        discount = 1.0
        total = 0.0
        path = [start_state]
        for step in range(horizon):
            action = self.__select_action(state)
            reward = self.__collect_reward(state, action)
            state = self.__sample_next_state(state, action)
            total += discount * reward
            path.extend([action, state])
            discount *= gamma
        return total, path

    def __select_action(self, state_key):
        """Política ya almacena el OrderedDict completo de la acción elegida."""
        """
        Return the action prescribed by its policy for the given `state`.

        :param state: state represented as a valuation over fluents
        :type state: tuple of pairs (str, bool)
        :rtype: str
        """
        return self._policy[state_key]

    def __collect_reward(self, state_key, action_val):
        """
        Return the reward for applying `action` to `state`.

        :param state: state represented as a valuation over fluents
        :type state: tuple of pairs (str, bool)
        :param action: action represented as a valuation over fluents
        :type action: tuple of pairs (str, bool)
        :rtype: float
        """
        """Conversión mínima + caché por índice (exactamente como ValueIteration)."""
        state_val = OrderedDict(state_key)
        cache = (self._state_space.index(state_val),
                 self._action_space.index(action_val))
        return self._mdp.reward(state_val, action_val, cache)

    def __sample_next_state(self, state_key, action_val):
        """
        Muestreo correcto usando structured_transition.
        Soporta bool y multivalued (one-hot) sin asumir orden plano.
        """
        """
        Return next state sampled from the transition distribution
        given by applying `action` to `state`.

        :param state: state represented as a valuation over fluents
        :type state: tuple of pairs (str, bool)
        :param action: action represented as a valuation over fluents
        :type action: tuple of pairs (str, bool)
        :rtype: state represented as a valuation over fluents
        """
        state_val = OrderedDict(state_key)
        cache = (self._state_space.index(state_val),
                 self._action_space.index(action_val))

        structured = self._mdp.structured_transition(state_val, action_val, cache)

        new_valuation = OrderedDict()
        for f_idx, group in enumerate(structured):
            if not group:
                # Caso degenerado (improbable)
                for term in self._state_factors[f_idx]:
                    new_valuation[term] = 0
                continue

            # Muestreo ponderado (random.choices normaliza automáticamente)
            weights = [p for _, p in group]
            chosen_idx = random.choices(range(len(group)), weights=weights)[0]
            chosen_term_or_none = group[chosen_idx][0]

            # Índice local dentro del factor (maneja None para bool)
            local_idx = self._schema.get_local_index(f_idx, chosen_term_or_none)

            factor_terms = self._state_factors[f_idx]
            if len(factor_terms) == 1:
                # Bool
                new_valuation[factor_terms[0]] = local_idx
            else:
                # Multivalued → one-hot
                for i, term in enumerate(factor_terms):
                    new_valuation[term] = 1 if i == local_idx else 0

        return tuple(new_valuation.items())
