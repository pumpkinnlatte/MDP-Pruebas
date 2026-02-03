
from src.engine import Engine as eng
from src.fluent import Fluent, FluentSchema
from collections import defaultdict #

from problog.logic import Term

from problog.program import PrologString
from problog.formula import LogicFormula

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

    #02. Prepare
    def __prepare(self):
        """ Prepare the mdp-problog knowledge database to accept queries. """

        #actions = self.actions()

        # prepara lo que consideramos las consultas relevantes
        #self.__utilities = self._engine.assignments('utility')
        #next_state_fluents = self.next_state_fluents()
        #queries = list(set(self.__utilities) | set(next_state_fluents) | set(actions))

        # aterriza las consultas relevantes
        #self._engine.relevant_ground(queries)

    def state_fluents(self):
        """
        Retorna el esquema de fluentes del MDP mediante la recopilacion
        de state_fluents y sus definiciones explicitas e implicitas.

        :rtype: FluentSchema
        """
        schema = FluentSchema() 
        
        # 1. Consultas a ClauseDB
        explicit_fluents = self._engine.assignments('state_fluent')   # (state_fluent/2)
        implicit_fluents = self._engine.declarations('state_fluent')  # (state_fluent/1)
        
        inferred_types = self.infer_types()

        processed_terms = set()

        # 2. Fusión de Conocimiento
        #    (Prioridad: Explícito > Inferido > Default)

        # Procesar definiciones explícitas
        for term, value in explicit_fluents.items():
            fluent_type = str(value)
            
            if fluent_type == 'ads':
                group_key = self._get_group_key(term)    # obtener la clave de grupo
                schema.add_group_option(group_key, term) 
                
            elif fluent_type == 'isf':
                schema.add_isf(term)           # agregar fluente booleano independiente
            
            processed_terms.add(str(term))

        # Procesar definiciones implícitas
        for term in implicit_fluents:
            if str(term) in processed_terms:
                continue

            # Buscamos si la inferencia detectó algo para este termino
            term_sig = (term.functor, term.arity)
            inferred = inferred_types.get(term_sig, 'isf') # Default seguro
            
            if inferred == 'ads':
                group_key = self._get_group_key(term)
                schema.add_group_option(group_key, term)
            else:
                schema.add_isf(term)
                
            processed_terms.add(str(term))
        
        # Ordenamos una sola vez antes de entregar
        schema.sort()
        
        return schema


    # Método auxiliar para obtener la clave de grupo
    def _get_group_key(self, term):
        """
        Genera la clave de agrupación para un término ADS.
        Estrategia: Functor + Argumentos (menos el último).
        
        Ejemplos:
          - color(rojo) -> "color"
          - at(truck1, paris) -> "at(truck1)"
        """
        # term.functor es el nombre (ej. "at")
        # term.args son los argumentos (ej. (truck1, paris))
        
        if len(term.args) == 0:
             return term.functor
        
        if len(term.args) == 1:
            # Caso simple: state_fluent(color(rojo)) -> Agrupa por "color"
            return term.functor
        
        # Caso Relacional: state_fluent(at(truck1, paris))
        # Agrupamos por "at(truck1)" para que no choque con "at(truck2, ...)"
        # Tomamos todos los argumentos menos el último (que se asume es el valor)
        variable_args = term.args[:-1]
        return f"{term.functor}({','.join(map(str, variable_args))})"

    def next_state_fluents(self):
        """
        Retorna una lista ordenada de los objetos de fluentes de estado siguiente a(X, 1)
        """

        """
        Return the ordered list of next state fluent objects.

        :rtype: list of next state fluent objects sorted by string representation
        """
        return [Fluent.create_fluent(f, 1) for f in self.state_fluents()]

    def actions(self):
        """
        Return an ordered list of action objects.

        :rtype: list of action objects sorted by string representation
        """
        return sorted(self._engine.declarations('action'), key=str)


    def infer_types(self):
        """
        Infiere el tipo de fluente (ISF vs ADS) rastreando el origen de su definición
        en la ClauseDB mediante búsqueda indexada.
        """
        db = self._engine._db
        inferences = {}

        # PASO 1: Localizar el nodo 'define' para state_fluent/1
        # db.find() utiliza el hash del functor/aridad para salto directo O(1).
        # Retorna el índice del nodo que agrupa todas las definiciones.
        sf_define_idx = db.find(Term('state_fluent', None))
        
        if sf_define_idx is None:
            return inferences    # No hay definiciones implícitas

        sf_define_node = db.get_node(sf_define_idx)
        
        # Iteramos sobre 'children': la lista de punteros a las reglas o hechos concretos
        for node_idx in sf_define_node.children:
            node = db.get_node(node_idx)
            node_type = type(node).__name__

            # Definición directa por Hecho (Fact)
            # Ejemplo: state_fluent(a).
            if node_type == 'fact':
                term = node.args[0]
                term_sig = (term.functor, term.arity)
                inferences[term_sig] = 'isf'

            # Definición por Regla (Clause)
            # Ejemplo: state_fluent(X) :- values(X).
            elif node_type == 'clause':
                head_arg = node.args[0]
                target_sig = (head_arg.functor, head_arg.arity)

                body_idx = node.child 
                body_node = db.get_node(body_idx)
                
                origin_def_idx = None
                
                # Análisis del cuerpo
                if type(body_node).__name__ == 'call':
                    origin_def_idx = body_node.defnode
                
                # (Opcional) Manejo de negación o estructuras complejas si fuera necesario
                # elif type(body_node).__name__ == 'conj': ...

                if origin_def_idx is None:
                    inferences[target_sig] = 'isf'
                    continue

                # Inspección del Origen
                origin_define_node = db.get_node(origin_def_idx)
                
                is_ads_origin = False
                
                # Verificamos si es una definición válida y tiene hijos
                if hasattr(origin_define_node, 'children'):
                    for child_idx in origin_define_node.children:
                        child = db.get_node(child_idx)
                        
                        # --- Detección de ADs ---
                        # Estructura: define -> clause -> conj -> call -> choice
                        
                        if type(child).__name__ == 'clause':
                            # Bajamos por la estructura de la cláusula de la AD
                            # clause (27) -> child (26) -> children (25, 24) -> call (24) -> defnode (23) -> choice
                            try:
                                # Esto navega la estructura específica que ProbLog genera para las ADs
                                ad_clause_body = db.get_node(child.child) 
                                if type(ad_clause_body).__name__ == 'conj':
                                    # El segundo hijo del conj suele ser la llamada al choice
                                    potential_choice_call = db.get_node(ad_clause_body.children[1])
                                    if type(potential_choice_call).__name__ == 'call':
                                        choice_node = db.get_node(potential_choice_call.defnode)
                                        if type(choice_node).__name__ == 'choice':
                                            is_ads_origin = True
                                            break
                            except (IndexError, AttributeError):
                                pass
                                
                inferences[target_sig] = 'ads' if is_ads_origin else 'isf'

        return inferences
