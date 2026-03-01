class MDPProbLogError(Exception):
    """Excepción base para todos los errores de MDP-ProbLog."""


class FluentDeclarationError(MDPProbLogError):
    """Error en la declaración sintáctica de un fluente (state_fluent/2).
    Causas: etiqueta desconocida, índice mal formado."""


class FluentAmbiguityError(MDPProbLogError):
    """Ambigüedad irreducible en la clasificación de un fluente.
    Causa: state_fluent/1 con aridad >= 2 donde al menos un argumento
    proviene de una Disyunción Anotada. La intención (Interpretación A
    o B) no puede determinarse sin declaración explícita."""


class FluentInferenceError(MDPProbLogError):
    """Fallo en la inferencia automática (state_fluent/1).
    Causas: origen del argumento indeterminado o inconsistente."""


class FluentCardinalityError(MDPProbLogError):
    """Grupo enum con cardinalidad insuficiente.
    Causa: grupo enum con menos de 2 opciones tras el grounding."""
