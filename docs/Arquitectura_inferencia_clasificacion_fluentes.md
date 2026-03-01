
# Arquitectura: Inferencia y Clasificación de Fluentes de Estado

Documentación técnica del sistema de clasificación de fluentes de estado implementado en `src/mdp.py` y `src/engine.py`, con dependencias en `src/fluent.py` y `src/exceptions.py`.

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

El resultado final es un objeto `FluentSchema` (definido en `src/fluent.py`) que codifica la estructura factorizada del espacio de estados del MDP.

---

## 2. Módulos Involucrados

### 2.1 `src/engine.py` — Adaptador de ProbLog

Clase `Engine`: encapsula la `ClauseDB` de ProbLog y expone tres métodos relevantes para la clasificación.

#### `declarations(declaration_type)` (línea 22)

```python
def declarations(self, declaration_type):
    return [t[0] for t in self._engine.query(self._db, Term(declaration_type, None))]
```

Consulta todos los hechos/reglas de aridad 1 del tipo dado. Para `'state_fluent'`, retorna la lista de términos aterrizados declarados como `state_fluent(Term).` — es decir, los fluentes en modo implícito. Cada elemento es un `problog.logic.Term` completamente instanciado (sin variables libres).

#### `assignments(assignment_type)` (línea 33)

```python
def assignments(self, assignment_type):
    return dict(self._engine.query(self._db, Term(assignment_type, None, None)))
```

Consulta todos los hechos/reglas de aridad 2 del tipo dado. Para `'state_fluent'`, retorna un diccionario `{Term_fluente: Term_etiqueta}` — los fluentes en modo explícito junto con su etiqueta (`bool`, `enum`, `enum(N)`).

#### `get_ads_vocabulary()` (línea 242)

```python
def get_ads_vocabulary(self):
    vocabulary_by_parent = defaultdict(set)
    node_index = 0
    while True:
        try:
            node = self._db.get_node(node_index)
            if type(node).__name__ == 'adc':
                functor = node[0]
                arguments = node[1]
                parent_id = node[4] # El ID del nodo AD que agrupa estas opciones
                if arguments:
                    for arg in arguments:
                        if not arg.is_var():
                            vocabulary_by_parent[parent_id].add(str(arg))
                else:
                    vocabulary_by_parent[parent_id].add(str(functor))                
        except IndexError:
            break  
        node_index += 1   
    return dict(vocabulary_by_parent)
```

Recorre linealmente la tabla de instrucciones de la `ClauseDB` buscando nodos de tipo `adc` (Annotated Disjunction Choice). Extrae el vocabulario de valores generados estrictamente por Disyunciones Anotadas.

**Estructura del nodo `adc`**: `adc(functor, arguments, bodynode, varcount, parent)`. El método accede a `node[0]` (functor) y `node[1]` (arguments).

Dos casos de extracción:
- **Con argumentos** (e.g. `colores(rojo)`): extrae cada argumento no-variable (`rojo`).
- **Sin argumentos** (e.g. `television` como átomo): extrae el functor completo.

**Retorno actual**: `set` plano con todos los valores de AD. Ejemplo: `{'rojo', 'verde', 'amarillo', 'on', 'off'}`.

---

### 2.2 `src/exceptions.py` — Jerarquía de Excepciones

```
MDPProbLogError (base)
├── FluentDeclarationError   — V1, V2, V3: errores sintácticos en state_fluent/2
├── FluentAmbiguityError     — V4: aridad >= 2 con AD en modo implícito
├── FluentInferenceError     — Fallo genérico de inferencia (reservada)
└── FluentCardinalityError   — V5: grupo enum con < 2 opciones
```

Las excepciones siguen el patrón de acumulación: los errores se recogen en listas y se lanzan agrupados al final de cada fase de validación, para que el usuario corrija su modelo en una sola iteración.

---

### 2.3 `src/fluent.py` — FluentSchema y Espacios de Estado

#### `FluentSchema`

Contenedor ordenado de factores. Cada factor es una lista de `Term`:
- `[term]` (longitud 1) → bool, base 2
- `[term1, term2, ..., termN]` (longitud N) → enum, base N

Métodos de registro:
- `add_bool(term)`: registra un factor bool.
- `add_group(terms)`: registra un factor enum con N elementos.

