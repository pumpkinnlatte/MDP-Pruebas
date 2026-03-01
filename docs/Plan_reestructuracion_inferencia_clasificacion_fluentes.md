
## Diagnóstico de Partida

El flujo actual en `__build_state_schema` (mdp.py) opera en dos modos:

**Modo explícito (`state_fluent/2`):** Lee la etiqueta `ads` o `bsf` como segundo argumento vía `engine.assignments('state_fluent')`. Funciona para aridad 1 dentro del término del fluente. El problema aparece cuando el término tiene múltiples argumentos —`sensor(X, Y, Z)`— porque el sistema recibe la etiqueta pero no sabe cuál argumento es el mutable.

**Modo de inferencia (`state_fluent/1`):** Obtiene todos los términos aterrizados vía `engine.declarations('state_fluent')` y verifica si `term.args[-1]` (el último argumento) está en `ads_vocabulary`. Esta es la "Regla del Último Argumento". El problema es doble: es una convención posicional implícita no documentada, y opera sobre el valor concreto del término aterrizado (`rojo`, `verde`) en lugar del predicado de origen, lo que hace posible clasificaciones erróneas por coincidencia de nombre.

La raíz del problema en ambos modos es la misma: el sistema no tiene forma de preguntar "¿cuál argumento de este fluente es el dominio mutable?" de manera no ambigua para términos con múltiples argumentos. Todo lo demás —la validación de cardinalidad, el agrupamiento por clave estática en `__get_group_key`— funciona correctamente y no necesita cambio en su lógica central.

Un segundo problema identificado en la sesión de análisis es que los identificadores `bsf` y `ads` son internalismos opacos: `bsf` deriva de "Boolean State Fluent" (jerga de la literatura de MDPs) y `ads` de "Annotated Disjunction" (jerga interna de ProbLog). Ninguno de los dos es reconocible para un usuario que llega al framework sin ese bagaje específico.

---

## Principios de Diseño

Todo el rediseño se rige por tres principios que tienen precedencia sobre cualquier decisión de implementación puntual:

**Principio 1 — Compatibilidad sintáctica con ProbLog.** Ninguna sintaxis nueva puede requerir modificar el parser de ProbLog ni introducir un preprocesador externo. Toda declaración debe ser un término que `PrologString` pueda parsear sin errores. Esto descarta el uso de `#`, `+` o cualquier símbolo operador como marcadores dentro de los argumentos de un término.

**Principio 2 — Fallo explícito sobre error silencioso.** Si un modelo es ambiguo, el sistema debe detenerse con un mensaje de error claro que indique exactamente qué declaración es problemática y por qué. Está prohibido producir un `FluentSchema` potencialmente incorrecto. Los errores deben acumularse antes de reportarse, para que el usuario corrija su modelo en una sola iteración.

**Principio 3 — Familiaridad para usuarios de Prolog y ProbLog.** Los mecanismos de declaración deben ser reconocibles y coherentes con convenciones del ecosistema. El usuario que llega de cualquier lenguaje de programación debe poder leer las declaraciones sin necesidad de consultar documentación interna del framework.

---

## Fase I: Rediseño del Contrato Sintáctico

### 1.1 Renombramiento de los identificadores de tipo

Los identificadores `bsf` y `ads` son reemplazados en su totalidad por `bool` y `enum`. Esta decisión se fundamenta en tres observaciones:

**`bool`** es el término más reconocido universalmente para una variable binaria. Es usado en prácticamente todos los lenguajes de programación, no requiere explicación, y no carga jerga de ningún dominio específico. Comunica exactamente la semántica: verdadero o falso.

**`enum`** captura la semántica matemática correcta de un grupo mutuamente excluyente: un conjunto finito de valores nombrados del cual exactamente uno está activo en cada instante. Es la misma abstracción que un `enum` en C, Java, Rust o cualquier lenguaje. Adicionalmente, `enum(N)` —la extensión paramétrica para indicar posición del argumento mutable— se lee de forma natural: "es un enum y el dominio está en la posición N". Esta legibilidad no era posible con `ads(N)`.

Esta comparación está respaldada por sistemas análogos establecidos: RDDL (el framework más comparable para fMDPs relacionales) usa exactamente `bool` y `enum` para sus tipos de variable de estado. El International Planning Competition convergió a esta nomenclatura después de años de uso. La adopción de estos mismos términos hace que MDP-ProbLog sea más fácil de aprender para quien ya conoce RDDL, y más fácil de comparar académicamente.

