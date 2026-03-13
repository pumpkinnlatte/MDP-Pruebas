# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Ejecución

Activar el entorno virtual antes de correr cualquier cosa:

```bash
source .venv/bin/activate
python main.py
```

El modelo a resolver se selecciona modificando la variable `prog_dir` al final de `main.py`. Apuntarla a cualquier archivo `.pl` bajo `tests/model_tests/`.

Las salidas de debug (matrices de transición, recompensas, tabla Q, historial de convergencia, volcados de ClauseDB) se escriben automáticamente en `src/debug/` en cada ejecución.

## Qué es este proyecto

**MDP-ProbLog**: framework para modelar y resolver Procesos de Decisión de Markov (MDPs) de horizonte infinito mediante programación lógica probabilística. Los dominios MDP se especifican en sintaxis Prolog/ProbLog (`.pl`). El motor convierte esa especificación declarativa en inferencia probabilística via *Weighted Model Counting* (WMC) sobre circuitos lógicos compilados.

La documentación técnica detallada vive en `docs/`:
- `docs/Nueva_Arquitectura_mdpproblog.md` — arquitectura completa del sistema
- `docs/Arquitectura_inferencia_clasificacion_fluentes.md` — pipeline de clasificación de fluentes
- `docs/bool_sintaxis.txt` / `docs/multivalued-sintaxis.txt` — sintaxis de los modelos `.pl`

## Arquitectura

### Flujo de datos

```
Programa Prolog (.pl)
        │
        ▼
┌──────────────┐     ┌──────────────────┐     ┌──────────────┐
│   Engine     │────▶│ FluentClassifier │────▶│ FluentSchema │
│ (adapter     │     │ (validación +    │     │ (estructura  │
│  ProbLog)    │     │  inferencia)     │     │  factorizada)│
└──────┬───────┘     └──────────────────┘     └──────┬───────┘
       │                                             │
       ▼                                             ▼
┌──────────────┐     ┌──────────────────┐     ┌──────────────┐
│     MDP      │────▶│ ValueIteration   │────▶│  V*, π*, Q*  │
│  (puente     │     │ (Bellman backups │     │  (solución)  │
│   central)   │     │  sobre espacios) │     │              │
└──────────────┘     └──────────────────┘     └──────────────┘
```

### Módulos

**`src/engine.py` — `Engine`**
Adapter sobre `DefaultEngine` de ProbLog. Gestiona tres etapas internas del pipeline de compilación:
- `_db` (`ClauseDB`): tabla de instrucciones indexada — modelo original + inyecciones de hechos dummy
- `_gp` (`LogicFormula`): programa proposicional aterrizado (grafo AND-OR)
- `_knowledge` (`Evaluatable`): circuito lógico compilado (SDD/d-DNNF) para evaluación polinomial

Expone API de consulta (`declarations`, `assignments`), inyección (`add_fact`, `add_annotated_disjunction`, etc.), grounding (`relevant_ground`), compilación (`compile`) y evaluación WMC (`evaluate`). También genera el índice invertido de Disyunciones Anotadas con `get_ads_metadata()`.

**`src/fluent/classification.py` — `FluentClassifier`**
Orquestador que clasifica cada fluente declarado en uno de dos tipos:
- `bool`: variable binaria independiente → factor de base 2 en el schema
- `multivalued`: grupo mutuamente excluyente de N opciones → factor de base N (one-hot)

La clasificación opera en tres fases: (1) validación estática, (2) registro explícito (`state_fluent/2`) e inferencia implícita (`state_fluent/1` — consulta el índice invertido de ADs), (3) distribución al schema y validación de cardinalidad. Los errores se acumulan por fase y se lanzan agrupados.

**`src/fluent/schema.py` — `Fluent`, `FluentSchema`**
Estructuras de datos puras. `FluentSchema` describe el espacio de estados como sistema de numeración **mixed-radix**: cada factor tiene base `b_i`, los strides son `[1, b_0, b_0·b_1, ...]`, y el espacio total tiene `∏ b_i` estados. Los términos almacenados son atemporales; las copias temporales (`term(args, t)`) se producen bajo demanda con `Fluent.create_fluent(term, timestep)`.

