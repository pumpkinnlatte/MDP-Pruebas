# Arquitectura: Inferencia y Clasificación de Fluentes de Estado

Documentación técnica del sistema de clasificación de fluentes de estado implementado en el subpaquete `src/fluent/`, con dependencias en `src/engine.py`.

---

## 1. Visión General

El sistema clasifica cada fluente de estado declarado por el usuario en uno de dos tipos:

- **`bool`**: Variable binaria independiente. Produce un factor de base 2 en el `FluentSchema`.
- **`enum`**: Grupo mutuamente excluyente de N opciones. Produce un factor de base N donde exactamente una opción está activa.

La clasificación opera en dos modos según la aridad de la declaración Prolog:

| Declaración | Modo | Fuente de datos |
|---|---|---|
| `state_fluent(Term, Tag)` | Explícito | `engine.assignments('state_fluent')` → `dict {Term: Tag}` |
| `state_fluent(Term)` | Implícito (inferencia) | `engine.declarations('state_fluent')` → `list [Term]` |

El resultado final es un objeto `FluentSchema` (definido en `src/fluent/schema.py`) que codifica la estructura factorizada del espacio de estados del MDP.

---

## 2. Estructura del Subpaquete `src/fluent/`

Toda la lógica del dominio de fluentes se organiza bajo un único subpaquete:

```
src/fluent/
├── __init__.py          # Re-exporta la API pública
├── schema.py            # FluentSchema, Fluent (estructuras de datos puras)
├── spaces.py            # FactorSpace, StateSpace, ActionSpace (iteración mixed-radix)
├── classification.py    # FluentClassifier (validación + inferencia + ensamblaje)
└── exceptions.py        # Jerarquía de excepciones del dominio
```

### 2.1 Principio de Organización

La separación sigue el criterio de responsabilidad:

- **`schema.py`** define *qué es* un esquema de fluentes (estructura de datos).
- **`spaces.py`** define *cómo se itera* sobre un esquema (enumeración).
- **`classification.py`** define *cómo se construye* un esquema a partir de declaraciones crudas (clasificación).
- **`exceptions.py`** define *cómo se reportan errores* del dominio.

### 2.2 API Pública (`__init__.py`)

El archivo `__init__.py` re-exporta todos los símbolos públicos del subpaquete. Los consumidores externos importan directamente desde `src.fluent`:

```python
from src.fluent import Fluent, FluentSchema
from src.fluent import FactorSpace, StateSpace, ActionSpace
from src.fluent import FluentClassifier
from src.fluent import MDPProbLogError, FluentDeclarationError, ...
```

---

## 3. Módulos del Subpaquete

### 3.1 `src/fluent/schema.py` — Estructuras de Datos

#### `Fluent`

Factory class que construye términos temporales. Un fluente temporal es un `problog.logic.Term` cuyo último argumento es un `Constant` que representa un timestep discreto.

```python
@classmethod
def create_fluent(cls, term, timestep):
    args = term.args + (Constant(timestep),)
    return term.with_args(*args)
```

Ejemplo: `semaforo(rojo)` con timestep 0 → `semaforo(rojo, 0)`.

#### `FluentSchema`

Descriptor ordenado de la estructura factorizada del espacio de estados. Cada factor es una lista de `Term`:

- `[term]` (longitud 1) → factor bool, base 2
- `[term1, term2, ..., termN]` (longitud N) → factor enum, base N

**Métodos de registro:**

| Método | Entrada | Base |
|---|---|---|
| `add_bool(term)` | Un término atemporal | 2 |
| `add_group(terms)` | Lista de N términos | N |

**Propiedades calculadas:**

| Propiedad | Descripción | Ejemplo para bases `[2, 3, 2]` |
|---|---|---|
| `factors` | Lista de factores en orden de registro | `[[t1], [t2, t3, t4], [t5]]` |
| `total_states` | Producto de todas las bases | 12 |
| `strides` | Strides posicionales para encoding mixed-radix | `[1, 2, 6]` |

**Métodos de acceso temporal:**

- `get_factors_at(timestep)` — Retorna una copia de todos los factores con términos estampados al timestep dado via `Fluent.create_fluent`.
- `get_flat_list()` — Retorna una lista plana de todos los términos atemporales en orden de registro.
- `get_local_index(factor_index, temporal_term)` — Retorna el índice local de un término temporal dentro de su factor. Maneja tres casos:
  - Bool False (`temporal_term is None`): retorna `0`.
  - Bool True: verifica coincidencia y retorna `1`.
  - Enum: búsqueda lineal en el grupo, retorna la posición.

