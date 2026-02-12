
from src.engine import Engine as eng
from src.fluent import Fluent, FluentSchema
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

        # [Prueba] anadimos los current state fluents a las queries 
        current_state_fluents = self.current_state_fluents()

        queries = list(set(self.__utilities) | set(next_state_fluents) | set(actions) | set(current_state_fluents))

        self._engine.relevant_ground(queries)

        self.__next_state_queries = self._engine.compile(next_state_fluents)

        print("\n",self.__next_state_queries,"\n")

        self.__reward_queries = self._engine.compile(self.__utilities)

        # DEBUG: Tabla post-inyección 
        MDPDebugger.save_instructions_table(self._engine._db, filename="post_injection_instructions.txt")

    def __build_state_schema(self):
        """
        Build the state fluent schema by collecting explicit and implicit
        declarations and inferring fluent types (ISF vs ADS).

        :rtype: FluentSchema
        """
        schema = FluentSchema()

        explicit_fluents = self._engine.assignments('state_fluent')
        implicit_fluents = self._engine.declarations('state_fluent')
        inferred_types = self.infer_types()

         # COLLECT ALL TERMS FIRST
        all_terms = {}  # {term_str: (term, type)}
        
        # Process explicit fluents
        for term, value in explicit_fluents.items():
            fluent_type = str(value)
            all_terms[str(term)] = (term, fluent_type)

        # Process implicit fluents
        for term in implicit_fluents:
            term_str = str(term)
            if term_str not in all_terms:
                term_signature = (term.functor, term.arity)
                fluent_type = inferred_types.get(term_signature, 'isf')
                all_terms[term_str] = (term, fluent_type)

        # NOW ADD THEM IN SORTED ORDER
        ads_accumulator = {}
        
        for term_str in sorted(all_terms.keys()):
            term, fluent_type = all_terms[term_str]
            
            if fluent_type == 'ads':
                group_key = self.__get_group_key(term)
                if group_key not in ads_accumulator:
                    ads_accumulator[group_key] = []
                ads_accumulator[group_key].append(term)
            elif fluent_type == 'isf':
                schema.add_isf(term)

        # Add ADS groups in sorted order
        for key in sorted(ads_accumulator.keys()):
            terms_group = sorted(ads_accumulator[key], key=str)
            schema.add_group(terms_group)

        return schema


    def __get_group_key(self, term):
        """
        Generate the grouping key for an annotated disjunction term.
        Strategy: functor plus all arguments except the last one.

        :param term: state fluent term
        :type term: problog.logic.Term
        :rtype: str
        """
        if len(term.args) == 0:
            return term.functor

        if len(term.args) == 1:
            return term.functor

        variable_args = term.args[:-1]
        return "{}({})".format(term.functor, ','.join(map(str, variable_args)))

    def infer_types(self): ##__
        """
        Infer fluent types (ISF vs ADS) by tracing their definition origins
        in the ClauseDB through indexed search.

        :rtype: dict of ((str, int), str)
        """
        db = self._engine._db
        inferences = {}

        sf_define_index = db.find(Term('state_fluent', None))

        if sf_define_index is None:
            return inferences

        sf_define_node = db.get_node(sf_define_index)

        for node_index in sf_define_node.children:
            node = db.get_node(node_index)
            node_type = type(node).__name__

            if node_type == 'fact':
                term = node.args[0]
                term_signature = (term.functor, term.arity)
                inferences[term_signature] = 'isf'

            elif node_type == 'clause':
                head_arg = node.args[0]
                target_signature = (head_arg.functor, head_arg.arity)

                body_index = node.child
                body_node = db.get_node(body_index)

                origin_define_index = None

                if type(body_node).__name__ == 'call':
                    origin_define_index = body_node.defnode

                if origin_define_index is None:
                    inferences[target_signature] = 'isf'
                    continue

                origin_define_node = db.get_node(origin_define_index)

                is_ads_origin = False

                if hasattr(origin_define_node, 'children'):
                    for child_index in origin_define_node.children:
                        child = db.get_node(child_index)

                        if type(child).__name__ == 'clause':
                            try:
                                ad_clause_body = db.get_node(child.child)

                                if type(ad_clause_body).__name__ == 'conj':
                                    potential_choice_call = db.get_node(ad_clause_body.children[1])
                                    if type(potential_choice_call).__name__ == 'call':
                                        choice_node = db.get_node(potential_choice_call.defnode)
                                        if type(choice_node).__name__ == 'choice':
                                            is_ads_origin = True
                                            break
                            except (IndexError, AttributeError):
                                pass

                inferences[target_signature] = 'ads' if is_ads_origin else 'isf'

        return inferences

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

        #print("\nEVIDENCE FOR TRANSITION\n", self.__next_state_queries, "\n") # DEBUG

        return self._engine.evaluate(self.__next_state_queries, evidence)


    def transition_model(self):
        """
        Return the transition model of all valid transitions.

        :rtype: dict of ((state,action), list of probabilities)
        """
        transitions = {}
        states  = StateSpace(self.current_state_fluents())
        actions = ActionSpace(self.actions())
        for state in states:
            for action in actions:
                probabilities = self.transition(state, action)
                transitions[(tuple(state.values()), tuple(action.values()))] = probabilities
        return transitions