El renombramiento afecta: el contrato sintáctico, la jerarquía de excepciones, los labels en el output de `FluentSchema.__str__`, los nombres de los métodos internos, y toda la documentación.

### 1.2 El problema fundamental de los orígenes múltiples

Para derivar correctamente los límites del modo implícito, es necesario entender por qué los términos con múltiples argumentos producen ambigüedad irreducible.

Dado el caso base unívoco:

```prolog
state_fluent(semaforo(X)) :- colores(X).
1/3::colores(verde); 1/3::colores(amarillo); 1/3::colores(rojo).
```

El grounding produce `semaforo(verde)`, `semaforo(amarillo)`, `semaforo(rojo)`. Un fluente, un dominio, tres valores. El `FluentSchema` recibe un grupo `enum` de 3 elementos. No hay ambigüedad.

Ahora dado el caso de dos argumentos:

```prolog
state_fluent(semaforo(X, Y)) :- colores(X), zona(Y).
1/3::colores(verde); 1/3::colores(amarillo); 1/3::colores(rojo).
zona(norte). zona(sur).
```

El grounding produce el producto cartesiano: `semaforo(verde, norte)`, `semaforo(verde, sur)`, `semaforo(amarillo, norte)`, `semaforo(amarillo, sur)`, `semaforo(rojo, norte)`, `semaforo(rojo, sur)`. Este conjunto de términos es compatible con **dos interpretaciones matemáticamente distintas**:

**Interpretación A — Dominio producto:** `semaforo` es un único factor de estado cuyo dominio es el conjunto completo de pares `(color, zona)`. No hay clave estática. El grupo `enum` tiene tamaño |colores| × |zona| = 6. El `FluentSchema` recibe un único factor de base 6.

**Interpretación B — Relacional con clave estática:** Existen |zona| instancias independientes del fluente `semaforo`, una por cada valor de `Y`. Cada instancia tiene como dominio los valores de `colores`. La clave estática es `zona` y el valor mutable es `colores`. El `FluentSchema` recibe dos factores de base 3, uno por cada zona. El espacio total de estados es 3 × 3 = 9, no 6.

Estas dos interpretaciones producen `FluentSchema`s matemáticamente distintos con diferente número de factores, diferentes strides, y diferente tamaño del espacio de estados. El sistema no puede elegir entre ellas sin la intención del usuario, y esta no es una deficiencia de diseño sino una propiedad del lenguaje: Prolog no tiene distinción sintáctica entre argumento-identificador y argumento-valor.

Esta imposibilidad define los límites exactos del modo implícito.

### 1.3 Límites formales del modo implícito

El modo implícito (`state_fluent/1`) es unívoco exclusivamente en los siguientes casos:

**Caso I — Término sin argumentos (arity 0):** Siempre `bool`. No hay dominio de valores, solo presencia o ausencia.

```prolog
state_fluent(encendido).
```

**Caso II — Término con exactamente un argumento simple:** El único argumento es el dominio. El motor verifica su origen (AD o hecho independiente) y clasifica. No hay ambigüedad posicional.

```prolog
state_fluent(semaforo(X)) :- colores(X).  % origen AD → enum
state_fluent(alarma(X))   :- zona(X).    % origen hecho independiente → bool
```

**Caso III — Término con exactamente un argumento compound (Compound Term):** El compound empaqueta toda la variabilidad en un único argumento. El término entero es el dominio. El motor lo trata igual que Caso II.

```prolog
state_fluent(position(coor(X,Y))) :- rows(X), col(Y).
```

Para términos con aridad ≥ 2 en el predicado del fluente, el modo implícito opera de forma condicionada según el origen de los argumentos:

**Caso IV — Término con aridad ≥ 2, todos los orígenes son hechos simples:** Ningún argumento proviene de una AD. No hay componente estocástico multivaluado. El sistema clasifica el fluente como `bool` silenciosamente, exactamente igual que lo haría con aridad 1 de origen simple. Cada grounding es una variable binaria independiente.

```prolog
state_fluent(position(X, Y)) :- row(X), col(Y).
row(1). row(2). col(1). col(2). col(3).
% → position(1,1), position(1,2), ... clasificados como bool individualmente
```