El schema almacena exclusivamente términos atemporales. Las copias temporales se producen bajo demanda.

### 3.2 `src/fluent/spaces.py` — Iteración Mixed-Radix

#### `FactorSpace`

Clase base abstracta que implementa la codificación (valuación → índice) y decodificación (índice → valuación) sobre un espacio factorizado. Cada valuación es un `OrderedDict` que mapea `Term` a valores enteros (0 o 1).

**Decodificación (`__getitem__`):**

Para cada factor, se extrae el índice activo como `index % base`, luego se divide `index` entre `base`. Factores bool asignan el valor directamente (0 o 1); factores enum usan codificación one-hot.

```python
for base, options in zip(self._schema._FluentSchema__bases, self.__local_factors):
    active = temp_index % base
    temp_index //= base
    if base == 2 and len(options) == 1:
        valuation[options[0]] = active       # Bool
    else:
        for i, term in enumerate(options):
            valuation[term] = 1 if i == active else 0  # Enum one-hot
```

**Codificación (`index`):**

Operación inversa. Para cada factor, determina el índice activo y lo multiplica por el stride correspondiente.

#### `StateSpace`

Especialización de `FactorSpace` para fluentes de estado temporales. Por defecto opera con timestep=0 (estado actual).

```python
class StateSpace(FactorSpace):
    def __init__(self, schema, timestep=0):
        super().__init__(schema, timestep=timestep)
```

#### `ActionSpace`

Especialización que envuelve una lista de acciones como un único grupo enum sin timestep. Construye internamente un `FluentSchema` auxiliar con un solo factor.

```python
class ActionSpace(FactorSpace):
    def __init__(self, actions):
        schema = FluentSchema()
        schema.add_group(actions)
        super().__init__(schema, timestep=None)
```

### 3.3 `src/fluent/classification.py` — FluentClassifier

Orquestador principal de la clasificación de fluentes. Recibe un `Engine` y produce un `FluentSchema` validado.

#### Interfaz

```python
class FluentClassifier:
    def __init__(self, engine):
        self._engine = engine
        self._explicit_fluents = engine.assignments('state_fluent')
        self._implicit_fluents = engine.declarations('state_fluent')
        self._ads_inverted_index = engine.get_ads_metadata()

    def classify(self) -> FluentSchema:
        ...
```

El constructor recolecta los tres conjuntos de datos del `Engine` en una sola pasada. El método `classify()` ejecuta el pipeline completo (ver §4).

#### Métodos internos

| Método | Responsabilidad |
|---|---|
| `_register_explicit()` | Parsea fluentes `state_fluent/2` via `_parse_fluent_tag` |
| `_register_implicit()` | Infiere tipo de fluentes `state_fluent/1` via `_infer_fluent_type` |
| `_dispatch_fluents()` | Envía bool al schema, agrupa enum por clave |
| `_finalize_enums()` | Valida cardinalidad y consolida grupos enum |
| `_parse_fluent_tag()` | Interpreta la etiqueta: `bool`, `enum`, `enum(N)` |
| `_infer_fluent_type()` | Clasifica implícitos consultando el índice invertido de ADs |
| `__get_group_key()` | Genera la clave de agrupamiento para factores enum |
| `_validate_fluent_declarations()` | Ejecuta validaciones estáticas V1-V7 |

### 3.4 `src/fluent/exceptions.py` — Jerarquía de Excepciones

```
MDPProbLogError (base)
├── FluentDeclarationError   — V1, V2, V3: errores sintácticos en state_fluent/2
├── FluentAmbiguityError     — V4: aridad >= 2 con AD en modo implícito
├── FluentInferenceError     — Fallo genérico de inferencia (reservada)
└── FluentCardinalityError   — V5: grupo enum con < 2 opciones
```

Las excepciones siguen el patrón de acumulación por fases: los errores se recogen en listas y se lanzan agrupados al final de cada fase, para que el usuario corrija su modelo en una sola iteración.

---

## 4. Pipeline de Clasificación: `classify()`

El método `classify()` de `FluentClassifier` ejecuta un pipeline lineal de tres fases:

### Fase 1 — Validación Estática

