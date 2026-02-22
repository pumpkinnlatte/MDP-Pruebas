# =============================================================================
# test_fluent_classification.py
#
# Unit tests for state fluent type classification in MDP-ProbLog.
#
# Tests cover every declaration pattern defined in the syntax specification:
#   - BSF (Binary State Fluents): implicit inference and explicit tag
#   - ADS (Annotated Disjunction groups): implicit cardinality and explicit tag
#   - Validation errors: unknown tags, ADS groups with cardinality < 2
#
# Test strategy
# -------------
# MDP.__build_state_schema and its two classifiers are private, but their
# observable effect is the structure of the resulting FluentSchema. Tests
# are written against the public FluentSchema API:
#
#   schema.factors          → list of groups (1-element = ISF, N-element = ADS)
#   schema.total_states     → product of all bases
#   schema.get_flat_list()  → ordered flat list of all registered terms
#
# Each test builds a minimal but syntactically valid MDP-ProbLog program
# string (no actions or rewards needed for schema construction) and calls
# MDP(model).state_schema directly.
#
# Running
# -------
#   python -m pytest test_fluent_classification.py -v
#   python -m pytest test_fluent_classification.py -v --tb=short
# =============================================================================

import pytest
from src.mdp import MDP


# =============================================================================
# Helpers
# =============================================================================

# Minimal boilerplate appended to every test program so that MDP.__prepare
# does not raise errors about missing actions or utilities.
_MINIMAL_BOILERPLATE = """
action(noop).
utility(noop, 0).
"""


def _make_mdp(program_body: str) -> MDP:
    """Build an MDP from a program fragment plus minimal boilerplate."""
    return MDP(program_body + _MINIMAL_BOILERPLATE)


def _isf_terms(schema) -> list:
    """Return the string representation of all ISF (single-element) factor terms."""
    return sorted(
        str(factor[0])
        for factor in schema.factors
        if len(factor) == 1
    )


def _ads_groups(schema) -> dict:
    """
    Return a dict mapping each ADS group key to a sorted list of term strings.

    The key is the string of the first term with its last argument stripped
    (i.e. the group identifier), matching the __get_group_key convention.
    For a single-argument group the key is just the functor.
    """
    groups = {}
    for factor in schema.factors:
        if len(factor) > 1:
            # Reconstruct the group key from the first term
            first = factor[0]
            if len(first.args) <= 1:
                key = first.functor
            else:
                key = "{}({})".format(
                    first.functor,
                    ",".join(str(a) for a in first.args[:-1])
                )
            groups[key] = sorted(str(t) for t in factor)
    return groups


# =============================================================================
# BSF — Implicit inference (state_fluent/1)
# =============================================================================