**Caso V — Término con aridad ≥ 2, al menos un origen proviene de una AD:** El sistema detecta ambigüedad irreducible. No puede determinar si el usuario quiere la Interpretación A (dominio producto, `enum` sin índice) o la Interpretación B (relacional con clave, `enum(N)`). Se registra un **error crítico V4** que detiene la compilación e indica exactamente las dos opciones de declaración explícita.

### 1.4 La sintaxis completa del contrato

Se definen cinco formas válidas de declaración, que cubren exhaustivamente todos los casos de uso:

---

**Forma 1 — `bool` explícito para término sin argumentos:**

```prolog
state_fluent(encendido, bool).
```

---

**Forma 2 — `bool` explícito para término con argumentos:**

```prolog
state_fluent(alarma(X), bool) :- zona(X).
```

Aplicable cuando el usuario quiere ser explícito sobre la naturaleza binaria, o cuando el origen es ambiguo para el motor (por ejemplo, un único valor de origen que podría confundirse con un enum de cardinalidad 1 en modelos complejos).

---


**Forma 3 — `enum` explícito sin índice (Interpretación A — dominio producto):**

```prolog
state_fluent(semaforo(X), enum) :- colores(X).
state_fluent(position(X, Y), enum) :- row(X), col(Y).
state_fluent(position(coor(X,Y)), enum) :- rows(X), col(Y).
```

El átomo `enum` sin índice es válido para cualquier aridad del predicado interno. Indica que **todos los groundings forman un único grupo mutuamente excluyente**, independientemente de cuántos argumentos tenga el término y sin importar si el origen son ADs o hechos simples. El motor agrupa todos los términos aterrizados bajo el functor como clave única (`mutable_idx = None`).

Para aridad 1, no hay ambigüedad. Para aridad ≥ 2, esta forma produce la **Interpretación A**: el dominio mutable es el conjunto completo de combinaciones de argumentos, sin distinción entre clave estática y valor mutable.

```
state_fluent(position(X,Y), enum) :- row(X), col(Y).
row(1). row(2).   col(1). col(2). col(3).

→ Un único grupo: [position(1,1), position(1,2), position(1,3),
                   position(2,1), position(2,2), position(2,3)]  base 6
```

El compound term (`coor(X,Y)`) sigue siendo sintácticamente válido pero ya no es necesario para expresar la Interpretación A. Ambas notaciones producen el mismo `FluentSchema`

**Lectura desde Python:**

```python
# value es el Term obtenido por engine.assignments('state_fluent')
if str(value) == 'bool':
    fluent_type = 'bool'
    mutable_idx = None

elif str(value) == 'enum':
    fluent_type = 'enum'
    # enum sin índice → Interpretación A: todos los groundings en un único grupo.
    # mutable_idx = None indica que no hay argumento mutable individual;
    # __get_group_key usará únicamente el functor como clave.
    mutable_idx = None

elif value.functor == 'enum' and len(value.args) == 1:
    fluent_type = 'enum'
    mutable_idx = int(value.args[0]) - 1  # base-1 Prolog → base-0 Python

else:
    raise FluentDeclarationError(f"Unknown type tag '{value}' ...")
```

---

**Forma 5 — Implícito `state_fluent/1` (solo aridad 0 o 1):**

```prolog
state_fluent(encendido).                           % arity 0 → bool
state_fluent(semaforo(X)) :- colores(X).           % arity 1, origen AD → enum
state_fluent(alarma(X))   :- zona(X).              % arity 1, origen hecho → bool
state_fluent(position(coor(X,Y))) :- rows(X), col(Y). % arity 1 compound → inferencia
```

Para términos con aridad ≥ 2, esta forma no está disponible. El motor emitirá `FluentArityError`.

---

### 1.5 El Compound Term como herramienta alternativa


El compound term (`coor(X,Y)`, `par(A,B)`) es una notación válida para la interpretación A. Con la incorporación de `enum` sin índice para aridad ≥ 2, el compound term se convierte en una alternativa sintáctica equivalente:

```prolog
% Estas dos declaraciones producen el mismo FluentSchema:
state_fluent(position(X, Y),      enum) :- row(X), col(Y).   % forma directa (canónica)
state_fluent(position(coor(X,Y)), enum) :- row(X), col(Y).   % compound term (alternativa)
```

La tabla completa de interpretaciones posibles para un fluente de aridad 2:

| Declaración | Interpretación | Resultado en FluentSchema |
|---|---|---|
| `state_fluent(f(X,Y), enum)` | A — dominio producto | 1 grupo, base = \|X\| × \|Y\| |
| `state_fluent(f(X,Y), enum(2))` | B — relacional, clave=X | \|X\| grupos, base = \|Y\| cada uno |
| `state_fluent(f(X,Y), enum(1))` | B — relacional, clave=Y | \|Y\| grupos, base = \|X\| cada uno |
| `state_fluent(f(pair(X,Y)), enum)` | A — dominio producto (compound) | 1 grupo, base = \|X\| × \|Y\| |

El motor debe comunicar esta distinción en sus mensajes de error de forma que el usuario pueda tomar la decisión correcta sin necesidad de consultar documentación externa.

---

## Fase II: Rediseño del Algoritmo de Inferencia

### 2.1 Eliminación de la Regla del Último Argumento

La regla actual:

```python
last_arg = term.args[-1]
if str(last_arg) in ads_vocabulary:
    fluent_type = 'ads'
```

Es eliminada completamente. No hay reemplazo para el caso multi-argumento. Para aridad 1, la inferencia es directa y no requiere regla posicional. Para aridad ≥ 2, no se infiere.

### 2.2 Refactorización de `get_ads_vocabulary()`

El método actual retorna un `set` plano de valores. Se refactoriza para retornar un `dict` que mapea cada predicado fuente a su conjunto de valores:

```python
# Retorno actual:
{'rojo', 'verde', 'amarillo', 'on', 'off'}

# Retorno nuevo:
{
    'colores': {'rojo', 'verde', 'amarillo'},
    'power':   {'on', 'off'}
}
```

Esto es posible porque los nodos `choice` en la `ClauseDB` contienen el `functor` del predicado fuente accesible vía `node.functor.args[2].functor`. La lógica de filtrado por `mutual_exclusive` se conserva intacta — es correcta y eficiente. Solo se añade la agrupación por functor en lugar del aplanamiento.

### 2.3 El nuevo algoritmo de inferencia para aridad 1

Para un término `state_fluent/1` con un único argumento (o un compound como único argumento), el algoritmo es:

```python
def _infer_fluent_type(self, grounded_terms, ads_vocab_by_predicate):
    """
    Infiere el tipo de un fluente implícito (state_fluent/1).
    Cubre aridad 0, 1 (incluyendo compound terms) y ≥ 2.

    Parámetros:
        grounded_terms:        lista de todos los términos aterrizados del mismo predicado.
        ads_vocab_by_predicate: dict {'predicado_fuente': {'val1', 'val2', ...}}

    Retorna: 'bool' | 'enum'
    Lanza:   FluentAmbiguityError si aridad >= 2 y al menos un origen es AD
    """
    if not grounded_terms:
        return 'bool'

    sample = grounded_terms[0]
    arity  = len(sample.args)

    # Aridad 0: siempre bool
    if arity == 0:
        return 'bool'

    # Aridad 1 (incluyendo compound term como único argumento):
    # Verificar si los valores en posición 0 provienen de algún vocabulario AD
    if arity == 1:
        values_at_pos = {str(t.args[0]) for t in grounded_terms}
        for vocab in ads_vocab_by_predicate.values():
            if values_at_pos.issubset(vocab):
                return 'enum'
        return 'bool'

    # Aridad >= 2: verificar si ALGÚN argumento proviene de una AD
    has_ad_origin = False
    for pos in range(arity):
        values_at_pos = {str(t.args[pos]) for t in grounded_terms}
        for vocab in ads_vocab_by_predicate.values():
            if values_at_pos.issubset(vocab):
                has_ad_origin = True
                break
        if has_ad_origin:
            break

    if not has_ad_origin:
        # Todos los orígenes son hechos simples → bool, sin aviso
        return 'bool'

    # Al menos un origen es AD → ambigüedad irreducible → error crítico V4
    raise FluentAmbiguityError(
        f"Fluent '{sample.functor}/{arity}' has arity {arity} in implicit mode "
        f"and at least one argument originates from an Annotated Disjunction.\n"
        f"The intended interpretation is ambiguous. Declare explicitly:\n"
        f"  state_fluent({sample.functor}(...), enum)    "
        f"— all groundings form a single group (product domain).\n"
        f"  state_fluent({sample.functor}(...), enum(N)) "
        f"— argument N is the mutable domain, all others are static keys."
    )
```

### 2.4 Actualización de `__get_group_key()`