```python
ads_vocab_keys = set(self._ads_inverted_index.keys())
self._validate_fluent_declarations(self._explicit_fluents, self._implicit_fluents, ads_vocab_keys)
```

Ejecuta todas las reglas de validación estática (V1, V2, V3, V6a, V7). Si hay errores, el pipeline se detiene con un `FluentDeclarationError` agrupado. Ver §6.

### Fase 2 — Clasificación y Registro

```python
explicit_registry = self._register_explicit(self._explicit_fluents)
implicit_registry = self._register_implicit(self._implicit_fluents, explicit_registry, self._ads_inverted_index)
full_registry = {**implicit_registry, **explicit_registry}
```

Dos sub-pasos secuenciales:

1. **Registro explícito**: Cada fluente de `state_fluent/2` se parsea con `_parse_fluent_tag` y se almacena como `(term, fluent_type, mutable_idx)`.
2. **Registro implícito**: Los fluentes de `state_fluent/1` se agrupan por `(functor, aridad)` y se infieren con `_infer_fluent_type`. Fluentes que ya existen en el registro explícito se omiten (resolución de V6a en la práctica).

Si hay errores de ambigüedad (V4), se acumulan y lanzan como `FluentAmbiguityError` agrupado.

El registro completo se construye dando prioridad al explícito: `{**implicit, **explicit}`.

### Fase 3 — Distribución y Construcción

```python
enum_acc, enum_idx = self._dispatch_fluents(full_registry, schema)
self._finalize_enums(schema, enum_acc, enum_idx)
```

1. **Distribución**: Los fluentes bool se registran directamente en el schema via `add_bool`. Los enum se acumulan agrupados por `group_key` (ver §9). El registro se recorre en orden alfabético para garantizar determinismo.
2. **Finalización**: Se valida la cardinalidad de cada grupo enum (mínimo 2 opciones). Los grupos válidos se consolidan via `add_group`. Grupos con cardinalidad insuficiente generan `FluentCardinalityError`.

---

## 5. Modelo de Datos del Registry

El registro interno mapea la representación string de cada término a una tupla de tres elementos:

```
registry: dict[str, tuple[Term, str, int | None]]

Clave:  str(term)              → e.g. "semaforo(rojo)"
Valor:  (term, fluent_type, mutable_idx)
         │      │              └─ None para bool, None para enum Interp. A,
         │      │                 int (base 0) para enum Interp. B
         │      └─ 'bool' | 'enum'
         └─ problog.logic.Term original
```

El registro se construye en la Fase 2 (explícito + implícito) y se consume en la Fase 3 para generar el schema.

---

## 6. Validación Estática: `_validate_fluent_declarations()`

### Parámetros

| Parámetro | Tipo | Origen |
|---|---|---|
| `explicit_fluents` | `dict {Term: Term}` | `engine.assignments('state_fluent')` |
| `implicit_fluents` | `list [Term]` | `engine.declarations('state_fluent')` |
| `ads_vocab` | `set` | Claves del índice invertido de ADs |

### Reglas implementadas

#### V1, V2, V3 — Validación de etiquetas explícitas

Itera sobre cada fluente explícito y ejecuta `_parse_fluent_tag`. Cualquier `FluentDeclarationError` se acumula.

- **V1**: Etiqueta desconocida (no es `bool`, `enum`, ni `enum(N)`).
- **V2**: `enum(N)` con N no-entero o no-positivo.
- **V3**: `enum(N)` con N fuera de rango `[1, aridad]`.

#### V6a — Duplicado entre modos

```python
explicit_functors = {str(t) for t in explicit_fluents.keys()}
for term in implicit_fluents:
    if str(term) in explicit_functors:
        warnings.warn(f"[V6a] Fluent '{term_str}' is declared both implicitly ...")
```

Si un término aparece tanto en `state_fluent/1` como en `state_fluent/2`, emite un warning. La declaración explícita siempre tiene prioridad.

#### V7 — Colapso estructural

Solo aplica a fluentes explícitos con `enum(N)`. Verifica si algún argumento en posición distinta a `mutable_idx` tiene un valor que también aparece en el vocabulario de ADs. Emite un warning si detecta la coincidencia — indica posibles dependencias cruzadas no modeladas.

#### Lanzamiento agrupado

```python
if errors:
    combined = "\n\n".join(f"[Error {i+1}] {msg}" for i, msg in enumerate(error_messages))
    raise FluentDeclarationError(f"Found {len(errors)} fluent declaration error(s):\n\n{combined}")
```