class TestBSFImplicit:
    """
    BSF declared via state_fluent/1 without a type tag.
    The classifier must infer 'isf' from the grounded term structure.
    """

    def test_atomic_fluent_no_args(self):
        """
        state_fluent(defectuoso).
        An atom with no arguments (arity 0) must always be classified as ISF.
        """
        program = """
        state_fluent(defectuoso).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == ["defectuoso"]
        assert _ads_groups(schema) == {}
        assert schema.total_states == 2

    def test_unary_fluent_from_deterministic_facts(self):
        """
        state_fluent(marketed(X)) :- person(X).
        person(denis). person(thiago). person(fabio). person(leliane).

        This is the key regression test. marketed/1 has arity 1; each grounded
        instance is an independent Boolean variable. The classifier must NOT
        group them into an ADS just because they share the functor 'marketed'.
        Expected: 4 independent ISF factors, total_states = 2^4 = 16.
        """
        program = """
        state_fluent(marketed(X)) :- person(X).
        person(denis).
        person(thiago).
        person(fabio).
        person(leliane).
        """
        schema = _make_mdp(program).state_schema

        expected_isf = [
            "marketed(denis)",
            "marketed(fabio)",
            "marketed(leliane)",
            "marketed(thiago)",
        ]
        assert _isf_terms(schema) == expected_isf
        assert _ads_groups(schema) == {}
        assert schema.total_states == 16  # 2^4

    def test_single_atom_no_rule(self):
        """
        state_fluent(on). state_fluent(loaded). state_fluent(alive).
        Multiple independent atoms, each must be a separate ISF.
        """
        program = """
        state_fluent(on).
        state_fluent(loaded).
        state_fluent(alive).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == ["alive", "loaded", "on"]
        assert schema.total_states == 8  # 2^3

    def test_binary_fluent_cardinality_one_is_isf(self):
        """
        state_fluent(alarma(X, Y)) :- zona(X), estado_alarma(Y).
        zona(norte). zona(sur).
        0.1::estado_alarma(activada).

        Arity 2, but each static key (norte, sur) maps to exactly 1 value
        (activada). Cardinality = 1 per group → classified as ISF.
        Expected: 2 ISF factors (alarma(norte,activada), alarma(sur,activada)).
        """
        program = """
        state_fluent(alarma(X, Y)) :- zona(X), estado_alarma(Y).
        zona(norte).
        zona(sur).
        0.1::estado_alarma(activada).
        """
        schema = _make_mdp(program).state_schema

        expected_isf = [
            "alarma(norte,activada)",
            "alarma(sur,activada)",
        ]
        assert _isf_terms(schema) == expected_isf
        assert _ads_groups(schema) == {}
        assert schema.total_states == 4  # 2^2

    def test_mixed_implicit_isf_and_ads_arity2(self):
        """
        state_fluent(defectuoso).
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago). person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).

        defectuoso → ISF (arity 0).
        marketed/2 → 2 ADS groups, each with 2 options.
        Expected: 1 ISF, 2 ADS groups, total_states = 2 * 2 * 2 = 8.
        """
        program = """
        state_fluent(defectuoso).
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago).
        person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == ["defectuoso"]
        ads = _ads_groups(schema)
        assert "marketed(thiago)" in ads
        assert "marketed(denis)" in ads
        assert sorted(ads["marketed(thiago)"]) == ["marketed(thiago,internet)", "marketed(thiago,tv)"]
        assert schema.total_states == 8  # 2 * 2 * 2


# =============================================================================
# BSF — Explicit declaration (state_fluent/2 with tag 'bsf')
# =============================================================================

class TestBSFExplicit:
    """
    BSF declared via state_fluent/2 with the 'bsf' type tag.
    The explicit classifier must map the 'bsf' constant to 'isf' internally.
    """

    def test_explicit_bsf_atom(self):
        """
        state_fluent(defectuoso, bsf).
        Explicit binary declaration for a zero-argument atom.
        """
        program = """
        state_fluent(defectuoso, bsf).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == ["defectuoso"]
        assert schema.total_states == 2

    def test_explicit_bsf_via_rule(self):
        """
        state_fluent(marketed(X), bsf) :- person(X).
        person(thiago). person(denis).

        Explicit BSF for unary parametric fluents; equivalent to implicit
        inference but stated unambiguously by the user.
        Expected: 2 independent ISF factors.
        """
        program = """
        state_fluent(marketed(X), bsf) :- person(X).
        person(thiago).
        person(denis).
        """
        schema = _make_mdp(program).state_schema

        expected_isf = ["marketed(denis)", "marketed(thiago)"]
        assert _isf_terms(schema) == expected_isf
        assert _ads_groups(schema) == {}
        assert schema.total_states == 4  # 2^2

    def test_explicit_bsf_overrides_would_be_ads(self):
        """
        state_fluent(color(X), bsf) :- tipo(X).
        1/3::tipo(rojo); 1/3::tipo(verde); 1/3::tipo(azul).

        The origin is an annotated disjunction, but the user has explicitly
        tagged the fluent as 'bsf'. The explicit classifier takes precedence
        and must classify each grounded term as an independent ISF.
        Expected: 3 ISF factors, total_states = 2^3 = 8.
        """
        program = """
        state_fluent(color(X), bsf) :- tipo(X).
        1/3::tipo(rojo); 1/3::tipo(verde); 1/3::tipo(azul).
        """
        schema = _make_mdp(program).state_schema

        expected_isf = ["color(azul)", "color(rojo)", "color(verde)"]
        assert _isf_terms(schema) == expected_isf
        assert _ads_groups(schema) == {}
        assert schema.total_states == 8  # 2^3