El método recibe `mutable_idx` como parámetro explícito en lugar de hardcodear `args[:-1]`. Esto garantiza que el agrupamiento sea correcto independientemente de qué posición sea el argumento mutable:

```python
def __get_group_key(self, term, mutable_idx):
    def __get_group_key(self, term, mutable_idx):
    """
    Genera la clave de agrupamiento para un factor enum.

    Casos:
      mutable_idx = None  → Interpretación A: clave = solo el functor.
                            Todos los groundings van al mismo grupo.
      mutable_idx = int   → Interpretación B: clave = functor + args estáticos.
                            Un grupo por combinación de claves estáticas.

    Parámetros:
        term:        término aterrizado del fluente
        mutable_idx: índice Python (base 0) del argumento mutable, o None
    """
    # Interpretación A: enum sin índice → un único grupo bajo el functor
    if mutable_idx is None:
        return term.functor

    # Interpretación B: enum(N) → agrupar por argumentos estáticos
    static_args = [
        str(arg) for i, arg in enumerate(term.args)
        if i != mutable_idx
    ]

    if not static_args:
        return term.functor

    return "{}({})".format(term.functor, ','.join(static_args))
```

Para aridad 1, `mutable_idx = 0` y `static_args` queda vacío, retornando solo el functor. Este es el comportamiento correcto: todos los groundings del fluente pertenecen al mismo grupo.

---

## Fase III: Capa de Validación — Linter de Integridad

La validación se ejecuta antes de la construcción del schema. Los errores se acumulan en una lista y se reportan todos juntos al final, para que el usuario pueda corregir su modelo en una única iteración de lectura.

### 3.1 Jerarquía de excepciones

```python
class MDPProbLogError(Exception):
    """Excepción base para todos los errores de MDP-ProbLog."""

class FluentDeclarationError(MDPProbLogError):
    """
    Error en la declaración sintáctica de un fluente (state_fluent/2).
    Causas: etiqueta desconocida, índice mal formado.
    """

class FluentAmbiguityError(MDPProbLogError):
    """
    Ambigüedad irreducible en la clasificación de un fluente.
    Causa: state_fluent/1 con aridad >= 2 donde al menos un argumento
    proviene de una Disyunción Anotada. La intención (Interpretación A
    o B) no puede determinarse sin declaración explícita.
    """

class FluentInferenceError(MDPProbLogError):
    """
    Fallo en la inferencia automática (state_fluent/1).
    Causas: origen del argumento indeterminado o inconsistente.
    """

class FluentCardinalityError(MDPProbLogError):
    """
    Grupo enum con cardinalidad insuficiente.
    Causa: grupo enum con menos de 2 opciones tras el grounding.
    """
```

### 3.2 Reglas de validación


**V1 — Etiqueta desconocida:**
Si el segundo argumento de `state_fluent/2` no es `bool`, `enum`, ni `enum(N)`, se registra un `FluentDeclarationError` indicando la etiqueta recibida y el término afectado.

**V2 — Índice mal formado:**
Si se declara `enum(N)` pero `N` no es un entero positivo (por ejemplo `enum(0)`, `enum(x)`, `enum(1.5)`), se registra un `FluentDeclarationError` indicando el valor recibido y el término afectado.

**V3 — `enum(N)` con índice fuera de rango:**
Si se declara `enum(N)` pero la aridad del predicado interno del fluente es menor que `N`, se registra un `FluentDeclarationError`. El mensaje indica la aridad real del predicado y el índice declarado. Nota: `enum` sin índice para aridad ≥ 2 ya no es un error — produce la Interpretación A (§1.4 Forma 3).

**V4 — `state_fluent/1` con aridad ≥ 2 y origen AD (error crítico):**
Si el modo implícito recibe un término con aridad ≥ 2 y al menos un argumento proviene de una Disyunción Anotada, se registra un `FluentAmbiguityError`. El sistema no puede determinar la intención sin etiqueta explícita. El mensaje comunica las dos opciones concretas:

```
[ERROR V4] El fluente 'position/2' tiene aridad 2 en modo implícito y al menos
un argumento proviene de una Disyunción Anotada. La intención es ambigua.
Declara explícitamente:
  state_fluent(position(X,Y), enum)    — todos los groundings forman un único
                                         grupo (dominio producto, Interpretación A).
  state_fluent(position(X,Y), enum(N)) — el argumento N es el dominio mutable y
                                         los demás son claves estáticas (Interpretación B).
```

