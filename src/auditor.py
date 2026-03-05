import random
from dataclasses import dataclass, field
from typing import List, Tuple, Optional

from src.fluent import StateSpace, ActionSpace, FluentMassConservationError


@dataclass
class AuditViolation:
    """Registro estructurado de una violación de conservación de masa."""
    state_index: int
    action_index: int
    factor_index: int
    factor_type: str              # 'bool' o 'multivalued'
    expected_mass: float
    actual_mass: float
    deviation: float
    factor_terms: List[str]
    term_probabilities: List[Tuple[str, float]]


class MDPAuditor:
    """
    Linter semántico externo para modelos MDP-ProbLog.

    Realiza validaciones de pre-vuelo sobre la salida cruda del motor WMC
    ANTES del filtro disperso, garantizando que errores de modelado del
    usuario se detecten antes de corromper Value Iteration.

    Consume la instancia MDP por inyección de dependencias sin
    modificar su estado interno.
    """

    def __init__(self, mdp):
        self._mdp = mdp
        self._states = StateSpace(mdp.state_schema)
        self._actions = ActionSpace(mdp.actions())

    def audit_mass_conservation(
        self,
        tolerance: float = 1e-9,
        sample_size: Optional[int] = None,
        seed: Optional[int] = None,
    ) -> List[AuditViolation]:
        """
        Audita la conservación de masa probabilística sobre pares (s, a).

        Para cada par, consulta la salida cruda del motor WMC y verifica:
        - Booleanos: p_true ∈ [-τ, 1+τ]
        - Multivaluados: |Σ p_j - 1.0| ≤ τ

        :param tolerance: umbral de desviación aceptable (default 1e-9)
        :param sample_size: si None, auditoría exhaustiva; si int, muestreo aleatorio
        :param seed: semilla para reproducibilidad del muestreo
        :returns: lista de violaciones detectadas (vacía si el modelo es correcto)
        """
        violations = []
        next_state_factors = self._mdp._next_state_factors

        # Determinar pares a auditar
        total_pairs = len(self._states) * len(self._actions)
        if sample_size is not None and sample_size < total_pairs:
            rng = random.Random(seed)
            all_indices = [(i, j) for i in range(len(self._states))
                          for j in range(len(self._actions))]
            pairs = rng.sample(all_indices, sample_size)
        else:
            pairs = [(i, j) for i in range(len(self._states))
                     for j in range(len(self._actions))]

        for state_idx, action_idx in pairs:
            state = self._states[state_idx]
            action = self._actions[action_idx]

            # Salida CRUDA del WMC — elude el filtro disperso
            # Cache Priming: almacena resultado en __transition_cache[(i,j)]
            cache_key = (state_idx, action_idx)
            raw_transitions = self._mdp.transition(state, action, cache=cache_key)
            prob_map = {str(term): prob for term, prob in raw_transitions}

            for k, factor in enumerate(next_state_factors):

                if len(factor) == 1:
                    # Factor booleano: verificar p_true ∈ [0, 1]
                    p_true = prob_map.get(str(factor[0]), 0.0)

                    if p_true < -tolerance or p_true > 1.0 + tolerance:
                        deviation = max(0.0, p_true - 1.0) + max(0.0, -p_true)
                        violations.append(AuditViolation(
                            state_index=state_idx,
                            action_index=action_idx,
                            factor_index=k,
                            factor_type='bool',
                            expected_mass=1.0,
                            actual_mass=p_true,
                            deviation=deviation,
                            factor_terms=[str(factor[0])],
                            term_probabilities=[(str(factor[0]), p_true)],
                        ))

                else:
                    # Factor multivaluado: verificar Σ p_j = 1.0
                    term_probs = []
                    mass = 0.0
                    for term in factor:
                        p = prob_map.get(str(term), 0.0)
                        term_probs.append((str(term), p))
                        mass += p

                    deviation = abs(1.0 - mass)
                    if deviation > tolerance:
                        violations.append(AuditViolation(
                            state_index=state_idx,
                            action_index=action_idx,
                            factor_index=k,
                            factor_type='multivalued',
                            expected_mass=1.0,
                            actual_mass=mass,
                            deviation=deviation,
                            factor_terms=[str(t) for t in factor],
                            term_probabilities=term_probs,
                        ))

        return violations

    @staticmethod
    def format_report(violations: List[AuditViolation]) -> str:
        """Genera un reporte diagnóstico legible de las violaciones detectadas."""
        lines = []
        lines.append("=" * 64)
        lines.append(" Mass Conservation Audit Report")
        lines.append("=" * 64)

        if not violations:
            lines.append("No violations detected. Model is consistent.")
            lines.append("=" * 64)
            return "\n".join(lines)

        lines.append(f"Found {len(violations)} violation(s).\n")

        for i, v in enumerate(violations, 1):
            lines.append(f"[Violation {i}] state={v.state_index}, "
                         f"action={v.action_index}, "
                         f"factor={v.factor_index} ({v.factor_type})")

            if v.factor_type == 'bool':
                lines.append(f"  Term: {v.factor_terms[0]}")
                lines.append(f"  p_true = {v.actual_mass:.10f}")
                lines.append(f"  Bounds violation: p_true must be in [0.0, 1.0]")
            else:
                lines.append(f"  Terms: {v.factor_terms}")
                for term_str, prob in v.term_probabilities:
                    lines.append(f"    {term_str} = {prob:.10f}")
                lines.append(f"  Mass: {v.actual_mass:.10f} "
                             f"(expected 1.0, deviation {v.deviation:.2e})")

            lines.append("")

        lines.append("=" * 64)
        return "\n".join(lines)

    def raise_on_violation(
        self,
        tolerance: float = 1e-9,
        sample_size: Optional[int] = None,
        seed: Optional[int] = None,
    ) -> None:
        """
        Ejecuta auditoría y lanza FluentMassConservationError si hay violaciones.

        Wrapper de conveniencia que recolecta todas las violaciones,
        genera el reporte diagnóstico completo, y lanza la excepción
        con el mensaje formateado.
        """
        violations = self.audit_mass_conservation(tolerance, sample_size, seed)
        if violations:
            report = self.format_report(violations)
            raise FluentMassConservationError(
                f"Se detectaron {len(violations)} violación(es) de conservación "
                f"de masa probabilística.\n\n{report}"
            )
