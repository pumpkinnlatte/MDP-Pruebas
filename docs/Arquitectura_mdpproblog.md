## 1. Introducción y Arquitectura Base

MDP-ProbLog es un framework construído sobre del lenguaje ProbLog diseñada para modelar y resolver Procesos de Decisión de Markov (MDPs) de horizonte infinito mediante programación lógica probabilística. El sistema transforma una especificación lógica de estados, acciones, transiciones y recompensas en un problema de **Inferencia Probabilística** sobre circuitos lógicos optimizados.

## 2. Representación de Estados: De lo Binario a lo Multivaluado

### A. Fluentes Binarios Independientes (Boolean)

Originalmente, MDP-ProbLog define estados mediante el predicado `state_fluent/1`, donde cada átomo aterrizado se trata como una variable de Bernoulli independiente.

- **Complejidad**: Genera un espacio de estados de $2n$ combinaciones lógicas.
- **Implementación**: Se inyectan en la base de datos como hechos simples (`add_fact`) con probabilidad neutra (0.5) para preservar su presencia en el circuito compilado.
    
### B. Grupos Mutuamente Excluyentes (ADS)

Para representar variables categóricas, se ha implementado el soporte para **Disyunciones Anotadas de Estado**.

- **Lógica One-Hot**: Las ADS garantizan que, dentro de un grupo definido, exactamente una opción sea verdadera. Esto elimina combinaciones lógicamente imposibles del espacio de estados físico.
- **Numeral Mixed-Radix**: La clase `FactorSpace` utiliza un sistema de numeración de base mixta para iterar sobre las valoraciones. El tamaño total de estados se define ahora como ∏i=1k​bi​, donde bi​ es la base (número de opciones) de cada factor del esquema.
    
## 3. Ciclo de Vida Computacional del MDP

### Fase 1: Inicialización y Parsing

El modelo textual ingresa vía `PrologString`, el cual valida la sintaxis y lo entrega al `DefaultEngine`. El motor construye la **ClauseDB**, una tabla de instrucciones indexada que contiene la lógica estática del programa.

### Fase 2: Construcción del Esquema (`FluentSchema`)

El sistema ejecuta `__build_state_schema()` para clasificar los fluentes. Utiliza `infer_types()` para rastrear el origen de las definiciones en la `ClauseDB`:

- Si un fluente deriva de un predicado que es una disyunción anotada, este se clasifica como multivaluado.
- En caso contrario, se trata como un **Boolean** binario independiente.
    

### Fase 3: Inyección Probabilística y Temporización

Se preparan los hechos _dummy_ para el tiempo t=0:

- **Boolean**: Se inyectan con `add_fact(term, 0.5)`.
- **Enum**: Se inyectan mediante `add_annotated_disjunction(terms, probs)`, donde `probs` es una distribución uniforme 1/N. Esto crea nodos `choice` internos que actúan como las raíces estocásticas del grafo.
    

### Fase 4: Grounding Relevante y Preservación de Nombres

Se genera el programa aterrizado proposicional (`LogicFormula`). Un cambio crítico en esta fase es la expansión de la lista de consultas:

- **Queries**: `list(set(utilities) | set(next_state) | set(actions) | set(current_state_fluents))`.
- **Importancia**: Incluir los fluentes de estado actual (t=0) en la lista de consultas garantiza que sus nombres no sean optimizados por el motor de ProbLog. Esto permite que el evaluador localice los nodos por su identificador lógico original.
    

### Fase 5: Compilación y Evaluación (`self._knowledge`)

La fórmula se compila en una estructura `Evaluatable` (SDD o d-DNNF). El método `evaluate` instancia un `Evaluator` que aplica los pesos de evidencia (el estado y acción actuales) sobre los nodos nombrados para calcular la probabilidad de transición conjunta P(x′∣x,a).

## 4. El Motor de Inferencia: Evaluator y WMC

### Mecánica del Weighted Model Counting (WMC)

El cálculo de P(x′∣x,a) se basa en sumar los pesos de todos los modelos (mundos posibles) que satisfacen la consulta.

- **Pesos**: Cada literal tiene un peso asignado. El peso de un mundo es el producto de los pesos de sus literales independientes.
    
- **Sustitución de Pesos vs. Evidencia**: Al pasar el estado actual como evidencia, el sistema realiza una sustitución de pesos directa en las hojas del circuito aritmético (0.5→1.0 o 0.0).
    
- **Equivalencia Condicional**: Forzar el peso del estado actual a 1.0 en un circuito factorizado es matemáticamente equivalente a calcular la probabilidad condicional de Bayes, eliminando la necesidad de calcular explícitamente el denominador.
## 5. Estructuras Internas Críticas de la API

| Estructura       | Función Principal                       | Rol en MDP-ProbLog                                                               |
| :--------------- | :-------------------------------------- | :------------------------------------------------------------------------------- |
| **ClauseDB**     | Tabla de instrucciones indexada.        | Almacena el modelo y recibe inyecciones de Ads para los grupos de fluentes enum. |
| **LogicFormula** | Grafo AND-OR proposicional.             | Representa el programa aterrizado relevante para utilidades y transiciones.      |
| **Evaluatable**  | Circuito lógico compilado (SDD/d-DNNF). | Almacenado en `self._knowledge`, permite inferencia en tiempo polinomial.        |
| **Evaluator**    | Motor de cálculo numérico.              | Realiza el WMC aplicando la evidencia del estado actual.                         |
| **Semiring**     | Álgebra de operaciones.                 | Define la suma y el producto para el cálculo de probabilidades marginales.       |

## 6. Consideraciones para Fluentes Multivaluados (enum)

Para asegurar la consistencia en variables de estado multivaluadas, se verifican los siguientes requisitos:

1. **Etiquetado**: Los nombres de los fluentes de estado actual (t=0) deben ser incluidos en la lista de `queries` durante el _grounding_.
2. **Consistencia de Evidencia**: El parámetro `weights` del evaluador debe usarse para modificar las probabilidades base de los hechos raíz (`choice`).
3. **Exclusión Mutua Estricta**: La inyección de ADS asegura que la suma de probabilidades de los nodos hijos sea exactamente 1.0.
4. **Transiciones Consistentes**: El modelo lógico debe definir destinos exhaustivos para evitar la pérdida de masa probabilística en t=1.