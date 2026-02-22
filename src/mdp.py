
from src.engine import Engine as eng
from src.fluent import Fluent, FluentSchema, StateSpace, ActionSpace
from collections import defaultdict #

from problog.logic import Term

from problog.program import PrologString
from problog.formula import LogicFormula

from src.debugger import MDPDebugger

class MDP(object):
    """
    Representation of an MDP and its components. Implemented as a bridge
    class to the ProbLog programs specifying the MDP domain and problems.

    :param model: a valid MDP-ProbLog program
    :type model: str
    """

    #01. Inicialización.
    def __init__(self, model):
        self._model = model
        self._engine = eng(model)  #Se envía el modelo en str al engine
        self.__transition_cache = {}
        self.__reward_cache = {}
        self.__prepare()

    def __prepare(self):
        """
        Prepare the MDP-ProbLog knowledge database to accept queries.
        This method initializes dummy state fluents and actions, grounds
        the program, and compiles queries for efficient evaluation.
        """

        # DEBUG: Tabla post-inyección 
        MDPDebugger.save_instructions_table(self._engine._db, filename="initial_instructions.txt")
    
        # obtain the state fluent schema 
        self.state_schema = self.__build_state_schema()
        print(self.state_schema)

        self._next_state_factors = self.state_schema.get_factors_at(1)

        # add dummy current state fluents
        for factor in self.state_schema.factors:

            if len(factor) == 1:
                for term in factor:
                    fluent_term = Fluent.create_fluent(term, 0)
                    self._engine.add_fact(fluent_term, 0.5)
            else:
                ad_states =[]
                for term in factor:
                    fluent_term = Fluent.create_fluent(term, 0)
                    ad_states.append(fluent_term)
                self._engine.add_annotated_disjunction(ad_states, [1.0 / len(ad_states)] * len(ad_states))
        
        actions = self.actions()

        self._engine.add_annotated_disjunction(actions, [1.0 / len(actions)] * len(actions))

        self.__utilities = self._engine.assignments('utility')

        next_state_fluents = self.next_state_fluents()
        current_state_fluents = self.current_state_fluents()

        queries = list(set(self.__utilities) | set(next_state_fluents) | set(actions) | set(current_state_fluents))

        self._engine.relevant_ground(queries)

        self.__next_state_queries = self._engine.compile(next_state_fluents)
        self.__reward_queries = self._engine.compile(self.__utilities)

        # DEBUG: Tabla post-inyección 
        MDPDebugger.save_instructions_table(self._engine._db, filename="post_injection_instructions.txt")

    def __build_state_schema(self):
        """
        Build the state fluent schema by collecting explicit and implicit
        declarations and inferring fluent types (ISF vs ADS).

        :raises ValueError: if an ADS group resolves to fewer than 2 options
        :rtype: FluentSchema
        """
        schema = FluentSchema()

        # Collect classified terms from both channels.
        # Explicit declarations take precedence: implicit terms already
        # present in `all_terms` are skipped.
        all_terms = {}  # { term_str: (term, fluent_type) }
        all_terms.update(self.__classify_explicit_fluents())

        for term_str, entry in self.__classify_implicit_fluents().items():
            if term_str not in all_terms:
                all_terms[term_str] = entry

        # Partition terms by type and register them in sorted order.
        ads_accumulator = {}  # { group_key: [term, ...] }

        for term_str in sorted(all_terms.keys()):
            term, fluent_type = all_terms[term_str]

            if fluent_type == 'ads':
                group_key = self.__get_group_key(term)
                ads_accumulator.setdefault(group_key, []).append(term)
            elif fluent_type == 'bsf':
                schema.add_isf(term)

        # Validate and register ADS groups in sorted key order.
        for key in sorted(ads_accumulator.keys()):
            group = sorted(ads_accumulator[key], key=str)
            if len(group) < 2:
                raise ValueError(
                    f"ADS group '{key}' has only {len(group)} option. "
                    "A mutually exclusive group requires at least 2 options. "
                    "Either add more values to the domain or declare the "
                    "fluent as 'bsf'."
                )
            schema.add_group(group)

        return schema

    def __classify_explicit_fluents(self):
        """
        Classify state fluents declared via the `state_fluent/2` predicate.

        Reads all ground instances of `state_fluent(Term, Type)` from the
        program, where `Type` must be either the atom 'bsf' (binary) or
        'ads' (multi-valued). The constant 'bsf' maps to 'bsf'
        internally for consistency with the schema API.

        Returns a dict mapping each term's string representation to a
        `(term, fluent_type)` pair.
        :rtype: dict of (str, (problog.logic.Term, str))
        """
        classified = {}
        for term, type_constant in self._engine.assignments('state_fluent').items():
            tag = str(type_constant)
            if tag == 'bsf' or tag == 'ads':
              fluent_type = tag
            else:
                raise ValueError(
                    f"Unknown state fluent type tag '{tag}' for term '{term}'. "
                    "Valid tags are 'bsf' and 'ads'."
                )
            classified[str(term)] = (term, fluent_type)
        return classified

    def __classify_implicit_fluents(self):
        """
        Classify state fluents declared via the `state_fluent/1` predicate.

        Returns a dict mapping each term's string representation to a
        `(term, fluent_type)` pair.
        :rtype: dict of (str, (problog.logic.Term, str))
        """
        implicit_terms = self._engine.declarations('state_fluent')

        # Group grounded terms by their static identifier key (args[:-1]).
        classified = {}
        groups = {}  # { group_key: [term, ...] } — used only for arity >= 2

        for term in implicit_terms:
            if len(term.args) <= 1:
                # Arity 0 or 1: always an independent binary variable.
                classified[str(term)] = (term, 'bsf')
            else:
                # Arity >= 2: defer to the Cardinality Rule after grouping.
                key = self.__get_group_key(term)
                groups.setdefault(key, []).append(term)

        # Apply the Cardinality Rule to multi-argument groups.
        for group in groups.values():
            fluent_type = 'ads' if len(group) >= 2 else 'bsf'
            for term in group:
                classified[str(term)] = (term, fluent_type)

        return classified

    def __get_group_key(self, term):
        """
        Generate the grouping key for an annotated disjunction term.
        Strategy: functor plus all arguments except the last one.

        Last-Argument Rule: in a term `f(A1, …, AN)`, arguments `A1` through
        `A(N-1)` are treated as static identifiers the group key), and argument
        `AN` is treated as the mutable value (the categorical domain).

        param term: an atemporal state fluent term
        :type term: problog.logic.Term
        :rtype: str
        """
        if len(term.args) <= 1:
            return term.functor

        static_args = term.args[:-1]
        return "{}({})".format(term.functor, ','.join(map(str, static_args)))

    def state_fluents(self):
        """
        Return an ordered list of state fluent objects.

        :rtype: list of problog.logic.Term sorted by string representation
        """
        return self.state_schema.get_flat_list()

    def current_state_fluents(self):
        """
        Return the ordered list of current state fluent objects.

        :rtype: list of problog.logic.Term sorted by string representation
        """
        return [Fluent.create_fluent(f, 0) for f in self.state_fluents()]

    def next_state_fluents(self):
        """
        Return the ordered list of next state fluent objects.

        :rtype: list of problog.logic.Term sorted by string representation
        """
        return [Fluent.create_fluent(f, 1) for f in self.state_fluents()]

    def actions(self):
        """
        Return an ordered list of action objects.

        :rtype: list of problog.logic.Term sorted by string representation
        """
        return sorted(self._engine.declarations('action'), key=str)


    def structured_transition(self, state, action, cache=None):
        """
        Return the probabilities of next state fluents grouped by factors
        according to the FluentSchema. Handles ISF (binary) injection 
        and ADS (multi-valued) sparse filtering.
        """
        flat_transitions = self.transition(state, action, cache)
        prob_map = {str(term): prob for term, prob in flat_transitions}
        
        structured_result = []
        
        for factor_template in self._next_state_factors:
            group_data = []
            
            # Si el esquema dicta que es un ISF estricto (1 elemento)
            if len(factor_template) == 1:
                term = factor_template[0]
                p_true = prob_map.get(str(term), 0.0)
                p_false = 1.0 - p_true
                
                # Inyección de ramas con masa probabilística válida
                if p_false > 1e-6:
                    group_data.append((None, p_false))
                if p_true > 1e-6:
                    group_data.append((term, p_true))
            
            # Si el esquema dicta que es un grupo ADS (> 1 elemento)
            else:
                for term in factor_template:
                    p = prob_map.get(str(term), 0.0)
                    # Filtro de matrices dispersas (Sparse filter)
                    if p > 1e-6:
                        group_data.append((term, p))
                        
            structured_result.append(group_data)
            
        return structured_result

    def transition(self, state, action, cache=None):
        """
        Return the probabilities of next state fluents given current
        `state` and `action`. Cache results optionally if parameter
        `cache` is given.

        :param state: state vector representation of current state fluents
        :type state: list of 0/1 according to state fluents order
        :param action: action vector representation
        :type action: one-hot vector encoding of action as a list of 0/1
        :param cache: key to cache results
        :type cache: immutable, hashable object
        :rtype: list of pairs (problog.logic.Term, float)
        """
        if cache is None:
            return self.__transition(state, action)

        transition = self.__transition_cache.get(cache, None)
        if transition is None:
            transition = self.__transition(state, action)
            self.__transition_cache[cache] = transition

        return transition

    def __transition(self, state, action):
        """
        Return the probabilities of next state fluents given current
        `state` and `action`.

        :param state: state vector representation of current state fluents
        :type state: list of 0/1 according to state fluents order
        :param action: action vector representation
        :type action: one-hot vector encoding of action as a list of 0/1
        :rtype: list of pairs (problog.logic.Term, float)
        """
        evidence = state.copy()
        evidence.update(action)
        return self._engine.evaluate(self.__next_state_queries, evidence)

    def transition_model(self):
        """
        Return the transition model of all valid transitions.

        :rtype: dict of ((state,action), list of probabilities)
        """
        transitions = {}
        states  = StateSpace(self.state_schema)
        actions = ActionSpace(self.actions())
        for state in states:
            for action in actions:
                probabilities = self.transition(state, action)
                transitions[(tuple(state.values()), tuple(action.values()))] = probabilities
        return transitions

    def reward(self, state, action, cache=None):
        """
        Return the immediate reward value of the transition
        induced by applying `action` to the given `state`.
        Cache results optionally if parameter `cache` is given.

        :param state: state vector representation of current state fluents
        :type state: list of 0/1 according to state fluents order
        :param action: action vector representation
        :type action: one-hot vector encoding of action as a list of 0/1
        :param cache: key to cache results
        :type cache: immutable, hashable object
        :rtype: float
        """
        if cache is None:
            return self.__reward(state, action)

        value = self.__reward_cache.get(cache, None)
        if value is None:
            value = self.__reward(state, action)
            self.__reward_cache[cache] = value

        return value

    def __reward(self, state, action):
        """
        Devuelve el valor de recompensa inmediata esperado para una transicion
        inducida por aplicar una accion a un estado particular.
        """

        """
        Return the immediate reward value of the transition
        induced by applying `action` to the given `state`.

        :param state: state vector representation of current state fluents
        :type state: list of 0/1 according to state fluents order
        :param action: action vector representation
        :type action: one-hot vector encoding of action as a list of 0/1
        :rtype: float
        """

        evidence = state.copy()
        evidence.update(action)     
        total = 0
        for term, prob in self._engine.evaluate(self.__reward_queries, evidence):
            total += prob * self.__utilities[term].value
        return total


    #Devuelve el modelo de recompensas de todas las transiciones validas.
    def reward_model(self):
        """
        Return the reward model of all valid transitions.

        :rtype: dict of ((state,action), float)
        """
        rewards = {}
        states  = StateSpace(self.state_schema)
        actions = ActionSpace(self.actions())
        for state in states:
            for action in actions:
                reward = self.reward(state, action)
                rewards[(tuple(state.values()), tuple(action.values()))] = reward
        return rewards