# =============================================================================
# ADS — Implicit inference (state_fluent/1, arity >= 2, cardinality >= 2)
# =============================================================================

class TestADSImplicit:
    """
    ADS inferred automatically from grounded term structure via the
    Cardinality Rule (arity >= 2, group size >= 2 per static key).
    """

    def test_binary_fluent_cardinality_two_is_ads(self):
        """
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago). person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).

        Each static key (thiago, denis) maps to 2 values → ADS.
        Expected: 2 ADS groups, total_states = 2 * 2 = 4.
        """
        program = """
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago).
        person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == []
        ads = _ads_groups(schema)
        assert set(ads.keys()) == {"marketed(thiago)", "marketed(denis)"}
        assert sorted(ads["marketed(thiago)"]) == [
            "marketed(thiago,internet)", "marketed(thiago,tv)"
        ]
        assert schema.total_states == 4  # 2 * 2

    def test_ternary_fluent_multiple_static_keys(self):
        """
        state_fluent(sensor(X, Y, Z)) :- habitacion(X), dispositivo(Y), medicion(Z).
        habitacion(sala). habitacion(cocina).
        dispositivo(termometro). dispositivo(humo).
        1/3::medicion(alto); 1/3::medicion(bajo); 1/3::medicion(none).

        4 static keys, each with 3 values → 4 ADS groups.
        Expected: total_states = 3^4 = 81.
        """
        program = """
        state_fluent(sensor(X, Y, Z)) :- habitacion(X), dispositivo(Y), medicion(Z).
        habitacion(sala).
        habitacion(cocina).
        dispositivo(termometro).
        dispositivo(humo).
        1/3::medicion(alto); 1/3::medicion(bajo); 1/3::medicion(none).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == []
        ads = _ads_groups(schema)
        assert len(ads) == 4
        expected_keys = {
            "sensor(sala,termometro)",
            "sensor(sala,humo)",
            "sensor(cocina,termometro)",
            "sensor(cocina,humo)",
        }
        assert set(ads.keys()) == expected_keys
        for key in expected_keys:
            assert len(ads[key]) == 3
        assert schema.total_states == 81  # 3^4

    def test_binary_fluent_three_values_is_ads(self):
        """
        state_fluent(semaforo(X, Y)) :- cruce(X), color(Y).
        cruce(norte).
        1/3::color(rojo); 1/3::color(amarillo); 1/3::color(verde).

        1 static key, 3 values → 1 ADS group.
        """
        program = """
        state_fluent(semaforo(X, Y)) :- cruce(X), color(Y).
        cruce(norte).
        1/3::color(rojo); 1/3::color(amarillo); 1/3::color(verde).
        """
        schema = _make_mdp(program).state_schema

        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["semaforo(norte)"]
        assert sorted(ads["semaforo(norte)"]) == [
            "semaforo(norte,amarillo)",
            "semaforo(norte,rojo)",
            "semaforo(norte,verde)",
        ]
        assert schema.total_states == 3

    def test_compound_term_arity1_is_isf_not_ads(self):
        """
        state_fluent(pos(celda(X, Y))) :- coord(X), coord(Y).
        coord(1). coord(2).

        pos/1 has arity 1 even though celda(X,Y) is a compound argument.
        All grounded instances (pos(celda(1,1)), etc.) have arity 1 → ISF.
        This demonstrates that compound-term ADS requires an explicit 'ads' tag.
        Expected: 4 independent ISF factors, total_states = 2^4 = 16.
        """
        program = """
        state_fluent(pos(celda(X, Y))) :- coord(X), coord(Y).
        coord(1).
        coord(2).
        """
        schema = _make_mdp(program).state_schema

        expected_isf = [
            "pos(celda(1,1))",
            "pos(celda(1,2))",
            "pos(celda(2,1))",
            "pos(celda(2,2))",
        ]
        assert _isf_terms(schema) == expected_isf
        assert _ads_groups(schema) == {}
        assert schema.total_states == 16  # 2^4