> **V4 no está aquí**: La detección de aridad >= 2 con origen AD se realiza durante la inferencia (Fase 2 del pipeline), no en la validación estática. V4 requiere información semántica que solo se evalúa en `_infer_fluent_type`.

---

## 7. Parsing de Etiquetas: `_parse_fluent_tag()`

Transforma el segundo argumento de `state_fluent/2` en un par `(fluent_type, mutable_idx)`.

### Tabla de decisión

| Entrada (`tag_value`) | `fluent_type` | `mutable_idx` | Interpretación |
|---|---|---|---|
| `'bool'` | `'bool'` | `None` | Variable binaria |
| `'enum'` | `'enum'` | `None` | Interp. A: dominio producto, todos los groundings en un grupo |
| `enum(N)` con N válido | `'enum'` | `N - 1` | Interp. B: arg N es dominio mutable, resto son claves estáticas |
| Cualquier otro | — | — | Lanza `FluentDeclarationError` (V1) |

### `enum` sin índice

```python
if tag_str == 'enum':
    return ('enum', None)
```

Válido para cualquier aridad del predicado. Produce `mutable_idx = None`, lo que instruye a `__get_group_key` a usar solo el functor como clave — todos los groundings van a un único grupo (Interpretación A).

### `enum(N)`

```python
if hasattr(tag_value, 'functor') and tag_value.functor == 'enum' and len(tag_value.args) == 1:
    n = int(tag_value.args[0])          # V2 si falla
    if n < 1 or n > len(term.args):     # V3 si fuera de rango
        raise FluentDeclarationError(...)
    return ('enum', n - 1)              # conversión base-1 Prolog → base-0 Python
```

---

## 8. Inferencia Implícita: `_infer_fluent_type()`

Clasifica fluentes declarados con `state_fluent/1` (sin etiqueta explícita).

### Parámetros

| Parámetro | Tipo | Descripción |
|---|---|---|
| `grounded_terms` | `list [Term]` | Todos los términos aterrizados del mismo predicado/aridad |
| `ads_inverted_index` | `dict[str, set[int]]` | Índice invertido: valor → conjunto de IDs de grupo AD |

### Algoritmo de detección de origen AD

Para cada posición argumental, se extraen todos los valores que aparecen entre los groundings. Se inicializa un conjunto de grupos candidatos con el primer valor y se intersecta progresivamente con los grupos de los valores restantes:

```python
ad_positions = []
for pos in range(arity):
    values_at_pos = {str(t.args[pos]) for t in grounded_terms}
    iterator = iter(values_at_pos)
    first_val = next(iterator)
    common_groups = set(ads_inverted_index.get(first_val, set()))
    if not common_groups:
        continue
    for val in iterator:
        common_groups.intersection_update(ads_inverted_index.get(val, set()))
        if not common_groups:
            break
    if common_groups:
        ad_positions.append(pos)
```

Si la intersección sobrevive con al menos un grupo, la posición entera se identifica como estocástica (originada en una AD).

### Clasificación por casos

| Caso | Condición | Resultado |
|---|---|---|
| I | Aridad 0 | `'bool'` |
| II | Aridad 1, sin posiciones AD | `'bool'` |
| III | Aridad 1, con posición AD | `'enum'` |
| IV | Aridad >= 2, sin posiciones AD | `'bool'` |
| V | Aridad >= 2, con posición AD | `FluentAmbiguityError` (V4) |

El Caso V es una ambigüedad irreducible: el sistema no puede determinar si el usuario quiere la Interpretación A o B sin declaración explícita. El error incluye las dos opciones concretas de solución.

---

## 9. Agrupamiento: `__get_group_key()`

Genera la clave que determina qué groundings van al mismo grupo enum.

### Tabla de comportamiento

| `mutable_idx` | Clave generada | Semántica |
|---|---|---|
| `None` | `term.functor` | **Interpretación A**: todos los groundings del functor en un solo grupo |
| `int` (con args estáticos) | `"functor(arg1,arg2,...)"` | **Interpretación B**: un grupo por cada combinación de argumentos estáticos |
| `int` (sin args estáticos, i.e. aridad 1) | `term.functor` | Caso degenerado de B equivalente a A |

### Ejemplo de Interpretación B

