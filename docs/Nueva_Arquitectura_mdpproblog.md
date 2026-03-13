# Nueva arquitectura de MDP-ProbLog

Documentación técnica de la arquitectura completa del sistema MDP-ProbLog: estructura de módulos, ciclo de vida computacional, motor de inferencia probabilística y algoritmo de resolución.

---

## 1. Visión General

MDP-ProbLog es un framework construido sobre ProbLog para modelar y resolver Procesos de Decisión de Markov (MDPs) de horizonte infinito mediante programación lógica probabilística. El sistema transforma una especificación declarativa en Prolog — que define estados, acciones, transiciones y recompensas — en un problema de inferencia probabilística resuelto mediante *Weighted Model Counting* (WMC) sobre circuitos lógicos compilados.

### Flujo de datos de alto nivel

```
Programa Prolog (.pl)
        │
        ▼
┌──────────────┐     ┌──────────────────┐     ┌──────────────┐
│   Engine     │────▶│ FluentClassifier │────▶│ FluentSchema │
│  (adapter    │     │ (validación +    │     │ (estructura  │
│   ProbLog)   │     │  inferencia)     │     │  factorizada)│
└──────┬───────┘     └──────────────────┘     └──────┬───────┘
       │                                             │
       ▼                                             ▼
┌──────────────┐     ┌──────────────────┐     ┌──────────────┐
│     MDP      │────▶│ ValueIteration   │────▶│  V*, π*, Q*  │
│  (puente     │     │ (Bellman backups │     │  (solución)  │
│   central)   │     │  sobre espacios) │     │              │
└──────────────┘     └──────────────────┘     └──────────────┘
```

---

## 2. Estructura del Proyecto

```
src/
├── engine.py             # Adapter a ProbLog (ClauseDB, grounding, compilación, evaluación)
├── mdp.py                # Clase MDP: puente central entre el modelo y el solver
├── value_iteration.py    # Algoritmo de Value Iteration enumerativo
├── debugger.py           # Utilidades de inspección y exportación (MDPDebugger, CPTAnalyzer)
└── fluent/               # Subpaquete: dominio de fluentes de estado
    ├── __init__.py        # Re-exporta la API pública del subpaquete
    ├── schema.py          # FluentSchema, Fluent (estructuras de datos puras)
    ├── spaces.py          # FactorSpace, StateSpace, ActionSpace (iteración mixed-radix)
    ├── classification.py  # FluentClassifier (validación, inferencia, ensamblaje)
    └── exceptions.py      # Jerarquía de excepciones del dominio
```

### Grafo de dependencias entre módulos

```
main.py
  ├── src.mdp         → MDP
  ├── src.engine       → Engine
  ├── src.fluent       → Fluent, FluentSchema, StateSpace, ActionSpace
  ├── src.value_iteration → ValueIteration
  └── src.debugger     → MDPDebugger, CPTAnalyzer

src.mdp
  ├── src.engine       → Engine
  ├── src.fluent       → Fluent, FluentSchema, StateSpace, ActionSpace, FluentClassifier
  └── src.debugger     → MDPDebugger

src.value_iteration
  └── src.fluent       → StateSpace, ActionSpace

src.fluent.classification
  ├── src.fluent.schema     → FluentSchema
  └── src.fluent.exceptions → FluentDeclarationError, FluentCardinalityError

src.fluent.spaces
  └── src.fluent.schema     → FluentSchema

src.debugger
  └── src.fluent       → StateSpace, ActionSpace, Fluent
```

---

## 3. Módulos del Sistema

### 3.1 `src/engine.py` — Adapter a ProbLog

La clase `Engine` encapsula el motor de inferencia de ProbLog y expone una interfaz simplificada para las operaciones que MDP-ProbLog necesita. Internamente gestiona tres objetos de ProbLog que representan las etapas del pipeline de compilación.

#### Atributos internos

| Atributo | Tipo ProbLog | Descripción |
|---|---|---|
| `_engine` | `DefaultEngine` | Motor de grounding y evaluación |
| `_db` | `ClauseDB` | Tabla de instrucciones indexada (modelo + inyecciones) |
| `_gp` | `LogicFormula` | Programa proposicional aterrizado (grafo AND-OR) |
| `_knowledge` | `Evaluatable` | Circuito lógico compilado (SDD/d-DNNF) |

#### API de consulta