Si todos los argumentos provienen de hechos simples (ningún origen AD), el fluente se clasifica como `bool` silenciosamente — no hay ambigüedad estocástica.

**V5 — Cardinalidad insuficiente:**
Si un grupo `enum` construido (por cualquier modo) tiene menos de 2 elementos tras el grounding, se registra un `FluentCardinalityError`. Un grupo de 1 elemento es una paradoja lógica en un sistema de exclusión mutua (es una constante, no una variable estocástica) y destruye la validez del Mixed-Radix encoding. Esta regla existía antes y se conserva.

**V6 — Declaración duplicada o multi-cláusula (advertencia, no error):**

Esta regla cubre dos situaciones distintas bajo el mismo código de advertencia. En ambos casos el modelo se acepta y la compilación continúa, pero el usuario recibe un aviso explícito.

**V6a — Duplicado entre modos:** Si un término de fluente aparece tanto en `state_fluent/1` como en `state_fluent/2`, el sistema usa la declaración explícita (prioridad del modo explícito sobre el implícito, §1.4 Precedencia) y emite un `Warning` indicando el predicado afectado y la declaración que fue ignorada.

**V6b — Múltiples cláusulas con la misma cabeza:** Si el predicado `state_fluent/2` tiene más de una cláusula en la `ClauseDB` con el mismo functor y aridad en la cabeza del fluente (misma cabeza, diferente cuerpo), el motor emite un `Warning` con el siguiente formato:

```
[WARNING V6b] El fluente 'marketed/2' fue declarado mediante múltiples reglas:
  Regla 1: state_fluent(marketed(X,Y), enum(2)) :- person(X), type(Y).
  Regla 2: state_fluent(marketed(X,Y), enum(2)) :- person(X), country(Y).
Los groundings de ambas reglas se fusionan en un único grupo por clave estática.
Si la intención era declarar fluentes independientes, usa predicados distintos:
  state_fluent(marketing_type(X,Y),    enum(2)) :- person(X), type(Y).
  state_fluent(marketing_country(X,Y), enum(2)) :- person(X), country(Y).
```

La detección de V6b opera inspeccionando los nodos `define` de la `ClauseDB` para `state_fluent/2` agrupados por `(functor_del_fluente, aridad_del_fluente)`. Si algún functor aparece asociado a más de un nodo `define`, se activa el Warning.

> **Contexto de diseño:** En RDDL este escenario no puede ocurrir porque el sistema de tipos explícito separa `channel-type` de `country-type` antes de la declaración de cualquier variable. MDP-ProbLog no tiene sistema de tipos, por lo que la fusión accidental de dominios es un riesgo real. V6b es la respuesta proporcional: no puede prohibir el patrón (es Prolog válido y puede ser intencional), pero sí puede advertirlo con un mensaje que propone la solución idiomática —predicados separados— que es exactamente lo que RDDL haría por construcción.

**V7 — Colapso estructural advertido (advertencia, no error):**
Si en modo explícito `enum(N)` el motor detecta que otra posición del mismo término también tiene valores de origen AD, emite un `Warning` indicando que el modelo puede tener dependencias cruzadas no modeladas. El modelo se acepta pero el usuario recibe una guía clara.

---

## Fase IV: Actualización del Flujo en `__build_state_schema`

El método en `mdp.py` se reorganiza en una secuencia lineal y trazable:

