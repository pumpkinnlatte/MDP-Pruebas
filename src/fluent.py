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

from collections import OrderedDict
from problog.logic import Constant

# Fluent — temporal term factory

class Fluent(object):
    """
    Factory class for building temporally-stamped fluent terms.

    A fluent term is a :class:`problog.logic.Term` whose last argument is a
    :class:`problog.logic.Constant` representing a discrete timestep. All
    other arguments are inherited from the original atemporal term.
    """

    @classmethod
    def create_fluent(cls, term, timestep):
        """
        Return a new term derived from ``term`` with ``timestep`` appended
        as its last argument.

        :param term: an atemporal ProbLog term
        :type term: problog.logic.Term
        :param timestep: discrete timestep value to append
        :type timestep: int
        :rtype: problog.logic.Term
        """
        args = term.args + (Constant(timestep),)
        return term.with_args(*args)



# FluentSchema — mixed-radix state space descriptor

class FluentSchema(object):
    """
    Descriptor of the factored structure of an MDP state space.

    Maintains an ordered list of *factors*, where each factor is either:

    - A Boolean State Fluent (BSF): a single binary variable with
      base 2, taking values in {0, 1}.
    - An Annotated Disjunction group (ADS): a mutually exclusive set of
      N options with base N, where exactly one option is active at a time
      (one-hot encoding).

    The schema stores atemporal terms only. Temporal copies for a specific
    timestep are produced on demand via :meth:`get_factors_at`.

    The total state space size is the product of all factor bases:
    `b_1 * b_2 * ... * b_n`, where `b_i` is the base of factor `i`.

    Mixed-radix indexing assigns a positional stride to each factor, computed
    as the cumulative product of all preceding bases. For example, bases
    `[2, 3, 2]` yield strides `[1, 2, 6]` and a state space of size 12.
    """

    def __init__(self):
        self.__factors = []    # list of list of Term
        self.__bases = []      # list of int (base per factor)
        self.__flattened = []  # flat list of all terms in registration order
        self.__strides_cache = None

    
    def add_isf(self, term):
        """
        Register a Boolean State Fluent (binary variable) as a new factor.

        The factor is stored as a single-element list ``[term]`` with base 2.

        :param term: atemporal state fluent term
        :type term: problog.logic.Term
        """
        self.__factors.append([term])
        self.__bases.append(2)
        self.__flattened.append(term)
        self.__strides_cache = None

    def add_group(self, terms):
        """
        Register a mutually exclusive ADS group as a new factor.

        The factor is stored as a list of N terms with base N. Within the
        group, exactly one term is active at any given state (one-hot).

        :param terms: ordered list of mutually exclusive state fluent terms
        :type terms: list of problog.logic.Term
        """
        self.__factors.append(list(terms))
        self.__bases.append(len(terms))
        self.__flattened.extend(terms)
        self.__strides_cache = None

    # Schema properties

    @property
    def factors(self):
        """
        Return the list of registered factors.

        Each element is a list of one or more atemporal
        :class:`problog.logic.Term` objects. Single-element lists represent
        BSF factors; multi-element lists represent ADS groups.

        :rtype: list of list of problog.logic.Term
        """
        return self.__factors

    @property
    def total_states(self):
        """
        Return the total number of states in the state spaces.

        :rtype: int
        """
        product = 1
        for base in self.__bases:
            product *= base
        return product

    @property
    def strides(self):
        """
        Return the positional stride for each factor in the mixed-radix encoding.

        Stride `k` is the product of all bases with index less than `k`,
        i.e. For bases `[2, 3, 2]` the result is `[1, 2, 6]`.

        The result is cached after the first call; the cache is invalidated
        whenever a new factor is added via :meth:`add_isf` or
        :meth:`add_group`.

        :rtype: list of int
        """
        if self.__strides_cache is None:
            strides = []
            current = 1
            for base in self.__bases:
                strides.append(current)
                current *= base
            self.__strides_cache = strides
        return self.__strides_cache

    def get_factors_at(self, timestep):
        """
        Return a temporally-stamped copy of all factors for ``timestep``.

        Each atemporal term in every factor is converted to a temporal term
        via :meth:`Fluent.create_fluent`. The structure (BSF vs. ADS) and
        registration order of the original schema are preserved.

        :param timestep: discrete timestep value to stamp onto every term
        :type timestep: int
        :rtype: list of list of problog.logic.Term
        """
        return [
            [Fluent.create_fluent(term, timestep) for term in group]
            for group in self.__factors
        ]

    def get_flat_list(self):
        """
        Return a flat list of all registered atemporal terms in schema order.

        The order matches the registration sequence: BSF terms appear in the
        order they were added via :meth:`add_isf`; ADS terms appear in the
        order their group was added via :meth:`add_group`, with terms within
        each group in their original list order.

        :rtype: list of problog.logic.Term
        """
        return self.__flattened

    def get_local_index(self, factor_index, temporal_term):
        """
        Return the local index of ``temporal_term`` within factor ``factor_index``.

        The local index determines the contribution of this factor to the
        global mixed-radix state index: ``global_index += local_index * stride``.

        Three cases are handled:

        - BSF False branch (`temporal_term is None`): returns `0`,
          representing the inactive state of the binary variable. Value
          Iteration passes `None` explicitly for this branch.
        - BSF True branch: strips the timestep argument from
          `temporal_term`, verifies it matches the single term in the
          factor, and returns `1`.
        - ADS branch: strips the timestep argument and performs a linear
          search within the factor group, returning the matching position.

        :param factor_index: index of the factor within the schema
        :type factor_index: int
        :param temporal_term: a temporally-stamped fluent term, or ``None``
                              for the False branch of an BSF factor
        :type temporal_term: problog.logic.Term or None
        :raises ValueError: if the term does not match any entry in the factor
        :rtype: int
        """
        factor = self.__factors[factor_index]

        # BSF False branch: None signals the inactive (0) side of a binary variable.
        if temporal_term is None:
            return 0

        # Strip the timestep argument to recover the atemporal base term.
        base_term = temporal_term.with_args(*temporal_term.args[:-1])

        if len(factor) == 1:
            # BSF True branch: verify the term matches and return index 1.
            if factor[0] == base_term:
                return 1
            raise ValueError(
                f"Term '{base_term}' does not match BSF '{factor[0]}' "
                f"at factor index {factor_index}."
            )

        # ADS branch: linear search within the mutually exclusive group.
        for i, term in enumerate(factor):
            if term == base_term:
                return i

        raise ValueError(
            f"Term '{base_term}' not found in ADS factor {factor_index}: {factor}."
        )

    def __str__(self):
        """
        Return a human-readable summary of the schema structure.

        Lists all BSF variables and ADS groups along with their bases and
        the total size of the resulting state space.

        :rtype: str
        """
        lines = []
        lines.append("=" * 60)
        lines.append(" MDP State Schema")
        lines.append("=" * 60)
        lines.append(f"Total state space size: {self.total_states}")
        lines.append("-" * 60)

        isf_list = []
        ads_list = []

        for i, factor in enumerate(self.__factors):
            if len(factor) == 1:
                isf_list.append(factor[0])
            else:
                ads_list.append((i, factor))

        # BSF section
        lines.append(f"[BSF] Boolean State Fluents ({len(isf_list)})")
        lines.append("      Each iterates independently over {0, 1}.")
        if not isf_list:
            lines.append("      (none)")
        else:
            for term in isf_list:
                lines.append(f"      [ ] {term}")
        lines.append("")

        # ADS section
        lines.append(f"[ADS] Multivalued State Fluents ({len(ads_list)})")
        lines.append("      Exactly one option is true per group (one-hot).")
        if not ads_list:
            lines.append("      (none)")
        else:
            for idx, options in ads_list:
                lines.append(f"      > Group #{idx}  (base: {len(options)})")
                for term in options:
                    lines.append(f"          (o) {term}")
                lines.append("")

        lines.append("=" * 60)
        return "\n".join(lines)