Para `semaforo(rojo, norte)` con `mutable_idx = 0`:
- Args estáticos: `[norte]` (posición 1, la que no es mutable)
- Clave: `"semaforo(norte)"`
- Resultado: todos los groundings de `semaforo` con `norte` en posición 1 se agrupan juntos.

### Ejemplo de Interpretación A

Para `position(1, 2)` con `mutable_idx = None`:
- Clave: `"position"`
- Resultado: todos los groundings de `position` van a un único grupo.

---

## 10. Flujo de Errores

El sistema implementa un patrón de acumulación secuencial por fases:

```
Fase 1: _validate_fluent_declarations
  ├── Acumula → FluentDeclarationError (V1, V2, V3)
  └── Lanza agrupado → FluentDeclarationError

Fase 2: _infer_fluent_type (llamado en _register_implicit)
  ├── Acumula → FluentAmbiguityError (V4)
  └── Lanza agrupado → FluentAmbiguityError

Fase 3: _finalize_enums
  ├── Acumula → FluentCardinalityError (V5)
  └── Lanza agrupado → FluentCardinalityError
```

Las fases son secuenciales: si la Fase 1 falla, las Fases 2 y 3 no se ejecutan. Si la Fase 2 falla, la Fase 3 no se ejecuta. Esto garantiza que los errores más fundamentales (sintaxis) se reporten antes que los semánticos (ambigüedad) o estructurales (cardinalidad).

---

## 11. Dependencia con `src/engine.py`

El `FluentClassifier` depende de tres métodos del `Engine`:

| Método | Retorno | Uso en clasificación |
|---|---|---|
| `assignments('state_fluent')` | `dict {Term: Tag}` | Fluentes explícitos (state_fluent/2) |
| `declarations('state_fluent')` | `list [Term]` | Fluentes implícitos (state_fluent/1) |
| `get_ads_metadata()` | `dict[str, set[int]]` | Índice invertido de valores AD para inferencia |

### `get_ads_metadata()`

Recorre linealmente la tabla de instrucciones de la `ClauseDB` buscando nodos de tipo `choice` (nodos internos de Disyunciones Anotadas). Para cada nodo, extrae el término fact del tercer argumento del functor (`node.functor.args[2]`) y registra sus argumentos en el índice invertido.

```python
def get_ads_metadata(self):
    inverted_index = defaultdict(set)
    node_index = 0
    while True:
        try:
            node = self._db.get_node(node_index)
            if type(node).__name__ == 'choice':
                parent_id = node.group
                fact_term = node.functor.args[2]
                if fact_term.args:
                    for arg in fact_term.args:
                        if hasattr(arg, 'is_var') and not arg.is_var():
                            inverted_index[str(arg)].add(parent_id)
                else:
                    inverted_index[str(fact_term.functor)].add(parent_id)
        except IndexError:
            break
        node_index += 1
    return dict(inverted_index)
```

El resultado es un `dict[str, set[int]]` donde cada clave es un valor string (e.g. `'rojo'`) y cada valor es el conjunto de IDs de grupo AD que lo contienen.

---

## 12. Integración con `MDP.__prepare()`

El schema producido por `FluentClassifier.classify()` se usa en `MDP.__prepare()`:

```python
classifier = FluentClassifier(self._engine)
self.state_schema = classifier.classify()
```

Inmediatamente después, se inyectan hechos dummy en la `ClauseDB` para el tiempo t=0:

- **Bool**: Se inyecta como hecho probabilístico con `add_fact(fluent_term, 0.5)`.
- **Enum**: Se inyecta como disyunción anotada con probabilidades uniformes `1/N` via `add_annotated_disjunction`.

Esta inyección prepara la base de conocimiento para poder evaluar transiciones y recompensas durante la inferencia probabilística.

---

## 13. Resumen de las Interpretaciones

| Concepto | Interpretación A | Interpretación B |
|---|---|---|
| Declaración | `enum` (sin índice) | `enum(N)` |
| `mutable_idx` | `None` | `N - 1` |
| Clave de grupo | Solo functor | Functor + args estáticos |
| Dominio | Todos los groundings completos | Valores en posición N |
| Factores en schema | 1 grupo, base = total de groundings | M grupos (uno por combinación de claves), base = valores en posición N |
| Ejemplo para `f(X,Y)` con \|X\|=2, \|Y\|=3 | 1 grupo de base 6 | Con `enum(1)`: 3 grupos de base 2. Con `enum(2)`: 2 grupos de base 3 |
