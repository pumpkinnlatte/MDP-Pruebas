
from problog.program import PrologString
from problog.engine  import DefaultEngine
from problog.logic   import Term, Constant, AnnotatedDisjunction
from problog         import get_evaluatable

class Engine(object):
    """
    Adapter class to ProbLog grounding and query engine.

    :param program: a valid MDP-ProbLog program
    :type program: str
    """

    def __init__(self, program):
        self._engine = DefaultEngine() 
        self._db = self._engine.prepare(PrologString(program)) #Transforma el modelo Prolog hacia un representación interna. (https://dtai.cs.kuleuven.be/problog/tutorial/advanced/01_python_interface.html) 
        self._gp = None         #ground program
        self._knowledge = None  #knowledge database

    #Usado para obtener los valores declarados de un cierto tipo con aridad 1
    def declarations(self, declaration_type):
        """
        Return a list of all terms of type `declaration_type`.

        :param declaration_type: declaration type.
        :type declaration_type: str
        :rtype: list of problog.logic.Term
        """
        return [t[0] for t in self._engine.query(self._db, Term(declaration_type, None))] #ProbLog.

    #Usado para obtener los valores asignados de un cierto tipo con aridad 2
    def assignments(self, assignment_type):
        """
        Return a dictionary of assignments of type `assignment_type`.

        :param assignment_type: assignment type.
        :type assignment_type: str
        :rtype: dict of (problog.logic.Term, problog.logic.Constant) items.
        """
        return dict(self._engine.query(self._db, Term(assignment_type, None, None)))

    # ClauseDB inspection

    def get_instructions_table(self):
        """
        Return the table of instructions separated by instruction type
        as described in problog.engine.ClauseDB.

        :rtype: dict of (str, list of (node,namedtuple))
        """
        instructions = {}
        for node, instruction in enumerate(self._db._ClauseDB__nodes):
            instruction_type = str(instruction)
            instruction_type = instruction_type[:instruction_type.find('(')]
            if instruction_type not in instructions:
                instructions[instruction_type] = []
            assert(self._db.get_node(node) == instruction)  # sanity check
            instructions[instruction_type].append((node, instruction))
        return instructions

    # ClauseDB injection — facts and rules

    def add_fact(self, term, probability=None):
        """
        Add a new `term` with a given `probability` to the program database.
        Return the corresponding node number.

        :param term: a predicate
        :type term: problog.logic.Term
        :param probability: a number in [0,1]
        :type probability: float
        :rtype: int
        """
        return self._db.add_fact(term.with_probability(Constant(probability)))

    def get_fact(self, node):
        """
        Return the fact in the table of instructions corresponding to `node`.

        :param node: identifier of fact in table of instructions
        :type node: int
        :rtype: problog.engine.fact
        """
        fact = self._db.get_node(node)
        if not str(fact).startswith('fact'):
            raise IndexError('Node `%d` is not a fact.' % node)
        return fact

    def add_rule(self, head, body):
        """
        Add a new rule defined by a `head` and `body` arguments
        to the program database. Return the corresponding node number.

        :param head: a predicate
        :type head: problog.logic.Term
        :param body: a list of literals
        :type body: list of problog.logic.Term or problog.logic.Not
        :rtype: int
        """
        b = body[0]
        for term in body[1:]:
            b = b & term
        return self._db.add_clause(head << b)

    def get_rule(self, node):
        """
        Return the rule from the ClauseDB corresponding to `node`.

        :param node: identifier of rule in table of instructions
        :type node: int
        :rtype: problog.engine.clause
        """
        rule = self._db.get_node(node)
        if not str(rule).startswith('clause'):
            raise IndexError('Node `%d` is not a rule.' % node)
        return rule

    # ClauseDB injection — utility assignments

    def add_assignment(self, term, value):
        """
        Add a new utility assignment of `value` to `term` in the program database.
        Return the corresponding node number.

        :param term: a predicate
        :type term: problog.logic.Term
        :param value: a numeric value
        :type value: float
        :rtype: int
        """
        args = (term.with_probability(None), Constant(1.0 * value))
        utility = Term('utility', *args)
        return self._db.add_fact(utility)

    def get_assignment(self, node):
        """
        Return the assignment from the ClauseDB corresponding to `node`.

        :param node: identifier of assignment in table of instructions
        :type node: int
        :rtype: pair of (problog.logic.Term, problog.logic.Constant)
        """
        fact = self._db.get_node(node)
        if not (str(fact).startswith('fact') and fact.functor == 'utility'):
            raise IndexError('Node `%d` is not an assignment.' % node)
        return (fact.args[0], fact.args[1])

    # ClauseDB injection — annotated disjunctions

    def add_annotated_disjunction(self, facts, probabilities):
        """
        Add a new annotated disjunction to the program database from
        a list of `facts` and its `probabilities`.
        Return a list of choice nodes.

        :param facts: list of probabilistic facts
        :type  facts: list of problog.logic.Term
        :param probabilities: list of valid individual probabilities
                              such that the total probability is less
                              than or equal to 1.0
        :type probabilities: list of float in [0.0, 1.0]
        :rtype: list of int
        """
        disjunction = [ f.with_probability(Constant(p)) for f, p in zip(facts, probabilities) ]
        self._db += AnnotatedDisjunction(heads=disjunction, body=Constant('true')) #el body es una constante true

        choices = []
        for node, term in enumerate(self._db._ClauseDB__nodes):
            if str(term).startswith('choice'): #se buscan los nodos 'choice'.
                choices.append((term, node))

        nodes = []
        for term in disjunction:
            term = term.with_probability(None)
            for choice, node in choices:
                if term in choice.functor.args:
                    nodes.append(node)
        return nodes

    def get_annotated_disjunction(self, nodes):
        """
        Return the list of choice nodes in the table of instructions
        corresponding to `nodes`.

        :param nodes: list of node identifiers
        :type nodes: list of int
        :rtype: list of problog.engine.choice
        """
        choices = [ self._db.get_node(node) for node in nodes ]
        for choice in choices:
            if not str(choice).startswith('choice'):
                raise IndexError('Node `%d` is not a choice node.' % choice)
        return choices
  
    def relevant_ground(self, queries):
        """
        Create ground program with respect to `queries`.

        :param queries: list of predicates
        :type queries: list of problog.logic.Term
        """
        self._gp = self._engine.ground_all(self._db, queries=queries)
    
    def compile(self, terms=[]):

        """ 
        Crea una base de conocimiento compilada a partir de un programa aterrizado.
        Retorna una distribución de `terms` a nodos en la base de conocimiento compilada.
        """

        """
        Create compiled knowledge database from ground program.
        Return mapping of `terms` to nodes in the compiled knowledge database.

        :param terms: list of predicates
        :type terms: list of problog.logic.Term
        :rtype: dict of (problog.logic.Term, int)
        """
        self._knowledge = get_evaluatable(None).create_from(self._gp)
        term2node = {}
        for term in terms:
            term2node[term] = self._knowledge.get_node_by_name(term)
        return term2node

    def evaluate(self, queries, evidence):
        """
        Compute probabilities of `queries` given `a`.

        :param queries: mapping of predicates to nodes
        :type queries: dict of (problog.logic.Term, int)
        :param evidence: mapping of predicate and evidence weight
        :type evidence: dictionary of (problog.logic.Term, {0, 1})
        :rtype: list of (problog.logic.Term, [0.0, 1.0])
        """
        evaluator = self._knowledge.get_evaluator(semiring=None, evidence=None, weights=evidence)

        return [ (query, evaluator.evaluate(queries[query])) for query in sorted(queries, key=str) ]

    # Fluent inference

    def get_ads_vocabulary(self):
        """
        Scans the ClauseDB extracting the vocabulary of values generated strictly by 
        Annotated Disjunctions. It achieves this by first finding all 'choice' IDs 
        that belong to a 'mutual_exclusive' constraint, and then extracting the 
        arguments ONLY from those verified AD nodes.
        """
        import re
        ad_origin_ids = set()
        vocabulary = set()
        
        # FASE 1: Identificar los IDs de los choices que SÍ pertenecen a una Disyunción Anotada
        # iter_raw() nos permite ver las restricciones lógicas generadas al final de la compilación
        for node in self._db.iter_raw():
            if str(node).startswith('mutual_exclusive'):
                # Extraemos el ID de origen de la AD. 
                # Ejemplo: de choice(19, 0, values(t)) extrae el '19'
                matches = re.findall(r'choice\((\d+),', str(node))
                for match in matches:
                    ad_origin_ids.add(int(match))
                    
        # FASE 2: Extraer el vocabulario ÚNICAMENTE de los choices verificados
        # Iteramos sobre los objetos nativos de la base de datos
        for node in self._db._ClauseDB__nodes:
            node_type = type(node).__name__
            
            if node_type == 'choice':
                try:
                    # node.functor es el objeto Term: choice(ID, Index, Fact)
                    origin_id = int(node.functor.args[0])
                    
                    # Filtro Estricto: ¿Pertenece este choice a un grupo mutuamente excluyente?
                    if origin_id in ad_origin_ids:
                        fact_term = node.functor.args[2]
                        
                        # Extraemos los argumentos internos (ej. 't' de values(t))
                        if hasattr(fact_term, 'args') and fact_term.args:
                            for arg in fact_term.args:
                                vocabulary.add(str(arg))
                        else:
                            # Si es una constante sin argumentos (ej. 1/2::television)
                            vocabulary.add(str(fact_term))
                except (IndexError, AttributeError, ValueError):
                    pass
                    
        return vocabulary