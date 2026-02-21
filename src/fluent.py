
from collections import OrderedDict
from problog.logic import Constant

class Fluent(object):
    """
    Factory class for building fluent terms. A fluent term is a
    problog.logic.Term with a problog.logic.Constant as last argument
    representing its timestep.
    """

    @classmethod
    def create_fluent(cls, term, timestep):
        """
        Return a new fluent made from `term` with given `timestep`.

        :param term: any problog term
        :type term: problog.logic.Term
        :param timestep: timestep numeric value
        :type timestep: int
        :rtype: problog.logic.Term
        """
        args = term.args + (Constant(timestep),)
        return term.with_args(*args)


class FluentSchema(object):
    """
    Representation of the topological structure of state variables in a factored MDP.
    Maintains two types of factors: Independent State Fluents (ISF) with base 2,
    and Annotated Disjunction groups (ADS) with base N. The schema is atemporal,
    storing terms without time arguments that are added dynamically during
    state space instantiation.
    """
    def __init__(self):
        self.__factors = []
        self.__bases = []
        self.__flattened = []

    @property
    def factors(self):
        """
        Return the list of factors (groups of fluents).
        
        :rtype: list of list of problog.logic.Term
        """
        return self.__factors

    def add_isf(self, term):
        """
        Add an independent binary state fluent.

        :param term: state fluent term
        :type term: problog.logic.Term
        """
        self.__factors.append([term])
        self.__bases.append(2)
        self.__flattened.append(term)

    def add_group(self, terms):
        """
        Add a mutually exclusive group of state fluents (annotated disjunction).

        :param terms: list of mutually exclusive state fluent terms
        :type terms: list of problog.logic.Term
        """
        self.__factors.append(terms)
        self.__bases.append(len(terms))
        self.__flattened.extend(terms)

    @property
    def total_states(self):
        """
        Return the total number of states in the state space.

        :rtype: int
        """
        product = 1
        for base in self.__bases:
            product *= base
        return product

    @property
    def strides(self):
        """
        Retorna las posiciones de cada factor en la codificación de estado en notación de base mixta.
        Por ejemplo, para las bases [2, 3, 2], los strides son [1, 2, 6].

        :rtype: list of int
        """
        strides = []
        current = 1
        for base in self.__bases:
            strides.append(current)
            current *= base
        return strides

    def get_factors_at(self, timestep):
        """
        Return a copy of factors with temporal fluent terms for given `timestep`.

        :param timestep: timestep numeric value
        :type timestep: int
        :rtype: list of list of problog.logic.Term
        """
        temporal_factors = []
        for group in self.__factors:
            temporal_group = [Fluent.create_fluent(term, timestep) for term in group]
            temporal_factors.append(temporal_group)
        return temporal_factors

    def get_flat_list(self):
        """
        Return a flat list of all state fluent terms in schema order.

        :rtype: list of problog.logic.Term
        """
        return self.__flattened

    def __str__(self):
        """
        Genera una representación textual legible para humanos del esquema,
        adaptada a la nueva estructura de factores unificados.
        """
        lines = []
        lines.append("="*60)
        lines.append(f" Esquema de Estados del MDP")
        lines.append("="*60)
        
        # 1. Resumen General
        lines.append(f"Tamaño del espacio de estados: {self.total_states}")
        lines.append("-" * 60)

        # Separamos los factores para la visualización
        isf_list = []
        ads_list = []

        for i, factor in enumerate(self.__factors):
            if len(factor) == 1:
                # Si el factor tiene 1 solo término, es una variable binaria independiente
                isf_list.append(factor[0])
            else:
                # Si tiene más, es un grupo ADS. Guardamos su índice para referencia.
                ads_list.append((i, factor))

        # 2. Fluentes Binarios Booleanos (BSF)
        n_bin = len(isf_list)
        lines.append(f"[BSF] Fluentes Booleanos (Cantidad: {n_bin})")
        lines.append(f"      Descripción: Cada uno itera entre {{0, 1}}.")
        
        if n_bin == 0:
            lines.append("      (None)")
        else:
            for term in isf_list:
                lines.append(f"      [ ] {term}")

        lines.append("") 

        # 3. Grupos Mutuamente Excluyentes (ADS)
        n_groups = len(ads_list)
        lines.append(f"[ADS] Grupos Mutuamente Excluyentes (Cantidad: {n_groups})")
        lines.append(f"      Descripción: En cada grupo, solo UNA OPCIÓN es verdadera (One-Hot).")

        if n_groups == 0:
            lines.append("      (None)")
        else:
            for idx, options in ads_list:
                # Al no tener 'group_key', usamos el índice del factor como identificador
                lines.append(f"      > Grupo #{idx} (Base: {len(options)})")
                for term in options:
                    lines.append(f"          (o) {term}")
                lines.append("") 

        lines.append("="*60)
        return "\n".join(lines)


