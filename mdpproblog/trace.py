# This file is part of MDP-ProbLog.
#
# MDP-ProbLog is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# MDP-ProbLog is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with MDP-ProbLog.  If not, see <http://www.gnu.org/licenses/>.

import logging
import time
from mdpproblog.fluent import FluentClassifier

_engine_logger = logging.getLogger('mdpproblog.engine')
_fluent_logger = logging.getLogger('mdpproblog.fluent')
_mdp_logger = logging.getLogger('mdpproblog.mdp')
_vi_logger = logging.getLogger('mdpproblog.vi')


def _count_node_types(engine):
    """
    Count node types in the ClauseDB.
    Returns a dictionary with counts of facts, clauses and ADs.
    """
    counts = {'facts': 0, 'clauses': 0, 'ads': 0}
    for instr in engine._db._ClauseDB__nodes:
        node_type = type(instr).__name__
        if node_type == 'fact':
            counts['facts'] += 1
        elif node_type == 'clause':
            counts['clauses'] += 1
        elif node_type == 'choice':
            counts['ads'] += 1
    return counts

def _format_counts(type_counts):
    """
    Format node type counts into a readable string.
    Example: "14 facts, 8 clauses, 3 ADs"
    """
    items = [
        (type_counts.get('facts', 0),   'facts'),
        (type_counts.get('clauses', 0), 'clauses'),
        (type_counts.get('ads', 0),     'ADs'),
    ]
    parts = [f"{count} {label}" for count, label in items if count > 0]
    return ", ".join(parts) if parts else "0 nodes"

def trace_compilation(mdp):
    """
    Wrapper que envuelve _compile_queries() del MDP.
    Solo se encarga del timing y logging.
    """
    t0 = time.perf_counter()

    # Ejecutamos el método real de MDP
    next_map, reward_map = mdp._compile_queries()

    elapsed = time.perf_counter() - t0

    backend = mdp._engine._backend

    _engine_logger.debug("Compilation: %.3fs - %s", elapsed, backend)

    n_next = len(next_map)
    if n_next <= 30:
        _engine_logger.debug("Next state fluents mapping (%d terms):", n_next)
        for term, node in sorted(next_map.items(), key=str):
            _engine_logger.debug("  %s - node %s", term, node)
    else:
        _engine_logger.debug("Next state fluents mapping: %d terms", n_next)

    # === Mapeo de Rewards / Utilities ===
    n_reward = len(reward_map)
    if n_reward <= 30:
        _engine_logger.debug("Reward utilities mapping (%d terms):", n_reward)
        for term, node in sorted(reward_map.items(), key=str):
            _engine_logger.debug("  %s - node %s", term, node)
    else:
        _engine_logger.debug("Reward utilities mapping: %d terms", n_reward)

    return next_map, reward_map

def trace_classification(engine):
    """
    Run classification and log per-fluent decisions.
    """
    t0 = time.perf_counter()

    classifier = FluentClassifier(engine)
    schema = classifier.classify()

    elapsed = time.perf_counter() - t0

    _fluent_logger.debug("Classification: %.3fs", elapsed)

    explicit_set = {str(t) for t in classifier._explicit_fluents.keys()}
    full_registry = classifier._last_registry

    _fluent_logger.debug("  Found %d explicit fluents", len(explicit_set))
    _fluent_logger.debug("  Found %d implicit fluents", len(full_registry) - len(explicit_set))

    for term_str in sorted(full_registry.keys()):
        term, ftype = full_registry[term_str]
        mode = "explicit" if term_str in explicit_set else "implicit"
        _fluent_logger.debug("  %-20s %-10s -   %s", term_str, mode, ftype)

    ad_count = len(classifier._ads_inverted_index)
    _fluent_logger.debug("  Annotated Disjunctions detected: %d", ad_count)

    return schema

def trace_parsing(engine, elapsed):
    """
    Loguea resultados del parsing inicial (fase 1).
    Se llama después de Engine.__init__().
    
    Salida esperada:
    [mdpproblog.engine]  Parsing: 0.012s - ClauseDB: 267 nodes (11 facts, 37 clauses, 21 ADs)
    """
    nodes = engine.node_count
    type_counts = _count_node_types(engine)

    _engine_logger.debug(
        "Parsing: %.3fs - ClauseDB: %d nodes (%s)",
        elapsed,
        nodes,
        _format_counts(type_counts)
    )

def trace_injection(mdp):
    """
    Wrapper completo de inyección.
    - Ejecuta la inyección real (_inject_dummy_facts)
    - Loguea delta de nodos
    - Loguea detalle inteligente de factores y acciones
    """
    engine = mdp._engine
    schema = mdp.state_schema
    actions = mdp.actions()

    pre_count = engine.node_count
    mdp._inject_dummy_facts()
    post_count = engine.node_count

    _mdp_logger.debug("Injection: %d nodes added", 
                      post_count - pre_count)

    _mdp_logger.debug("Injection summary: %d state factor(s), %d action(s)", 
                      len(schema.factors), len(actions))
    
    for i, factor in enumerate(schema.factors):
        if len(factor) == 1:
            _mdp_logger.debug(" - Factor %-2d [bool]   0.5::%s(0)", i, factor[0])
        else:
            n = len(factor)
            if n <= 8:
                terms = ", ".join(str(t) for t in factor)
                _mdp_logger.debug(" - Factor %-2d [AD]    {%s} uniform 1/%d probability", i, terms, n)
            else:
                _mdp_logger.debug(" - Factor %-2d [AD]    {%d options} uniform 1/%d probability", i, n, n)

    if actions:
        n = len(actions)
        if n <= 8:
            terms = ", ".join(str(a) for a in actions)
            _mdp_logger.debug(" - Actions   [AD]    {%s} uniform 1/%d probability", terms, n)
        else:
            _mdp_logger.debug(" - Actions   [AD]    {%d actions} uniform 1/%d probability", n, n)


def trace_grounding(engine, queries):
    """
    Envuelve engine.relevant_ground(queries) y loguea métricas del grounding.
    
    Muestra:
    - Cantidad de queries antes de groundear
    - Tiempo que tomó el grounding
    - atomcount, named nodes y número de queries en el programa aterrizado
    """
    _engine_logger.debug("Grounding %d queries...", len(queries))

    t0 = time.perf_counter()
    engine.relevant_ground(queries)
    elapsed = time.perf_counter() - t0

    gp = engine._gp

    # Métricas del grounded program
    atomcount = gp.atomcount
    named_count = len(list(gp.get_names()))
    query_count = len(list(gp.queries()))

    _engine_logger.debug(
        "Grounding: %.3fs - %d atoms, %d named, %d queries",
        elapsed, atomcount, named_count, query_count
    )

# VALUE ITERATION

def trace_vi_iteration(iteration, residual, elapsed):
    """
    Loguea una iteración individual de Value Iteration.
    """
    _vi_logger.debug(
        "Iteration %2d: residual=%.6f  time=%.3fs",
        iteration, residual, elapsed
    )

def trace_vi_summary(iterations, residual, threshold, transition_hits, reward_hits, total_pairs):
    """ 
    Loguea el resumen final de convergencia y estadísticas de caché.
    """
    _vi_logger.debug(
        "Converged: %d iterations, final residual=%.6f (threshold=%.6f)",
        iterations, residual, threshold
    )
    _vi_logger.debug(
        "Cache: transitions %d/%d hits, rewards %d/%d hits",
        transition_hits, total_pairs,
        reward_hits, total_pairs
    )
