
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
        return [t[0] for t in self._engine.query(self._db, Term(declaration_type, None))] #ProbLog. query

    #Usado para obtener los valores asignados de un cierto tipo con aridad 2
    def assignments(self, assignment_type):
        """
        Return a dictionary of assignments of type `assignment_type`.

        :param assignment_type: assignment type.
        :type assignment_type: str
        :rtype: dict of (problog.logic.Term, problog.logic.Constant) items.
        """
        return dict(self._engine.query(self._db, Term(assignment_type, None, None)))

        
    # Realiza el grounding de un programa respecto a ciertas consultas dadas
    def relevant_ground(self, queries):
        """
        Create ground program with respect to `queries`.

        :param queries: list of predicates
        :type queries: list of problog.logic.Term
        """
        self._gp = self._engine.ground_all(self._db, queries=queries)
    
    #Anade un hecho probabilístico a la base de conocimiento
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

    #
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

    # Anade una disyunción anotada a la base de conocimiento
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

    
    # Para obtener las disyunciones anotadas, se buscan los nodos 'choice' en la tabla de instrucciones
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

    # Calcula las probabilidades de las consultas dadas un conjunto de evidencias
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