**`src/fluent/spaces.py` — `StateSpace`, `ActionSpace`**
Iteradores sobre el espacio factorizado usando la codificación mixed-radix del schema. `StateSpace` itera sobre estados con términos temporales (timestep=0 por defecto). `ActionSpace` envuelve las acciones como un único factor multivalued sin timestep. Ambas soportan acceso por índice (`space[i]`) y codificación inversa (`space.index(valuation)`).

**`src/mdp.py` — `MDP`**
Puente central. El constructor ejecuta `__prepare()`, que:
1. Corre `FluentClassifier` → obtiene `state_schema`
2. Inyecta hechos dummy en la ClauseDB: bool como `add_fact(term_t0, 0.5)`, multivalued como `add_annotated_disjunction` con probabilidades uniformes; igual para las acciones
3. Ejecuta `relevant_ground` con queries que incluyen **también los fluentes t=0** (crítico: garantiza que ProbLog preserva sus nombres para poder sustituir evidencia)
4. Compila y mapea fluentes t=1 y utilidades a nodos del circuito

Las evaluaciones de `transition()` y `reward()` pasan el estado y la acción como evidencia al evaluador WMC. `structured_transition()` agrupa la salida por factores del schema y filtra ramas con probabilidad < 1e-6 (filtrado sparse), produciendo la estructura `list[list[(Term|None, float)]]` que consume Value Iteration. Ambos métodos tienen caché indexado por `(state_idx, action_idx)`.

**`src/value_iteration.py` — `ValueIteration`**
Backups de Bellman síncronos sobre índices enteros. El valor esperado futuro se calcula recursivamente sobre el árbol estocástico factorizado (`__expected_value`), acumulando el índice de estado destino con `local_index * stride[k]` en cada nivel. Criterio de convergencia: `max_residual ≤ 2ε(1-γ)/γ`. Soporta auditoría pre-vuelo (`audit=True`) vía `MDPAuditor`.

**`src/auditor.py` — `MDPAuditor`**
Linter semántico. Verifica conservación de masa probabilística sobre la salida cruda del WMC (antes del filtro sparse): factores bool requieren `p ∈ [0,1]`, factores multivalued requieren `Σ p_j = 1.0`. Lanza `FluentMassConservationError` con reporte diagnóstico si detecta violaciones.

**`src/debugger.py` — `MDPDebugger`, `CPTAnalyzer`**
Utilidades de exportación a `src/debug/`. `MDPDebugger` vuelca la ClauseDB, el schema, las matrices de transición densas, la matriz de recompensas, la tabla Q* y el historial de convergencia de Bellman.

## Sintaxis de modelos MDP (`.pl`)

| Predicado | Rol |
|-----------|-----|
| `state_fluent(f).` | Fluente implícito (tipo inferido automáticamente) |
| `state_fluent(f, bool).` | Fluente booleano explícito |
| `state_fluent(f, multivalued).` | Fluente multivaluado explícito |
| `action(a).` | Declaración de acción |
| `utility(term, value).` | Asignación de utilidad/recompensa |
| `P::fluente(args, 1) :- fluente(args, 0), accion, ...` | Regla de transición (t=0 → t=1) |

Los fluentes son atemporales en el schema; se temporalizan añadiendo el timestep como último argumento: `fluente(args, 0)` = estado actual (evidencia), `fluente(args, 1)` = siguiente estado (query). **No hay axioma de inercia**: la persistencia debe escribirse explícitamente.

Los modelos de prueba se organizan en `tests/model_tests/` por tipo: `boolean/`, `multivalued/`, `multi-factor/`, `mobile_robot/`, `rn_gridworld/`. Los modelos base de referencia están en `tests/model_tests/mitchell_grid/base_models/`.