Propiedades calculadas:
- `factors`: lista de factores en orden de registro.
- `total_states`: producto de todas las bases.
- `strides`: strides posicionales para el encoding mixed-radix.

#### `Fluent.create_fluent(term, timestep)`

Factory que añade un argumento temporal al final del término:
```python
args = term.args + (Constant(timestep),)
return term.with_args(*args)
```

`semaforo(rojo)` con timestep 0 → `semaforo(rojo, 0)`.

#### `StateSpace` y `ActionSpace`

Iteradores sobre el espacio factorizado usando descomposición mixed-radix. `StateSpace` opera con términos temporales (timestep=0 por defecto); `ActionSpace` opera con términos atemporales.

---

### 2.4 `src/mdp.py` — Pipeline de Clasificación

La clase `MDP` orquesta todo el proceso. El punto de entrada es `__build_state_schema()`, invocado desde `__prepare()` durante la inicialización.

---

## 3. Pipeline de `__build_state_schema()` (línea 86)

El método sigue un pipeline lineal de 7 pasos:

### Paso 1 — Recolección de datos (líneas 100–105)

```python
explicit_fluents = self._engine.assignments('state_fluent')   # dict {Term: Tag}
implicit_fluents = self._engine.declarations('state_fluent')   # list [Term]
ads_vocab = self._engine.get_ads_vocabulary()                  # set de valores AD
```

Los tres conjuntos de datos se obtienen del `Engine` en una sola pasada.

### Paso 2 — Validación estática (línea 108)

```python
self.__validate_fluent_declarations(explicit_fluents, implicit_fluents, ads_vocab)
```

Ejecuta todas las reglas de validación estática (V1, V2, V3, V6a, V7). Los errores se acumulan antes de lanzarse. Si hay errores, el pipeline se detiene con un `FluentDeclarationError` que agrupa todos los mensajes. Ver §4 para detalle.

### Paso 3 — Clasificación explícita (líneas 113–116)

```python
for term, tag_value in explicit_fluents.items():
    fluent_type, mutable_idx = self._parse_fluent_tag(term, tag_value)
    registry[str(term)] = (term, fluent_type, mutable_idx)
```

Cada fluente explícito se procesa con `_parse_fluent_tag` y se almacena en el registro con su tipo y su `mutable_idx`. Ver §5 para detalle.

### Paso 4 — Clasificación implícita (líneas 118–148)

```python
implicit_by_predicate = defaultdict(list)
for term in implicit_fluents:
    term_str = str(term)
    if term_str not in registry:
        key = (term.functor, len(term.args))
        implicit_by_predicate[key].append(term)
```

Los fluentes implícitos se agrupan por `(functor, aridad)`. Aquellos que ya existen en el registro (por declaración explícita previa) se omiten silenciosamente — esto es la resolución de V6a en la práctica.

```python
inference_errors = []
for (functor, arity), grounded_terms in implicit_by_predicate.items():
    try:
        fluent_type = self._infer_fluent_type(grounded_terms, ads_vocab)
    except FluentAmbiguityError as e:
        inference_errors.append(e)
        continue
    mutable_idx = None
    for term in grounded_terms:
        term_str = str(term)
        if term_str not in registry:
            registry[term_str] = (term, fluent_type, mutable_idx)
```

Cada grupo se infiere con `_infer_fluent_type`. Si la inferencia falla (V4: aridad >= 2 con AD), el error se acumula en `inference_errors` y el grupo se omite. Los fluentes inferidos exitosamente se registran con `mutable_idx = None` siempre — el modo implícito no produce índices explícitos.

Si hay errores acumulados:
```python
if inference_errors:
    raise FluentAmbiguityError(
        f"Found {len(inference_errors)} ambiguity error(s):\n\n{combined}"
    )
```

### Paso 5 — Agrupamiento en FluentSchema (líneas 150–161)

```python
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
```

Los fluentes bool se registran directamente en el schema. Los enum se acumulan agrupados por `group_key` (producida por `__get_group_key`). El registro se recorre en orden alfabético (`sorted`) para garantizar determinismo.

### Paso 6 — Validación de cardinalidad V5 (líneas 163–193)