| Método | Retorno | Descripción |
|---|---|---|
| `declarations(type)` | `list[Term]` | Términos declarados con predicado unario `type/1` |
| `assignments(type)` | `dict[Term, Term]` | Pares clave-valor de predicado binario `type/2` |
| `get_ads_metadata()` | `dict[str, set[int]]` | Índice invertido de valores originados en Disyunciones Anotadas |

`declarations` consulta la ClauseDB buscando hechos del tipo `predicado(X)` y retorna la lista de `X`. `assignments` busca hechos del tipo `predicado(X, Y)` y retorna el diccionario `{X: Y}`. Ambos métodos delegan al `DefaultEngine.query`.

#### API de inyección

El `Engine` permite modificar la ClauseDB después de la carga inicial del programa:

| Método | Efecto |
|---|---|
| `add_fact(term, probability)` | Inyecta un hecho probabilístico en la ClauseDB |
| `add_rule(head, body)` | Inyecta una regla lógica `head :- body` |
| `add_assignment(term, value)` | Inyecta un hecho `utility(term, value)` |
| `add_annotated_disjunction(facts, probs)` | Inyecta una AD: grupo de hechos mutuamente excluyentes con probabilidades |

#### API de inferencia

| Método | Descripción |
|---|---|
| `relevant_ground(queries)` | Aterriza el programa respecto a la lista de consultas dada |
| `compile(terms)` | Compila la fórmula aterrizada y mapea términos a nodos del circuito |
| `evaluate(queries, evidence)` | Evalúa probabilidades marginales dado un conjunto de evidencia |

El método `evaluate` instancia un `Evaluator` que realiza *Weighted Model Counting* sobre el circuito compilado, aplicando los pesos de evidencia para calcular probabilidades condicionales.

#### `get_ads_metadata()`

Recorre linealmente la tabla de instrucciones de la ClauseDB buscando nodos de tipo `choice` (nodos internos de las Disyunciones Anotadas de ProbLog). Para cada nodo, extrae el término contenido en `node.functor.args[2]` y registra sus argumentos en un índice invertido: `{valor_string → {group_id_1, group_id_2, ...}}`. Este índice es consumido por el `FluentClassifier` para determinar si los valores de un fluente se originan en una AD.

### 3.2 `src/fluent/` — Subpaquete de Fluentes

Contiene toda la lógica del dominio de fluentes de estado. Organizado por responsabilidad en cuatro módulos internos con un `__init__.py` que re-exporta la API pública.

> La documentación detallada de este subpaquete se encuentra en [Arquitectura_inferencia_clasificacion_fluentes.md](Arquitectura_inferencia_clasificacion_fluentes.md).

#### Resumen de componentes

| Módulo | Clase(s) | Responsabilidad |
|---|---|---|
| `schema.py` | `Fluent`, `FluentSchema` | Estructuras de datos: factory de términos temporales y descriptor factorizado del espacio de estados |
| `spaces.py` | `FactorSpace`, `StateSpace`, `ActionSpace` | Iteración mixed-radix: codificación/decodificación de valuaciones enteras sobre el espacio factorizado |
| `classification.py` | `FluentClassifier` | Pipeline de clasificación: validación, inferencia de tipo (bool/multivalued) y ensamblaje del schema |
| `exceptions.py` | `MDPProbLogError` y derivadas | Jerarquía de excepciones del dominio de fluentes |

#### Representación de estados

El `FluentSchema` define el espacio de estados como un producto de factores independientes:

- **Bool** (base 2): Variable binaria. Un factor por cada fluente booleano.
- **Multivalued** (base N): Grupo mutuamente excluyente de N opciones. Exactamente una activa (codificación one-hot).

El tamaño total del espacio de estados es el producto de todas las bases: `∏ b_i`. La iteración utiliza un sistema de numeración mixed-radix con strides posicionales `[1, b_1, b_1·b_2, ...]` para convertir entre índices enteros y valuaciones (OrderedDict de términos a valores).

### 3.3 `src/mdp.py` — Clase MDP

La clase `MDP` es el puente central entre el modelo Prolog del usuario y el solver. Coordina la inicialización del motor, la clasificación de fluentes, la inyección de hechos dummy y la evaluación de transiciones y recompensas.

#### Constructor e inicialización

```python
class MDP:
    def __init__(self, model):
        self._model = model
        self._engine = Engine(model)
        self.__transition_cache = {}
        self.__reward_cache = {}
        self.__prepare()
```

