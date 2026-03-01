from src.fluent import FluentSchema
from src.exceptions import (
    FluentDeclarationError, FluentAmbiguityError,
    FluentCardinalityError
)
from collections import defaultdict
import warnings

class FluentSchemaBuilder(object):
    """
    Patrón Builder responsable de orquestar la extracción, inferencia, validación 
    y empaquetamiento de los fluentes de estado del MDP a partir de la ClauseDB.
    """
    def __init__(self, engine):
        self._engine = engine
        self._explicit_fluents = self._engine.assignments('state_fluent')
        self._implicit_fluents = self._engine.declarations('state_fluent')
        self._ads_inverted_index = self._engine.get_ads_metadata()

    def build(self):
        """
        Método orquestador principal. Retorna un FluentSchema validado.
        """
        schema = FluentSchema()

        # 1. Validación estática 
        ads_vocab_keys = set(self._ads_inverted_index.keys())
        self._validate_fluent_declarations(self._explicit_fluents, self._implicit_fluents, ads_vocab_keys)

        # 2. Clasificación y Registro
        explicit_registry = self._register_explicit(self._explicit_fluents)
        implicit_registry = self._register_implicit(self._implicit_fluents, explicit_registry, self._ads_inverted_index)
        
        full_registry = {**implicit_registry, **explicit_registry}

        # 3. Distribución y Construcción
        enum_acc, enum_idx = self._dispatch_fluents(full_registry, schema)
        self._finalize_enums(schema, enum_acc, enum_idx)

        return schema

    def _fetch_fluent_data(self):
        """
        Recolecta las declaraciones de fluentes y el índice estocástico desde el motor de inferencia.
        """
        
        return explicit_fluents, implicit_fluents, ads_inverted_index

    def _register_explicit(self, explicit_fluents):
        """
        Parsea y registra los fluentes declarados explícitamente (state_fluent/2).
        """
        registry = {}
        for term, tag_value in explicit_fluents.items():
            fluent_type, mutable_idx = self._parse_fluent_tag(term, tag_value)
            registry[str(term)] = (term, fluent_type, mutable_idx)
        return registry

    def _register_implicit(self, implicit_fluents, explicit_registry, ads_inverted_index):
        """
        Infiere y registra el tipo de los fluentes implícitos (state_fluent/1).
        """
        registry = {}
        implicit_by_predicate = defaultdict(list)
        
        for term in implicit_fluents:
            term_str = str(term)
            if term_str not in explicit_registry:
                key = (term.functor, len(term.args))
                implicit_by_predicate[key].append(term)

        inference_errors = []
        for (functor, arity), grounded_terms in implicit_by_predicate.items():
            try:
                fluent_type = self._infer_fluent_type(grounded_terms, ads_inverted_index)
            except FluentAmbiguityError as e:
                inference_errors.append(e)
                continue
            
            for term in grounded_terms:
                registry[str(term)] = (term, fluent_type, None)

        if inference_errors:
            error_messages = [str(e) for e in inference_errors]
            combined = "\n\n".join(f"[Error V4-{i+1}] {msg}" for i, msg in enumerate(error_messages))
            raise FluentAmbiguityError(f"Found {len(inference_errors)} ambiguity error(s):\n\n{combined}")

        return registry

    def _dispatch_fluents(self, registry, schema):
        """
        Envía los fluentes booleanos al schema y agrupa los enumerados para validación.
        """
        enum_accumulator = defaultdict(list)
        enum_mutable_idx = {}

        for term_str in sorted(registry.keys()):
            term, fluent_type, mutable_idx = registry[term_str]
            if fluent_type == 'bool':
                schema.add_bool(term)
            elif fluent_type == 'enum':
                group_key = self.__get_group_key(term, mutable_idx)
                enum_accumulator[group_key].append(term)
                enum_mutable_idx[group_key] = mutable_idx

        return enum_accumulator, enum_mutable_idx

    def _finalize_enums(self, schema, enum_accumulator, enum_mutable_idx):
        """
        Valida la cardinalidad de los grupos enumerados y los consolida en el schema.
        """
        cardinality_errors = []

        for key in sorted(enum_accumulator.keys()):
            terms_group = sorted(enum_accumulator[key], key=str)
            mutable_idx = enum_mutable_idx[key]

            if mutable_idx is None:
                current_domain = {str(t) for t in terms_group}
            else:
                current_domain = {str(t.args[mutable_idx]) for t in terms_group}

            if len(current_domain) < 2:
                cardinality_errors.append(FluentCardinalityError(
                    f"Enum group '{key}' has only {len(current_domain)} option(s): "
                    f"{current_domain}. A mutually exclusive group requires at least 2 options."
                ))
            else:
                schema.add_group(terms_group)

        if cardinality_errors:
            error_messages = [str(e) for e in cardinality_errors]
            combined = "\n\n".join(f"[Cardinality Error {i+1}] {msg}" for i, msg in enumerate(error_messages))
            raise FluentCardinalityError(f"Found {len(cardinality_errors)} cardinality error(s):\n\n{combined}")


    def _infer_fluent_type(self, grounded_terms, ads_inverted_index):
        """
        Infer the type of an implicit fluent (state_fluent/1).
        Covers arity 0, 1 (including compound terms), and >= 2.

        :param grounded_terms: list of all grounded terms of the same fluent predicate
        :param ads_inverted_index: dict mapping value strings to the set of source predicates they appear in
        :returns: 'bool' or 'enum'
        :raises FluentAmbiguityError: if arity >= 2 and at least one argument originates from an AD
        """
        if not grounded_terms:
            return 'bool'

        sample = grounded_terms[0]
        arity = len(sample.args)

        if arity == 0:
            return 'bool'

        # 1. Identificar si alguna posición del fluente pertenece íntegramente a una AD
        ad_positions = []
        for pos in range(arity):
            values_at_pos = {str(t.args[pos]) for t in grounded_terms}
            if not values_at_pos:
                continue
            
            iterator = iter(values_at_pos)
            
            # Inicializamos los grupos candidatos con el primer elemento
            first_val = next(iterator)
            common_groups = set(ads_inverted_index.get(first_val, set()))
            
            if not common_groups:
                continue
                
            # Intersectamos matemáticamente con los grupos de los elementos restantes
            for val in iterator:
                common_groups.intersection_update(ads_inverted_index.get(val, set()))
                if not common_groups:
                    break
                    
            # Si sobrevivió algún grupo en la intersección, la posición entera es estocástica
            if common_groups:
                ad_positions.append(pos)

        if not ad_positions:
            return 'bool'

        if arity == 1:
            return 'enum'
        pos = ad_positions[0]
        raise FluentAmbiguityError(
            f"Fluent '{sample.functor}/{arity}' has arity {arity} in implicit mode "
            f"and argument at position {pos + 1} originates from an Annotated Disjunction.\n"
            f"The intended interpretation is ambiguous. Declare explicitly:\n"
            f"  state_fluent({sample.functor}(...), enum)    "
            f"— all groundings form a single group (product domain).\n"
            f"  state_fluent({sample.functor}(...), enum(N)) "
            f"— argument N is the mutable domain, all others are static keys."
        )

    def _parse_fluent_tag(self, term, tag_value):
        """
        Parse the second argument of state_fluent/2 into (fluent_type, mutable_idx).

        :param term: the fluent term (first argument of state_fluent/2)
        :param tag_value: the tag term (second argument of state_fluent/2)
        :returns: tuple (fluent_type, mutable_idx) where fluent_type is 'bool' or 'enum'
                  and mutable_idx is the Python index (base 0) of the mutable argument, or None
        :raises FluentDeclarationError: if the tag is unknown, index is malformed, or out of range
        """
        tag_str = str(tag_value)

        if tag_str == 'bool':
            return ('bool', None)

        if tag_str == 'enum':
            # enum without index → Interpretation A: all groundings form a single group.
            # mutable_idx = None indicates no individual mutable argument;
            # __get_group_key will use only the functor as key.
            return ('enum', None)

        if hasattr(tag_value, 'functor') and tag_value.functor == 'enum' and len(tag_value.args) == 1:
            try:
                n = int(tag_value.args[0])
            except (ValueError, TypeError):
                raise FluentDeclarationError(
                    f"Invalid enum index '{tag_value.args[0]}' for fluent '{term}'. "
                    f"The index must be a positive integer."
                )
            if n < 1 or n > len(term.args):
                raise FluentDeclarationError(
                    f"enum({n}) index is out of range for fluent '{term.functor}/{len(term.args)}'. "
                    f"Valid range: 1 to {len(term.args)}."
                )
            return ('enum', n - 1)

        raise FluentDeclarationError(
            f"Unknown type tag '{tag_value}' for fluent '{term}'. "
            f"Valid tags: bool, enum, enum(N)."
        )

    def __get_group_key(self, term, mutable_idx):
        """
        Generate the grouping key for an enum factor.

        Cases:
          mutable_idx = None  → Interpretation A: key = only the functor.
                                All groundings go into the same group.
          mutable_idx = int   → Interpretation B: key = functor + static args.
                                One group per combination of static keys.

        :param term: grounded state fluent term
        :type term: problog.logic.Term
        :param mutable_idx: Python index (base 0) of the mutable argument, or None
        :type mutable_idx: int or None
        :rtype: str
        """
        # Interpretation A: enum without index → a single group under the functor
        if mutable_idx is None:
            return term.functor

        # Interpretation B: enum(N) → group by static arguments
        static_args = [
            str(arg) for i, arg in enumerate(term.args)
            if i != mutable_idx
        ]

        if not static_args:
            return term.functor

        return "{}({})".format(term.functor, ','.join(static_args))

    def _validate_fluent_declarations(self, explicit_fluents, implicit_fluents, ads_vocab):
        errors = []

        # V1, V2, V3: Validate explicit fluent tags
        for term, tag_value in explicit_fluents.items():
            try:
                self._parse_fluent_tag(term, tag_value)
            except FluentDeclarationError as e:
                errors.append(e)

        # V6a: Check for duplicates
        explicit_functors = {str(t) for t in explicit_fluents.keys()}
        for term in implicit_fluents:
            term_str = str(term)
            if term_str in explicit_functors:
                warnings.warn(
                    f"[V6a] Fluent '{term_str}' is declared both implicitly (state_fluent/1) "
                    f"and explicitly (state_fluent/2). The explicit declaration takes precedence.",
                    stacklevel=2
                )

        # V7: Structural collapse warning (BUG CORREGIDO)
        for term, tag_value in explicit_fluents.items():
            tag_str = str(tag_value)
            if tag_str == 'bool' or tag_str == 'enum':
                continue
            if hasattr(tag_value, 'functor') and tag_value.functor == 'enum' and len(tag_value.args) == 1:
                try:
                    mutable_idx = int(tag_value.args[0]) - 1
                except (ValueError, TypeError):
                    continue

                for i, arg in enumerate(term.args):
                    # all_values es ahora directamente ads_vocab (el set de llaves del índice invertido)
                    if i != mutable_idx and str(arg) in ads_vocab:
                        warnings.warn(
                            f"[V7] Fluent '{term}' declared as enum({mutable_idx + 1}), "
                            f"but argument at position {i + 1} ('{arg}') also appears "
                            f"in AD vocabulary. The model may have unmodeled cross-dependencies.",
                            stacklevel=2
                        )
                        break

        if errors:
            error_messages = [str(e) for e in errors]
            combined = "\n\n".join(f"[Error {i+1}] {msg}" for i, msg in enumerate(error_messages))
            raise FluentDeclarationError(f"Found {len(errors)} fluent declaration error(s):\n\n{combined}")