```python
for key in sorted(enum_accumulator.keys()):
    terms_group = sorted(enum_accumulator[key], key=str)
    mutable_idx = enum_mutable_idx[key]

    if mutable_idx is None:
        current_domain = {str(t) for t in terms_group}
    else:
        current_domain = {str(t.args[mutable_idx]) for t in terms_group}

    if len(current_domain) < 2:
        cardinality_errors.append(FluentCardinalityError(...))
        continue

    schema.add_group(terms_group)
```

La cardinalidad se calcula según el tipo de interpretación:

| `mutable_idx` | Dominio | Ejemplo |
|---|---|---|
| `None` (Interp. A) | Cada término completo es un valor del dominio | `{semaforo(rojo,norte), semaforo(verde,norte), ...}` |
| `int` (Interp. B) | Los valores en la posición `mutable_idx` | `{rojo, verde, amarillo}` |

Grupos con menos de 2 opciones se rechazan con `FluentCardinalityError`.

### Paso 7 — Retorno (línea 196)

```python
return schema
```

---

## 4. Validación Estática: `__validate_fluent_declarations()` (línea 229)

### Parámetros

| Parámetro | Tipo | Origen |
|---|---|---|
| `explicit_fluents` | `dict {Term: Term}` | `engine.assignments('state_fluent')` |
| `implicit_fluents` | `list [Term]` | `engine.declarations('state_fluent')` |
| `ads_vocab` | `set` | `engine.get_ads_vocabulary()` |

### Reglas implementadas

#### V1, V2, V3 — Validación de etiquetas explícitas (líneas 251–256)

Itera sobre cada fluente explícito y ejecuta `_parse_fluent_tag`. Cualquier `FluentDeclarationError` se acumula.

- **V1**: Etiqueta desconocida (no es `bool`, `enum`, ni `enum(N)`).
- **V2**: `enum(N)` con N no-entero o no-positivo.
- **V3**: `enum(N)` con N fuera de rango `[1, aridad]`.

#### V6a — Duplicado entre modos (líneas 258–267)

```python
explicit_functors = {str(t) for t in explicit_fluents.keys()}
for term in implicit_fluents:
    term_str = str(term)
    if term_str in explicit_functors:
        warnings.warn(f"[V6a] Fluent '{term_str}' is declared both implicitly ...")
```

Si un término aparece tanto en `state_fluent/1` como en `state_fluent/2`, emite un warning. La declaración explícita siempre tiene prioridad (la implícita se ignora en el Paso 4 del pipeline).

#### V7 — Colapso estructural (líneas 269–293)

Solo aplica a fluentes explícitos con `enum(N)`. Verifica si algún argumento en posición distinta a `mutable_idx` tiene un valor que también aparece en el vocabulario de AD. Emite un warning si detecta la coincidencia — indica posibles dependencias cruzadas no modeladas.

```python
for i, arg in enumerate(term.args):
    if i != mutable_idx and str(arg) in all_values:
        warnings.warn(f"[V7] Fluent '{term}' declared as enum({mutable_idx + 1}), ...")
        break
```

> **V4 no está aquí**: La detección de aridad >= 2 con origen AD se realiza durante la inferencia (Paso 4 del pipeline), no en la validación estática. Esto es porque V4 requiere información semántica (orígenes de AD) que solo se evalúa correctamente en `_infer_fluent_type`.

#### Lanzamiento agrupado (líneas 295–302)

```python
if errors:
    combined = "\n\n".join(f"[Error {i+1}] {msg}" for i, msg in enumerate(error_messages))
    raise FluentDeclarationError(f"Found {len(errors)} fluent declaration error(s):\n\n{combined}")
```

---

## 5. Parsing de Etiquetas: `_parse_fluent_tag()` (línea 304)

Transforma el segundo argumento de `state_fluent/2` en un par `(fluent_type, mutable_idx)`.

### Tabla de decisión

| Entrada (`tag_value`) | `fluent_type` | `mutable_idx` | Interpretación |
|---|---|---|---|
| `'bool'` | `'bool'` | `None` | Variable binaria |
| `'enum'` | `'enum'` | `None` | Interp. A: dominio producto, todos los groundings en un grupo |
| `enum(N)` con N válido | `'enum'` | `N - 1` | Interp. B: arg N es dominio mutable, resto son claves estáticas |
| Cualquier otro | — | — | Lanza `FluentDeclarationError` (V1) |