El constructor recibe el programa Prolog como string, instancia el `Engine` y ejecuta `__prepare()`.

#### `__prepare()` — Pipeline de preparación

Este método ejecuta la secuencia completa de preparación en cinco etapas:

**Etapa 1 — Clasificación de fluentes:**

```python
classifier = FluentClassifier(self._engine)
self.state_schema = classifier.classify()
```

Delega al `FluentClassifier` la extracción, validación e inferencia de todos los fluentes de estado declarados en el programa. El resultado es un `FluentSchema` que codifica la estructura factorizada del espacio de estados.

**Etapa 2 — Inyección de hechos dummy (t=0):**

Para cada factor del schema, se inyectan hechos en la ClauseDB que representan el estado actual (timestep 0):

- **Bool**: Se inyecta como hecho probabilístico con `add_fact(fluent_term, 0.5)`. La probabilidad 0.5 es neutral — será sustituida por evidencia (0.0 o 1.0) durante la evaluación.
- **Multivalued**: Se inyecta como Disyunción Anotada con probabilidades uniformes `1/N` via `add_annotated_disjunction`. Esto crea nodos `choice` internos que actúan como raíces estocásticas del grafo.

```python
for factor in self.state_schema.factors:
    if len(factor) == 1:
        fluent_term = Fluent.create_fluent(factor[0], 0)
        self._engine.add_fact(fluent_term, 0.5)
    else:
        ad_states = [Fluent.create_fluent(term, 0) for term in factor]
        self._engine.add_annotated_disjunction(ad_states, [1.0/len(ad_states)] * len(ad_states))
```

**Etapa 3 — Inyección de acciones:**

Las acciones se obtienen con `declarations('action')` y se inyectan como una única Disyunción Anotada con probabilidades uniformes.

**Etapa 4 — Grounding relevante:**

Se construye la lista de queries que preserva los nombres de todos los términos necesarios:

```python
queries = list(set(utilities) | set(next_state_fluents) | set(actions) | set(current_state_fluents))
self._engine.relevant_ground(queries)
```

Incluir los fluentes de estado actual (t=0) en la lista de queries es crítico: garantiza que ProbLog no optimice sus nombres durante el grounding, permitiendo que el evaluador los localice por su identificador lógico original.

**Etapa 5 — Compilación:**

Los fluentes de siguiente estado (t=1) y las utilidades se compilan en nodos del circuito:

```python
self.__next_state_queries = self._engine.compile(next_state_fluents)
self.__reward_queries = self._engine.compile(self.__utilities)
```

#### API del MDP