# FactorSpace — mixed-radix iteration base class

class FactorSpace(object):
    """
    Abstract base class for iterating over factored valuations using a
    mixed-radix numeral system.

    Provides unified encoding (valuation -> index) and decoding
    (index -> valuation) logic for both :class:`StateSpace` and
    :class:`ActionSpace`. Each valuation is an :class:`~collections.OrderedDict`
    mapping :class:`problog.logic.Term` objects to integer values.

    When `timestep` is provided, the iteration is performed over
    temporally-stamped terms obtained from :meth:`FluentSchema.get_factors_at`.
    When `timestep` is `None`, the atemporal terms of the schema are
    used directly (intended for :class:`ActionSpace`, whose terms carry no
    timestep).

    :param schema: fluent schema defining the factor structure and bases
    :type schema: FluentSchema
    :param timestep: optional timestep for temporal term instantiation
    :type timestep: int or None
    """

    def __init__(self, schema, timestep=None):
        self._schema = schema
        self.__space_size = schema.total_states
        self.__strides = schema.strides

        if timestep is not None:
            self.__local_factors = schema.get_factors_at(timestep)
        else:
            # Atemporal access: read the raw factor lists directly.
            # ActionSpace terms have no timestep argument.
            self.__local_factors = schema.factors

    def __len__(self):
        """
        Return the total number of distinct valuations in this space.

        :rtype: int
        """
        return self.__space_size

    def __iter__(self):
        """
        Reset the iteration counter and return ``self`` as an iterator.

        :rtype: FactorSpace
        """
        self.__current_index = 0
        return self

    def __next__(self):
        """
        Return the next valuation and advance the internal counter.

        :raises StopIteration: when all valuations have been yielded
        :rtype: collections.OrderedDict of (problog.logic.Term, int)
        """
        if self.__current_index >= self.__space_size:
            raise StopIteration
        valuation = self[self.__current_index]
        self.__current_index += 1
        return valuation

    def __getitem__(self, index):
        """
        Decode `index` into a valuation using mixed-radix decomposition.

        For each factor, the active option index is extracted as
        `index % base`, then `index` is floor-divided by `base` to
        process the next factor. BSF factors assign the active index
        (0 or 1) directly to their single term; ADS factors assign 1 to
        the active option and 0 to all others.

        :param index: integer index in the range `[0, len(self))`
        :type index: int
        :rtype: collections.OrderedDict of (problog.logic.Term, int)
        """
        valuation = OrderedDict()
        temp_index = index

        for base, options in zip(self._schema._FluentSchema__bases, self.__local_factors):
            active = temp_index % base
            temp_index //= base

            if base == 2 and len(options) == 1:
                # BSF: assign the active index (0 or 1) to the single term.
                valuation[options[0]] = active
            else:
                # ADS: one-hot encoding over the option list.
                for i, term in enumerate(options):
                    valuation[term] = 1 if i == active else 0

        return valuation


    def index(self, valuation):
        """
        Encode `valuation` into a single integer using mixed-radix encoding.

        For each factor, the active option index is determined and multiplied
        by the corresponding stride. BSF factors read their value directly;
        ADS factors find the first term with value 1.

        :param valuation: mapping of fluent terms to their current values
        :type valuation: dict of (problog.logic.Term, int)
        :rtype: int
        """
        idx = 0
        for k, options in enumerate(self.__local_factors):
            if len(options) == 1:
                active_value = valuation.get(options[0], 0)
            else:
                active_value = 0
                for i, term in enumerate(options):
                    if valuation.get(term, 0) == 1:
                        active_value = i
                        break
            idx += active_value * self.__strides[k]
        return idx

    @property
    def weights(self):
        """
        Return the stride weights used for mixed-radix indexing.

        These are the same strides exposed by :attr:`FluentSchema.strides`,
        cached at construction time.

        :rtype: list of int
        """
        return self.__strides


# StateSpace and ActionSpace — concrete subclasses

class StateSpace(FactorSpace):
    """
    Iterable over all state valuations in a factored MDP.

    Each element is an :class:`~collections.OrderedDict` mapping
    temporally-stamped fluent terms (at the given ``timestep``) to their
    integer values (0 or 1 for BSF; 0/1 one-hot for ADS).

    :param schema: fluent schema defining the state space structure
    :type schema: FluentSchema
    :param timestep: timestep at which state fluent terms are stamped
                     (default: 0, representing the current state)
    :type timestep: int
    """

    def __init__(self, schema, timestep=0):
        super(StateSpace, self).__init__(schema, timestep=timestep)


class ActionSpace(FactorSpace):
    """
    Iterable over all action valuations in an MDP.

    Actions are represented as a single mutually exclusive group (annotated
    disjunction), so each element is a one-hot :class:`~collections.OrderedDict`
    over the provided action terms. Action terms carry no timestep argument.

    :param actions: ordered list of action terms
    :type actions: list of problog.logic.Term
    """

    def __init__(self, actions):
        schema = FluentSchema()
        schema.add_group(actions)
        super(ActionSpace, self).__init__(schema, timestep=None)