### Detalle de `enum` sin índice

```python
if tag_str == 'enum':
    return ('enum', None)
```

`enum` sin índice es válido para **cualquier aridad** del predicado interno. Produce `mutable_idx = None`, lo que instruye a `__get_group_key` a usar solo el functor como clave de agrupamiento — todos los groundings van a un único grupo (Interpretación A, dominio producto).

### Detalle de `enum(N)`

```python
if hasattr(tag_value, 'functor') and tag_value.functor == 'enum' and len(tag_value.args) == 1:
    n = int(tag_value.args[0])          # V2 si falla
    if n < 1 or n > len(term.args):     # V3 si fuera de rango
        raise FluentDeclarationError(...)
    return ('enum', n - 1)              # conversión base-1 Prolog → base-0 Python
```

---

## 6. Inferencia Implícita: `_infer_fluent_type()` (línea 345)

Clasifica fluentes declarados con `state_fluent/1` (sin etiqueta explícita).

### Parámetros

| Parámetro | Tipo | Descripción |
|---|---|---|
| `grounded_terms` | `list [Term]` | Todos los términos aterrizados del mismo predicado/aridad |
| `ads_vocab_by_predicate` | `set` | Vocabulario plano de valores de AD |

### Algoritmo por casos

#### Caso I — Aridad 0 (línea 362)

```python
if arity == 0:
    return 'bool'
```

Término sin argumentos (e.g. `encendido`). Siempre bool.

#### Caso II/III — Aridad 1 (líneas 365–371)

```python
if arity == 1:
    values_at_pos = {str(t.args[0]) for t in grounded_terms}
    for vocab in ads_vocab_by_predicate.values():
        if values_at_pos.issubset(vocab):
            return 'enum'
    return 'bool'
```

Extrae los valores en la posición 0 de todos los groundings. Si el conjunto de valores es subconjunto de algún vocabulario de AD, el fluente es `enum`. En caso contrario, es `bool`.

> **Nota sobre la interfaz actual**: `ads_vocab_by_predicate` es en realidad un `set` plano (no un `dict`). La iteración `.values()` falla sobre un `set`. Esto indica que el código actual espera que `get_ads_vocabulary()` retorne un `dict` agrupado por predicado. Si el `Engine` retorna un `set`, la llamada debe adaptarse o el Engine debe refactorizarse para retornar `dict`. **Este es un punto de divergencia entre la implementación del Engine y lo que el pipeline espera.**

#### Caso IV — Aridad >= 2, sin origen AD (líneas 384–386)

```python
if not has_ad_origin:
    return 'bool'
```

Si ningún argumento en ninguna posición tiene valores que sean subconjunto de un vocabulario AD, el fluente se clasifica como `bool` silenciosamente. Cada grounding será una variable binaria independiente.

#### Caso V — Aridad >= 2, con origen AD (líneas 388–397)

```python
raise FluentAmbiguityError(
    f"Fluent '{sample.functor}/{arity}' has arity {arity} in implicit mode "
    f"and at least one argument originates from an Annotated Disjunction.\n"
    ...
)
```

Ambigüedad irreducible. El sistema no puede determinar si el usuario quiere la Interpretación A o B sin declaración explícita. El error incluye las dos opciones concretas de solución.

### Detección de origen AD en aridad >= 2 (líneas 373–382)

```python
has_ad_origin = False
for pos in range(arity):
    values_at_pos = {str(t.args[pos]) for t in grounded_terms}
    for vocab in ads_vocab_by_predicate.values():
        if values_at_pos.issubset(vocab):
            has_ad_origin = True
            break
    if has_ad_origin:
        break
```

Itera posición por posición. Para cada posición, extrae todos los valores que aparecen en esa posición entre todos los groundings. Si ese conjunto es subconjunto de algún vocabulario AD, marca `has_ad_origin = True` y corta la búsqueda (short-circuit).

---

## 7. Agrupamiento: `__get_group_key()` (línea 198)

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

Resultado: todos los groundings de `semaforo` con `norte` en posición 1 se agrupan juntos.

### Ejemplo de Interpretación A

Para `position(1, 2)` con `mutable_idx = None`:
- Clave: `"position"`

Resultado: todos los groundings de `position` van a un único grupo — `{position(1,1), position(1,2), position(2,1), ...}`.