```
PASO 1 — Recolección de datos del motor:
    explicit_fluents = engine.assignments('state_fluent')
        → dict {Term: Term_etiqueta}  (state_fluent/2)
    implicit_fluents = engine.declarations('state_fluent')
        → list [Term]                 (state_fluent/1)
    ads_vocab = engine.get_ads_vocabulary()
        → dict {'pred_fuente': {valor1, valor2, ...}}
    multi_clause_heads = _detect_multi_clause_heads()
        → set de (functor, aridad) con más de una cláusula en state_fluent/2
        → emitir Warning V6b por cada entrada de este set

PASO 2 — Validación estática (acumula todos los errores antes de lanzar):
    __validate_fluent_declarations(explicit_fluents, implicit_fluents)
    Si hay errores acumulados → lanzar resumen y detener.

PASO 3 — Clasificación de fluentes explícitos:
    Para cada (term, tag) en explicit_fluents:
        Parsear tag → (fluent_type, mutable_idx)
            'bool'    → fluent_type='bool', mutable_idx=None
            'enum'    → fluent_type='enum', mutable_idx=None  [Interpretación A]
            'enum(N)' → fluent_type='enum', mutable_idx=N-1   [Interpretación B]
        Almacenar en registro: term_str → (term, fluent_type, mutable_idx)

PASO 4 — Clasificación de fluentes implícitos (solo los no declarados explícitamente):
    Agrupar implicit_fluents por predicado/aridad
    Para cada grupo:
        Intentar: fluent_type = _infer_fluent_type(grounded_terms, ads_vocab)
            → aridad 0:              'bool',  mutable_idx=None
            → aridad 1, origen AD:   'enum',  mutable_idx=None
            → aridad 1, origen hecho:'bool',  mutable_idx=None
            → aridad ≥ 2, sin AD:    'bool',  mutable_idx=None
            → aridad ≥ 2, con AD:    lanza FluentAmbiguityError → registrar (V4)
        Para cada term en el grupo:
            Si term_str ya en registro → Warning V6a, omitir
            Si no → almacenar en registro con (fluent_type, mutable_idx)

PASO 5 — Agrupamiento en FluentSchema:
    enum_accumulator = {}
    Para cada (term, fluent_type, mutable_idx) en registro:
        Si fluent_type == 'bool':
            schema.add_bool(term)
        Si fluent_type == 'enum':
            group_key = __get_group_key(term, mutable_idx)
                # mutable_idx=None → key = term.functor       [Interpretación A]
                # mutable_idx=int  → key = functor(args estáticos) [Interpretación B]
            enum_accumulator[group_key].append(term)

PASO 6 — Validación de cardinalidad (V5) y construcción final:
    Para cada (group_key, terms) en enum_accumulator:
        Si len(terms) < 2 → registrar FluentCardinalityError
        Si no → schema.add_group(sorted(terms, key=str))
    Si hay errores acumulados → lanzar resumen y detener.

PASO 7 — Retornar schema.
```

**Invariante garantizada:** Al terminar el Paso 7, todo factor en el `FluentSchema` tiene una clasificación que proviene de una declaración explícita verificada o de una inferencia unívoca. No existe ningún factor clasificado por convención posicional implícita, y ninguna ambigüedad estocástica pasa silenciosamente al schema.

---

## Fase V: Cambios en `FluentSchema` y `fluent.py`

Los cambios en `fluent.py` son de nomenclatura y no afectan la lógica matemática del Mixed-Radix, que permanece intacta.

| Antes | Después | Alcance |
|-------|---------|---------|
| `add_bsf(term)` | `add_bool(term)` | método de `FluentSchema` |
| `[BSF] Boolean State Fluents` | `[BOOL] Boolean State Fluents` | output de `__str__` |
| `[ADS] Multivalued State Fluents` | `[ENUM] Multivalued State Fluents` | output de `__str__` |
| comentarios `# BSF branch` | `# bool branch` | comentarios internos |
| comentarios `# ADS branch` | `# enum branch` | comentarios internos |

El método `add_group()` en `FluentSchema` no se renombra porque su nombre describe su operación (agregar un grupo), no el tipo de fluente.

---

## Resumen del Contrato Lingüístico Final

| Declaración | Semántica | Modo | Comportamiento |
|---|---|---|---|
| `state_fluent(f, bool)` | Fluente binario sin argumentos | Explícito | 1 factor bool |
| `state_fluent(f(X), bool) :- base(X)` | Fluente binario, una instancia por X | Explícito | \|base\| factores bool |
| `state_fluent(f(X), enum) :- dom(X)` | Categórico, dominio = valores de dom | Explícito | 1 grupo enum, base = \|dom\| |
| `state_fluent(f(X,Y), enum) :- a(X), b(Y)` | Dominio producto, todos los pares | Explícito | 1 grupo enum, base = \|a\|×\|b\| |
| `state_fluent(f(pair(X,Y)), enum) :- a(X), b(Y)` | Dominio producto via compound | Explícito | 1 grupo enum, base = \|a\|×\|b\| |
| `state_fluent(f(X,Y), enum(2)) :- id(X), dom(Y)` | Categórico, clave=X, dominio=Y | Explícito | \|id\| grupos enum, base = \|dom\| |
| `state_fluent(f(X,Y,Z), enum(3)) :- a(X), b(Y), dom(Z)` | Categórico, claves=X,Y, dominio=Z | Explícito | \|a\|×\|b\| grupos enum, base = \|dom\| |
| `state_fluent(f)` | Motor infiere: aridad 0 → bool | Implícito | 1 factor bool |
| `state_fluent(f(X)) :- base(X)` | Motor infiere: origen AD→enum, hecho→bool | Implícito | 1 grupo o \|base\| factores |
| `state_fluent(f(coor(X,Y))) :- a(X), b(Y)` | Motor infiere sobre compound | Implícito | 1 grupo enum |
| `state_fluent(f(X,Y)) :- a(X), b(Y)` | Aridad ≥ 2, todos hechos → bool | Implícito | \|a\|×\|b\| factores bool |
| `state_fluent(f(X,Y)) :- a(X), AD(Y)` | **ERROR V4** — AD con aridad ≥ 2 | Implícito | `FluentAmbiguityError` |

