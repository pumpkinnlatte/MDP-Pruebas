
from src.engine import Engine as eng
from src.fluent import Fluent, FluentSchema, StateSpace, ActionSpace
from src.builder import FluentSchemaBuilder
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
    
        builder = FluentSchemaBuilder(self._engine)

        # obtain valid state fluent schema 
        self.state_schema = builder.build()
        print(self.state_schema)

        self._next_state_factors = self.state_schema.get_factors_at(1)
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

    # MDP ELEMENTS    

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