---

## 8. Modelo de Datos del Registry

El registro interno (`registry`) mapea la representación string de cada término a una tupla de tres elementos:

```
registry: dict[str, tuple[Term, str, int | None]]

Clave:  str(term)              → e.g. "semaforo(rojo)"
Valor:  (term, fluent_type, mutable_idx)
         │      │              └─ None para bool, None para enum Interp. A,
         │      │                 int (base 0) para enum Interp. B
         │      └─ 'bool' | 'enum'
         └─ problog.logic.Term original
```

El registro se construye en dos fases (Paso 3 + Paso 4) y se consume en el Paso 5 para generar el schema.

---

## 9. Flujo de Errores

El sistema implementa un patrón de acumulación por fases:

```
Fase 1: __validate_fluent_declarations
  ├── Acumula → FluentDeclarationError (V1, V2, V3)
  └── Lanza agrupado → FluentDeclarationError

Fase 2: _infer_fluent_type (llamado en Paso 4)
  ├── Acumula → FluentAmbiguityError (V4)
  └── Lanza agrupado → FluentAmbiguityError

Fase 3: Validación de cardinalidad (Paso 6)
  ├── Acumula → FluentCardinalityError (V5)
  └── Lanza agrupado → FluentCardinalityError
```

Las fases son secuenciales: si la Fase 1 falla, las Fases 2 y 3 no se ejecutan. Si la Fase 2 falla, la Fase 3 no se ejecuta. Esto garantiza que los errores más fundamentales (sintaxis) se reporten antes que los semánticos (ambigüedad) o estructurales (cardinalidad).

---

## 10. Interacción con `__prepare()`

El schema producido por `__build_state_schema()` se usa inmediatamente en `__prepare()` (línea 35):

```python
self.state_schema = self.__build_state_schema()
self._next_state_factors = self.state_schema.get_factors_at(1)
```

Luego se inyectan los fluentes dummy en la `ClauseDB`:

```python
for factor in self.state_schema.factors:
    if len(factor) == 1:
        # Bool: inyecta como hecho probabilístico con p=0.5
        fluent_term = Fluent.create_fluent(term, 0)
        self._engine.add_fact(fluent_term, 0.5)
    else:
        # Enum: inyecta como disyunción anotada con probabilidades uniformes
        ad_states = [Fluent.create_fluent(term, 0) for term in factor]
        self._engine.add_annotated_disjunction(ad_states, [1.0/len(ad_states)] * len(ad_states))
```

Esta inyección prepara la base de conocimiento para poder evaluar transiciones y recompensas.

---

## 11. Diagrama de Dependencias entre Métodos

```
MDP.__init__
  └── __prepare()
        ├── __build_state_schema()          ← Pipeline principal
        │     ├── engine.assignments()       (Paso 1)
        │     ├── engine.declarations()      (Paso 1)
        │     ├── engine.get_ads_vocabulary() (Paso 1)
        │     ├── __validate_fluent_declarations()  (Paso 2)
        │     │     └── _parse_fluent_tag()   (V1, V2, V3)
        │     ├── _parse_fluent_tag()         (Paso 3, clasificación explícita)
        │     ├── _infer_fluent_type()        (Paso 4, clasificación implícita)
        │     ├── __get_group_key()           (Paso 5, agrupamiento)
        │     └── schema.add_bool / add_group (Pasos 5–6)
        ├── Fluent.create_fluent()           (inyección dummy)
        ├── engine.add_fact()                (inyección bool)
        └── engine.add_annotated_disjunction() (inyección enum)
```

---

## 12. Resumen de las Interpretaciones

| Concepto | Interpretación A | Interpretación B |
|---|---|---|
| Declaración | `enum` (sin índice) | `enum(N)` |
| `mutable_idx` | `None` | `N - 1` |
| Clave de grupo | Solo functor | Functor + args estáticos |
| Dominio | Todos los groundings completos | Valores en posición N |
| Factores en schema | 1 grupo, base = total de groundings | M grupos (uno por combinación de claves), base = valores en posición N |
| Ejemplo para `f(X,Y)` con \|X\|=2, \|Y\|=3 | 1 grupo, base 6 | Con `enum(1)`: 3 grupos base 2, o con `enum(2)`: 2 grupos base 3 |

---