| Método | Retorno | Descripción |
|---|---|---|
| `state_fluents()` | `list[Term]` | Lista plana de fluentes atemporales del schema |
| `current_state_fluents()` | `list[Term]` | Fluentes estampados a t=0 |
| `next_state_fluents()` | `list[Term]` | Fluentes estampados a t=1 |
| `actions()` | `list[Term]` | Acciones declaradas, ordenadas alfabéticamente |
| `transition(state, action, cache)` | `list[(Term, float)]` | Probabilidades marginales de transición P(x'_i \| x, a) |
| `structured_transition(state, action, cache)` | `list[list[(Term, float)]]` | Transiciones agrupadas por factor del schema |
| `reward(state, action, cache)` | `float` | Recompensa inmediata esperada R(x, a) |

#### `transition()` y `__transition()`

Evalúa las probabilidades marginales de cada fluente en t=1 dado un estado y una acción:

```python
def __transition(self, state, action):
    evidence = state.copy()
    evidence.update(action)
    return self._engine.evaluate(self.__next_state_queries, evidence)
```

La evidencia es la unión de la valuación del estado actual y la valuación de la acción. El evaluador sustituye los pesos de los nodos correspondientes en el circuito compilado y calcula las probabilidades marginales.

#### `structured_transition()`

Transforma la salida plana de `transition()` en una estructura agrupada por factores del schema. Para cada factor:

- **Bool**: Extrae `P(true)` del mapa de probabilidades y calcula `P(false) = 1 - P(true)`. Filtra ramas con probabilidad < 1e-6.
- **Multivalued**: Extrae la probabilidad de cada opción del grupo. Filtra opciones con probabilidad < 1e-6.

El resultado es una lista de listas: `[[( Term|None, prob), ...], ...]`, donde cada lista interna representa un factor y cada tupla es una rama activa. El `None` en factores bool representa la rama False.

Esta representación factorizada es consumida por `ValueIteration.__expected_value()` para calcular el valor esperado futuro mediante recursión sobre el árbol estocástico.

#### `reward()` y `__reward()`

Calcula la recompensa inmediata esperada como la suma ponderada de las utilidades:

```python
def __reward(self, state, action):
    evidence = state.copy()
    evidence.update(action)
    total = 0
    for term, prob in self._engine.evaluate(self.__reward_queries, evidence):
        total += prob * self.__utilities[term].value
    return total
```

#### Caché de transiciones y recompensas

Tanto `transition()` como `reward()` aceptan un parámetro `cache` opcional. Cuando se proporciona, el resultado se almacena en un diccionario interno (`__transition_cache` o `__reward_cache`) indexado por la clave de caché. En Value Iteration, la clave es la tupla `(state_index, action_index)`.

### 3.4 `src/value_iteration.py` — Algoritmo de Resolución

Implementación del algoritmo enumerativo de *Value Iteration* con backups de Bellman síncronos para MDPs de horizonte infinito con factor de descuento.

#### Interfaz

```python
class ValueIteration:
    def __init__(self, mdp):
        self._mdp = mdp

    def run(self, gamma=0.9, epsilon=0.1):
        # → (V, policy, Q_table, V_history, iterations)
```

#### Algoritmo `run()`

El método ejecuta iteraciones de Bellman síncronas hasta convergencia:

```
Repetir:
    Para cada estado s (índice i):
        Para cada acción a (índice j):
            T ← mdp.structured_transition(s, a)
            R ← mdp.reward(s, a)
            Q(s,a) ← R + γ · E_V(T)
        V(s) ← max_a Q(s,a)
        π(s) ← argmax_a Q(s,a)
    Hasta que max_s |V_new(s) - V_old(s)| ≤ 2ε(1-γ)/γ
```

**Criterio de convergencia**: El residuo máximo se compara contra `2ε(1-γ)/γ`, que garantiza que la política greedy resultante es ε-óptima.

#### `__expected_value()` — Valor esperado futuro

Calcula recursivamente el valor esperado futuro recorriendo el árbol estocástico definido por la transición factorizada:

```python
def __expected_value(self, transition_groups, strides, V, k=0, current_index=0, joint=1.0):
    if len(transition_groups) == k:
        return joint * V.get(current_index, 0.0)

    factor = transition_groups[k]
    stride = strides[k]
    expected_sum = 0.0

    for term, prob in factor:
        val = self._mdp.state_schema.get_local_index(k, term)
        expected_sum += self.__expected_value(
            transition_groups, strides, V,
            k + 1, current_index + val * stride, joint * prob
        )
    return expected_sum
```

La recursión recorre los factores de izquierda a derecha. En cada nivel `k`:

1. Para cada rama activa `(term, prob)` del factor `k`:
   - Se obtiene el índice local del término via `FluentSchema.get_local_index`.
   - Se acumula al índice global: `current_index + local_index * stride[k]`.
   - Se multiplica la probabilidad conjunta: `joint * prob`.
2. Al llegar al caso base (`k == num_factors`), se retorna `joint * V[current_index]`.

Este enfoque explota la estructura factorizada de las transiciones: en lugar de iterar sobre todos los estados destino (O(|S|) por transición), recorre solo las ramas activas de cada factor, lo que es significativamente más eficiente cuando las transiciones son sparse.

#### `__build_output()` — Construcción de la salida

Convierte las representaciones internas (índices enteros) a representaciones legibles:

- `V_final`: `dict[(term, val, ...) → float]` — Valor óptimo por estado.
- `policy_final`: `dict[(term, val, ...) → Term]` — Acción greedy por estado.
- `Q_final`: `dict[((term, val, ...), action_str) → float]` — Valores Q óptimos.

### 3.5 `src/debugger.py` — Inspección y Exportación

Contiene dos clases de utilidad para diagnóstico y visualización.

#### `MDPDebugger`

Clase con métodos de clase (`@classmethod`) para inspección y exportación de las estructuras internas del MDP. Todos los archivos se guardan en el directorio `src/debug/`.

| Método | Salida | Descripción |
|---|---|---|
| `save_instructions_table(db)` | `instructions_table.txt` | Volcado de la tabla de instrucciones de la ClauseDB |
| `save_schema(schema)` | `schema_dump.txt` | Representación textual del FluentSchema |
| `export_transition_model(mdp)` | `transition_matrices.txt` | Matrices densas P(s'\|s,a) por acción |
| `export_reward_model(mdp)` | `reward_matrix.txt` | Matriz de recompensas R(s,a) |
| `export_q_table(mdp, q_table)` | `q_values_table.txt` | Tabla Q* tras convergencia |
| `export_value_history(mdp, v_history)` | `v_convergence_history.txt` | Historial V_k(s) por iteración |

El método `export_transition_model` reconstruye las matrices de transición densas a partir de las transiciones factorizadas. Para cada par (estado, acción), ejecuta una recursión idéntica a `ValueIteration.__expected_value` pero acumulando en una fila densa en lugar de multiplicar por V.

#### `CPTAnalyzer`

Clase auxiliar para análisis de tablas de probabilidad condicional. Indexa los factores de estado y acción del MDP para consulta por nombre de functor.

---

## 4. Ciclo de Vida Computacional

El procesamiento de un modelo MDP-ProbLog sigue un pipeline de seis fases:

### Fase 1 — Parsing y construcción de la ClauseDB

```python
engine = Engine(model_str)
# Internamente: PrologString(model) → DefaultEngine.prepare() → ClauseDB
```

El programa Prolog se parsea con `PrologString` y se entrega al `DefaultEngine`, que construye la ClauseDB: una tabla de instrucciones indexada que contiene la lógica estática del programa (hechos, reglas, disyunciones anotadas).

### Fase 2 — Clasificación de fluentes

```python
classifier = FluentClassifier(engine)
state_schema = classifier.classify()
```

El `FluentClassifier` ejecuta un pipeline de tres sub-fases:

1. **Validación estática**: Verifica la sintaxis de las declaraciones.
2. **Registro y clasificación**: Parsea fluentes explícitos (`state_fluent/2`) e infiere implícitos (`state_fluent/1`) consultando el índice invertido de ADs.
3. **Distribución y construcción**: Registra factores bool y multivalued en el `FluentSchema`, validando la cardinalidad de los grupos.

> Documentación completa: [Arquitectura_inferencia_clasificacion_fluentes.md](Arquitectura_inferencia_clasificacion_fluentes.md)

### Fase 3 — Inyección probabilística (t=0)

Se inyectan en la ClauseDB los hechos dummy que representan el estado actual:

- **Bool**: `add_fact(term_t0, 0.5)` — Probabilidad neutral, sustituida por evidencia.
- **Multivalued**: `add_annotated_disjunction(terms_t0, [1/N]*N)` — Crea nodos `choice`.

Las acciones se inyectan de forma análoga como una AD uniforme.

### Fase 4 — Grounding relevante

```python
queries = list(set(utilities) | set(next_state) | set(actions) | set(current_state))
engine.relevant_ground(queries)
```

El `DefaultEngine.ground_all()` produce un programa proposicional aterrizado (`LogicFormula`) que solo contiene las cláusulas relevantes para las queries especificadas.

La inclusión de `current_state_fluents` en la lista de queries es un requisito técnico: garantiza que ProbLog preserva los nombres de estos términos en el programa aterrizado, permitiendo que el evaluador los localice para sustituir evidencia.

### Fase 5 — Compilación

```python
knowledge = get_evaluatable(None).create_from(ground_program)
```

La fórmula aterrizada se compila en un circuito lógico (SDD o d-DNNF) almacenado en `self._knowledge`. Esta estructura permite evaluación en tiempo polinomial respecto al tamaño del circuito.

Los términos de consulta (fluentes t=1 y utilidades) se mapean a nodos del circuito via `knowledge.get_node_by_name()`.

### Fase 6 — Evaluación iterativa (Value Iteration)

El solver enumera todos los pares (estado, acción), evalúa transiciones y recompensas contra el circuito compilado, y ejecuta backups de Bellman hasta convergencia.

---

## 5. Motor de Inferencia Probabilística

### Weighted Model Counting (WMC)

El cálculo de P(x'_i | x, a) se basa en el *Weighted Model Counting*: sumar los pesos de todos los modelos (mundos posibles) que satisfacen la consulta.

- **Pesos**: Cada literal tiene un peso asignado. El peso de un mundo es el producto de los pesos de sus literales.
- **Sustitución de evidencia**: Al pasar el estado actual como evidencia, el sistema sustituye los pesos en las hojas del circuito aritmético (0.5 → 1.0 o 0.0).
- **Equivalencia condicional**: Forzar el peso a 1.0 en un circuito factorizado es matemáticamente equivalente a calcular P(consulta | evidencia) sin necesidad de calcular explícitamente el denominador de Bayes.

### Flujo de una evaluación

```
evidence = {fluent_t0_1: 1, fluent_t0_2: 0, action_1: 1, action_2: 0, ...}
                    │
                    ▼
        Evaluator.evaluate(node)
                    │
        ┌───────────┴───────────┐
        │  Recorrido bottom-up  │
        │  del circuito SDD     │
        │  con pesos de         │
        │  evidencia aplicados  │
        └───────────┬───────────┘
                    │
                    ▼
            P(fluent_t1 | evidence) = float
```

### Estructuras internas de ProbLog

| Estructura | Función | Rol en MDP-ProbLog |
|---|---|---|
| **ClauseDB** | Tabla de instrucciones indexada | Almacena el modelo original y recibe las inyecciones de hechos dummy y ADs |
| **LogicFormula** | Grafo AND-OR proposicional | Programa aterrizado relevante para transiciones y utilidades |
| **Evaluatable** | Circuito lógico compilado (SDD/d-DNNF) | Almacenado en `_knowledge`, permite inferencia en tiempo polinomial |
| **Evaluator** | Motor de cálculo numérico | Realiza WMC aplicando evidencia sobre el circuito |
| **Semiring** | Álgebra de operaciones | Define suma y producto para el cálculo de probabilidades marginales |

---

## 6. Representación de Estados

### Espacio factorizado

El espacio de estados se define como el producto cartesiano de factores independientes. Cada factor tiene una base (número de valores posibles):

| Tipo | Base | Valuación | Ejemplo |
|---|---|---|---|
| Bool | 2 | `{term: 0\|1}` | `{alive: 1}` |
| Multivalued | N | `{opt_1: 0, opt_2: 1, ..., opt_N: 0}` (one-hot) | `{pos(a): 0, pos(b): 1, pos(c): 0}` |

### Codificación mixed-radix

Cada estado se identifica con un índice entero único calculado como:

```
index = Σ (local_index_k × stride_k)
```

Donde `stride_k = ∏_{i<k} base_i`. Ejemplo para bases `[2, 3, 2]`:

| Factor | Base | Stride | Rango local |
|---|---|---|---|
| 0 (bool) | 2 | 1 | {0, 1} |
| 1 (multivalued) | 3 | 2 | {0, 1, 2} |
| 2 (bool) | 2 | 6 | {0, 1} |

Total: 2 × 3 × 2 = 12 estados, indexados de 0 a 11.

### Temporalización

Los fluentes del schema son atemporales. Para cada timestep, `Fluent.create_fluent(term, t)` produce una copia temporal añadiendo `t` como último argumento:

- Estado actual: `term(args..., 0)` — usado como evidencia.
- Siguiente estado: `term(args..., 1)` — usado como consulta.

---

## 7. Invariantes del Sistema

### Consistencia probabilística

1. **Exclusión mutua**: La inyección de ADs para factores multivalued garantiza que la suma de probabilidades de los nodos hijos sea exactamente 1.0.
2. **Preservación de nombres**: Los fluentes de estado actual (t=0) se incluyen en las queries de grounding para que ProbLog preserve sus identificadores.
3. **Evidencia completa**: El evaluador recibe evidencia para *todos* los fluentes de estado actual y *una* acción, lo que determina completamente el estado y acción condicionantes.

### Determinismo

4. **Orden de registro**: Los fluentes se recorren en orden alfabético (`sorted(registry.keys())`) para garantizar que el schema sea idéntico entre ejecuciones.
5. **Caché por índice**: Las claves de caché `(i, j)` corresponden biunívocamente a pares (estado, acción), evitando colisiones.

### Transiciones factorizadas

6. **Filtrado sparse**: Las ramas con probabilidad < 1e-6 se eliminan en `structured_transition`, reduciendo el costo de la recursión.
7. **Cardinalidad mínima**: Todo grupo multivalued tiene al menos 2 opciones (validado por V5 en `FluentClassifier`).