# =============================================================================
# ADS — Explicit declaration (state_fluent/2 with tag 'ads')
# =============================================================================

class TestADSExplicit:
    """
    ADS declared via state_fluent/2 with the 'ads' type tag.
    Origin of values is irrelevant; only cardinality >= 2 is enforced.
    """

    def test_explicit_ads_unary_from_annotated_disjunction(self):
        """
        state_fluent(semaforo(X), ads) :- color(X).
        1/3::color(rojo); 1/3::color(amarillo); 1/3::color(verde).

        Arity 1 with explicit 'ads' tag. Origin is an AD (canonical case).
        The 3 grounded terms share functor 'semaforo' → 1 ADS group.
        Expected: total_states = 3.
        """
        program = """
        state_fluent(semaforo(X), ads) :- color(X).
        1/3::color(rojo); 1/3::color(amarillo); 1/3::color(verde).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == []
        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["semaforo"]
        assert sorted(ads["semaforo"]) == [
            "semaforo(amarillo)", "semaforo(rojo)", "semaforo(verde)"
        ]
        assert schema.total_states == 3

    def test_explicit_ads_unary_from_static_facts(self):
        """
        state_fluent(semaforo(X), ads) :- color(X).
        color(rojo). color(amarillo). color(verde).

        Same as above but origin is static facts (not an AD).
        Explicit 'ads' tag means origin is irrelevant; result must be identical.
        """
        program = """
        state_fluent(semaforo(X), ads) :- color(X).
        color(rojo).
        color(amarillo).
        color(verde).
        """
        schema = _make_mdp(program).state_schema

        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["semaforo"]
        assert sorted(ads["semaforo"]) == [
            "semaforo(amarillo)", "semaforo(rojo)", "semaforo(verde)"
        ]
        assert schema.total_states == 3

    def test_explicit_ads_compound_term(self):
        """
        state_fluent(pos(celda(X, Y)), ads) :- coord(X), coord(Y).
        coord(1). coord(2).

        Compound term with explicit 'ads'. All 4 instances share key 'pos'.
        Expected: 1 ADS group with 4 options, total_states = 4.
        """
        program = """
        state_fluent(pos(celda(X, Y)), ads) :- coord(X), coord(Y).
        coord(1).
        coord(2).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == []
        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["pos"]
        assert sorted(ads["pos"]) == [
            "pos(celda(1,1))",
            "pos(celda(1,2))",
            "pos(celda(2,1))",
            "pos(celda(2,2))",
        ]
        assert schema.total_states == 4

    def test_explicit_ads_multiarg_with_static_origins(self):
        """
        state_fluent(clima(X, Y, Z), ads) :- region(X), mes(Y), tipo(Z).
        region(norte). mes(enero).
        tipo(soleado). tipo(lluvioso).

        Multi-argument with explicit 'ads' and static (non-probabilistic) origins.
        The system must accept this and create 1 ADS group.
        Expected: total_states = 2.
        """
        program = """
        state_fluent(clima(X, Y, Z), ads) :- region(X), mes(Y), tipo(Z).
        region(norte).
        mes(enero).
        tipo(soleado).
        tipo(lluvioso).
        """
        schema = _make_mdp(program).state_schema

        ads = _ads_groups(schema)
        assert "clima(norte,enero)" in ads
        assert sorted(ads["clima(norte,enero)"]) == [
            "clima(norte,enero,lluvioso)", "clima(norte,enero,soleado)"
        ]
        assert schema.total_states == 2

    def test_explicit_ads_priority_over_implicit_isf(self):
        """
        state_fluent(color(X), ads) :- tipo(X).
        tipo(rojo). tipo(verde). tipo(azul).

        Without the 'ads' tag, color/1 would be classified as 3 independent ISFs.
        With the 'ads' tag, explicit channel takes priority and creates 1 ADS group.
        Expected: 0 ISF, 1 ADS group with 3 options, total_states = 3.
        """
        program = """
        state_fluent(color(X), ads) :- tipo(X).
        tipo(rojo).
        tipo(verde).
        tipo(azul).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == []
        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["color"]
        assert len(ads["color"]) == 3
        assert schema.total_states == 3


# =============================================================================
# Mixed schemas — BSF and ADS coexisting
# =============================================================================

class TestMixedSchema:
    """
    Programs that declare both ISF and ADS fluents. Validates that the
    schema correctly separates and registers both types simultaneously.
    """

    def test_isf_atoms_and_ads_group(self):
        """
        state_fluent(on).
        state_fluent(loaded).
        state_fluent(color(X), ads) :- tipo(X).
        tipo(rojo). tipo(verde).

        2 ISF atoms + 1 ADS group with 2 options.
        Expected: total_states = 2 * 2 * 2 = 8.
        """
        program = """
        state_fluent(on).
        state_fluent(loaded).
        state_fluent(color(X), ads) :- tipo(X).
        tipo(rojo).
        tipo(verde).
        """
        schema = _make_mdp(program).state_schema

        assert _isf_terms(schema) == ["loaded", "on"]
        ads = _ads_groups(schema)
        assert list(ads.keys()) == ["color"]
        assert schema.total_states == 8  # 2 * 2 * 2

    def test_implicit_isf_unary_and_implicit_ads_binary(self):
        """
        state_fluent(defectuoso).
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago). person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).

        1 ISF atom + 2 ADS groups.
        Expected: total_states = 2 * 2 * 2 = 8.
        """
        program = """
        state_fluent(defectuoso).
        state_fluent(marketed(X, Y)) :- person(X), mtype(Y).
        person(thiago).
        person(denis).
        1/2::mtype(tv); 1/2::mtype(internet).
        """
        schema = _make_mdp(program).state_schema

        assert "defectuoso" in _isf_terms(schema)
        ads = _ads_groups(schema)
        assert len(ads) == 2
        assert schema.total_states == 8


# =============================================================================
# Validation errors
# =============================================================================

class TestValidationErrors:
    """
    Programs that violate the syntax specification must raise ValueError
    with a descriptive message before the schema is constructed.
    """

    def test_unknown_type_tag_raises(self):
        """
        state_fluent(x, unknown).
        Only 'bsf' and 'ads' are valid tags. Any other value must raise ValueError.
        """
        program = """
        state_fluent(x, unknown).
        """
        with pytest.raises(ValueError, match="unknown"):
            _make_mdp(program)

    def test_explicit_ads_cardinality_one_raises(self):
        """
        state_fluent(semaforo(X), ads) :- color(X).
        color(verde).   % Only one value — invalid for ADS.

        ADS groups require base >= 2 for Mixed-Radix correctness.
        The system must raise ValueError and refuse to build the schema.
        """
        program = """
        state_fluent(semaforo(X), ads) :- color(X).
        color(verde).
        """
        with pytest.raises(ValueError, match="semaforo"):
            _make_mdp(program)

    def test_explicit_ads_hardcoded_single_term_raises(self):
        """
        state_fluent(semaforo(verde), ads).
        Hardcoded single-term ADS without a domain. Cardinality = 1 → invalid.
        """
        program = """
        state_fluent(semaforo(verde), ads).
        """
        with pytest.raises(ValueError, match="semaforo"):
            _make_mdp(program)

    def test_explicit_ads_multiarg_cardinality_one_raises(self):
        """
        state_fluent(clima(X, Y, Z), ads) :- region(X), mes(Y), tipo(Z).
        region(sur). mes(febrero). tipo(nublado).  % Only one value per key.
        """
        program = """
        state_fluent(clima(X, Y, Z), ads) :- region(X), mes(Y), tipo(Z).
        region(sur).
        mes(febrero).
        tipo(nublado).
        """
        with pytest.raises(ValueError, match="clima"):
            _make_mdp(program)