class FactorSpace(object):
    """
    Abstract base class implementing mixed-radix numeral system iteration
    over factored representations. Provides unified iteration logic for both
    StateSpace and ActionSpace.

    :param schema: fluent schema defining factors and bases
    :type schema: FluentSchema
    :param timestep: optional timestep for temporal fluent instantiation
    :type timestep: int or None
    """
    def __init__(self, schema, timestep=None):
        self._schema = schema
        self.__space_size = schema.total_states
        self.__strides = schema.strides

        if timestep is not None:
            self.__local_factors = schema.get_factors_at(timestep)
        else:
            self.__local_factors = schema._FluentSchema__factors

    def __len__(self):
        """
        Return the number of elements in the factor space.

        :rtype: int
        """
        return self.__space_size

    def __iter__(self):
        """
        Return an iterator over the factor space.

        :rtype: FactorSpace
        """
        self.__current_index = 0
        return self

    def __next__(self):
        """
        Return the next valuation in the iteration sequence.

        :rtype: collections.OrderedDict
        """
        if self.__current_index >= self.__space_size:
            raise StopIteration
        valuation = self.__getitem__(self.__current_index)
        self.__current_index += 1
        return valuation

    def __getitem__(self, index):
        """
        Return the valuation corresponding to the given `index` using
        mixed-radix decoding.

        :param index: element index in factor space
        :type index: int
        :rtype: collections.OrderedDict of (problog.logic.Term, int)
        """
        valuation = OrderedDict()
        temp_index = index

        for base, options in zip(self._schema._FluentSchema__bases, self.__local_factors):
            active_option_index = temp_index % base
            temp_index //= base

            if base == 2 and len(options) == 1:
                valuation[options[0]] = active_option_index
            else:
                for i, term in enumerate(options):
                    valuation[term] = 1 if i == active_option_index else 0

        return valuation

    def index(self, valuation):
        """
        Return the index corresponding to the given `valuation` using
        mixed-radix encoding.

        :param valuation: mapping of fluent terms to values
        :type valuation: dict of (problog.logic.Term, int)
        :rtype: int
        """
        index = 0

        for k, options in enumerate(self.__local_factors):
            active_value = 0
            if len(options) == 1:
                active_value = valuation.get(options[0], 0)
            else:
                for i, term in enumerate(options):
                    if valuation.get(term, 0) == 1:
                        active_value = i
                        break
            index += active_value * self.__strides[k]
        return index

    @property
    def weights(self):
        """
        Return the stride weights for mixed-radix indexing.

        :rtype: list of int
        """
        return self.__strides

class StateSpace(FactorSpace):
    """
    Iterator class for looping over vector representations of states
    in a factored MDP. Each state is represented as an OrderedDict
    mapping fluent terms to their values.

    :param schema: fluent schema defining state space structure
    :type schema: FluentSchema
    :param timestep: timestep numeric value
    :type timestep: int
    """

    def __init__(self, schema, timestep=0):
        super(StateSpace, self).__init__(schema, timestep=timestep)
       

class ActionSpace(FactorSpace):
    """
    Iterator class for looping over one-hot vector representations of
    actions in an MDP. Actions are represented as mutually exclusive
    choices (annotated disjunction).

    :param actions: list of action terms
    :type actions: list of problog.logic.Term
    """

    def __init__(self, actions):
        schema = FluentSchema()
        schema.add_group(actions)
        super(ActionSpace, self).__init__(schema, timestep=None)
        