**Regla de oro:** En modo implícito, la presencia de una AD con aridad ≥ 2 siempre requiere declaración explícita. Todos los demás casos son unívocos.

---

## Fase VI: Compatibilidad hacia Atrás y Ruta de Migración

**Modelos que no requieren cambio:**
Los modelos que usan `state_fluent(f(X), ads)` con aridad 1 solo necesitan renombrar `ads` → `enum`. Es la única migración manual requerida para modelos de aridad 1.

**Modelos afectados por la eliminación de la Regla del Último Argumento:**
Si un modelo usa `state_fluent/1` con aridad 1 y origen AD, el nuevo algoritmo produce el mismo resultado. No hay rotura: con aridad 1 el "último argumento" y el "único argumento" son el mismo.

**Modelos con `state_fluent/1`, aridad ≥ 2, todos los orígenes simples:**
Sin cambio. El sistema los clasifica como `bool` silenciosamente, igual que antes.

**Modelos con `state_fluent/1`, aridad ≥ 2, con al menos un origen AD:**
Rotura controlada. El sistema emite `FluentAmbiguityError` con un mensaje que guía al usuario a declarar `enum` o `enum(N)`. No hay degradación silenciosa.

**Modelos con `state_fluent(f(X,Y), ads)` (sin índice para aridad ≥ 2):**
Con la nueva regla, `enum` sin índice para aridad ≥ 2 es válido y produce la Interpretación A. Si el modelo anterior usaba `ads` esperando la Regla del Último Argumento (Interpretación B implícita), el usuario debe migrar a `enum(N)` para preservar la semántica. El Warning V6b puede ayudar a detectar estos casos.

---

## Roadmap de Implementación

| Paso | Módulo | Actividad | Dependencias |
|------|--------|-----------|--------------|
| 1 | `engine.py` | Refactorizar `get_ads_vocabulary()` → retorna `dict` agrupado por predicado fuente | Ninguna |
| 2 | `engine.py` | Implementar `get_multi_clause_heads()` → detecta cabezas de `state_fluent/2` con más de una cláusula en ClauseDB | Ninguna |
| 3 | `fluent.py` | Renombrar `add_bsf` → `add_bool`, actualizar labels en `__str__` | Ninguna |
| 4 | nuevo `exceptions.py` | Implementar jerarquía de 4 excepciones MDP-ProbLog | Ninguna |
| 5 | `mdp.py` | Implementar `_infer_fluent_type()` con el algoritmo de aridad 1 | Pasos 1 y 4 |
| 6 | `mdp.py` | Actualizar `__get_group_key()` para aceptar `mutable_idx` | Ninguna |
| 7 | `mdp.py` | Implementar parser del tag para `state_fluent/2` con soporte `bool`/`enum`/`enum(N)` | Paso 4 |
| 8 | `mdp.py` | Implementar `__validate_fluent_declarations()` con las 7 reglas (V1–V7, V6 con subcasos V6a y V6b) | Pasos 4, 5 y 7 |
| 9 | `mdp.py` | Reorganizar `__build_state_schema()` con el flujo de 7 pasos | Todos los anteriores |
| 10 | documentación | Actualizar `bsf_sintaxis.txt` → `bool_sintaxis.txt`, `mvsf_sintaxis.txt` → `enum_sintaxis.txt` | Paso 9 validado |

Los pasos 1, 2, 3 y 4 son completamente independientes entre sí. Los pasos 5, 6 y 7 dependen solo del paso 4. El paso 8 depende de 4, 5 y 7. El paso 9 integra todo. El paso 10 es posterior a la validación funcional completa.
