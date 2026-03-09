# Validación Matemática de la Extensión de Fluentes Multivaluados en MDP-ProbLog

**Documento de Fundamentación Formal**
**Versión:** 1.0 — Marzo 2026
**Contexto:** Preparación para IBERAMIA 2026

---

## 0. Convenciones de Notación

| Símbolo | Significado |
|---------|-------------|
| $M = (\mathcal{S}, \mathcal{A}, P, R, \gamma)$ | Proceso de Decisión de Markov |
| $\mathcal{S}, s, s'$ | Espacio de estados, estado actual, estado sucesor |
| $\mathcal{A}, a$ | Espacio de acciones, acción |
| $P(s' \mid s, a)$ | Probabilidad de transición |
| $R(s, a)$ | Función de recompensa |
| $\gamma \in [0, 1)$ | Factor de descuento |
| $V^*(s), Q^*(s, a)$ | Funciones de valor óptimas |
| $\pi^*$ | Política óptima |
| $T^*$ | Operador de optimalidad de Bellman |
| $\mathbf{x} = (x_1, \ldots, x_n)$ | Vector de fluentes de estado |
| $x_k$ | Factor $k$-ésimo del espacio de estados |
| $b_k$ | Base (cardinalidad) del factor $k$ |
| $\sigma_k$ | Stride (desplazamiento posicional) del factor $k$ |
| $\Delta(\mathcal{X})$ | Símplex de probabilidad sobre el conjunto $\mathcal{X}$ |
| $\mathbb{1}\{A\}$ | Función indicadora del evento $A$ |

---

## 1. Introducción y Alcance

### 1.1 Objeto de Estudio

MDP-ProbLog (Bueno et al., 2016) es un framework que modela MDPs de horizonte infinito con descuento mediante programación lógica probabilística. El sistema original opera exclusivamente con **fluentes de estado booleanos** (binarios), donde cada variable $x_i \in \{0, 1\}$ y el espacio de estados tiene tamaño $|\mathcal{S}| = 2^n$.

La extensión propuesta introduce **fluentes multivaluados** (categóricos): variables $x_k$ que toman valores en un dominio finito $\mathcal{D}_k = \{v_1, \ldots, v_{b_k}\}$ con $b_k \geq 2$, donde exactamente un valor está activo en cada estado (exclusión mutua). Esto generaliza el espacio de estados a:

$$|\mathcal{S}| = \prod_{k=1}^{n} b_k$$

donde $b_k = 2$ para factores booleanos y $b_k \geq 2$ para factores multivaluados.

### 1.2 Obligación de Prueba

Debemos demostrar formalmente que:

1. La representación generalizada preserva la estructura de MDP válido.
2. La codificación mixed-radix es una biyección entre valuaciones y índices enteros.
3. La factorización de la función de transición conjunta sigue siendo correcta.
4. El operador de Bellman generalizado es una contracción y Value Iteration converge.
5. Se pueden cuantificar los errores introducidos por el truncamiento heurístico.

### 1.3 Supuestos Formales

Enunciamos explícitamente los supuestos sobre los que se construye la validación:

**(A1) MDP finito con descuento.** $\mathcal{S}$ y $\mathcal{A}$ son conjuntos finitos, $0 \leq \gamma < 1$.

**(A2) Factorización del espacio de estados.** El estado $s$ se descompone en $n$ factores independientes: $s = (x_1, \ldots, x_n)$, donde cada $x_k$ toma valores en $\mathcal{D}_k$ con $|\mathcal{D}_k| = b_k$.

**(A3) Independencia condicional de transiciones.** Los factores del estado sucesor son condicionalmente independientes dado el estado actual y la acción:

$$P(s' \mid s, a) = \prod_{k=1}^{n} P(x'_k \mid s, a) \tag{1}$$

**(A4) Consistencia probabilística por factor.** Para cada factor $k$, estado $s$ y acción $a$:

$$\sum_{v \in \mathcal{D}_k} P(x'_k = v \mid s, a) = 1 \tag{2}$$

**(A5) Modelos ProbLog completos (two-valued).** Cada realización de los hechos probabilísticos induce un programa lógico con un modelo bien-fundado completo.

**(A6) Exclusión mutua por construcción.** Los fluentes multivaluados se inyectan como Disyunciones Anotadas (AD) en ProbLog, lo que garantiza la exclusión mutua a nivel proposicional para el estado actual ($t=0$). Para el estado futuro ($t=1$), la exclusión mutua depende de las reglas del usuario (ver Sección 4).

---

## 2. Representación del Espacio de Estados Generalizado

### 2.1 Definición: Espacio de Estados Factorizado de Base Mixta

**Definición 2.1** (Espacio de estados factorizado). Sea $\mathcal{F} = \{F_1, \ldots, F_n\}$ una colección ordenada de factores, donde cada factor $F_k$ tiene base $b_k \geq 2$ y dominio $\mathcal{D}_k$. El espacio de estados factorizado es el producto cartesiano:

$$\mathcal{S} = \mathcal{D}_1 \times \mathcal{D}_2 \times \cdots \times \mathcal{D}_n$$

con tamaño $|\mathcal{S}| = \prod_{k=1}^{n} b_k$.

**Definición 2.2** (Tipos de factor).

- **Factor booleano (Bool):** $b_k = 2$, $\mathcal{D}_k = \{0, 1\}$. Representado por un único término ProbLog.
- **Factor multivaluado (Multivalued):** $b_k \geq 2$, $\mathcal{D}_k = \{v_1, \ldots, v_{b_k}\}$. Representado por $b_k$ términos ProbLog mutuamente excluyentes (codificación one-hot).

### 2.2 Codificación Mixed-Radix

**Definición 2.3** (Strides posicionales). Para la secuencia de bases $(b_1, \ldots, b_n)$, el stride del factor $k$ se define como:

$$\sigma_k = \prod_{i=1}^{k-1} b_i, \qquad \sigma_1 = 1 \tag{3}$$

**Definición 2.4** (Función de codificación). La codificación mixed-radix $\text{enc}: \mathcal{S} \to \{0, 1, \ldots, |\mathcal{S}|-1\}$ se define como:

$$\text{enc}(x_1, \ldots, x_n) = \sum_{k=1}^{n} \ell_k(x_k) \cdot \sigma_k \tag{4}$$

donde $\ell_k: \mathcal{D}_k \to \{0, 1, \ldots, b_k - 1\}$ es el índice local del valor $x_k$ dentro del factor $F_k$.

**Teorema 2.1** (Biyección de la codificación mixed-radix). *La función $\text{enc}$ es una biyección de $\mathcal{S}$ a $\{0, 1, \ldots, |\mathcal{S}|-1\}$.*

**Demostración.**

Procedemos por construcción directa, mostrando que enc es inyectiva y suprayectiva.

**Inyectividad.** Sean $s = (x_1, \ldots, x_n)$ y $s' = (x'_1, \ldots, x'_n)$ dos estados distintos con $\text{enc}(s) = \text{enc}(s')$. Entonces:

$$\sum_{k=1}^{n} \ell_k(x_k) \cdot \sigma_k = \sum_{k=1}^{n} \ell_k(x'_k) \cdot \sigma_k$$

Dado que $0 \leq \ell_k(x_k) < b_k$ para todo $k$ y que $\sigma_{k+1} = b_k \cdot \sigma_k$, por la unicidad de la representación en un sistema posicional de bases mixtas (generalización directa del teorema de representación en base $b$; véase Knuth, *TAOCP* Vol. 2, Sec. 4.1), concluimos que $\ell_k(x_k) = \ell_k(x'_k)$ para todo $k$. Como $\ell_k$ es inyectiva dentro de cada factor (los valores del dominio tienen índices distintos), $x_k = x'_k$ para todo $k$, contradiciendo la hipótesis de que $s \neq s'$.

**Suprayectividad.** Para cualquier índice $m \in \{0, \ldots, |\mathcal{S}|-1\}$, la decodificación mixed-radix estándar produce una valuación válida:

$$\ell_k = \left\lfloor m / \sigma_k \right\rfloor \bmod b_k, \qquad k = 1, \ldots, n$$

Dado que $0 \leq \ell_k < b_k$, cada $\ell_k$ indexa un valor válido en $\mathcal{D}_k$, y se verifica fácilmente que $\text{enc}(\ell_1^{-1}(\ell_1), \ldots, \ell_n^{-1}(\ell_n)) = m$. $\square$

**Observación 2.1.** Cuando $b_k = 2$ para todo $k$, la codificación mixed-radix se reduce a codificación binaria estándar con $\sigma_k = 2^{k-1}$. Esto demuestra que la extensión multivaluada es una **generalización estricta** del caso original, que se recupera como caso particular.

### 2.3 Correspondencia con la Implementación

La codificación mixed-radix de la ecuación (4) corresponde exactamente a la implementación en `FluentSchema.strides` (ecuación (3)) y `FactorSpace.__getitem__` / `FactorSpace.index` (ecuación (4) y su inversa). La decodificación se realiza mediante la operación módulo-y-división entera:

```python
# FactorSpace.__getitem__(index) — Decodificación
for base, options in zip(bases, factors):
    active = temp_index % base      # ℓ_k = ⌊m / σ_k⌋ mod b_k
    temp_index //= base             # avance al siguiente factor
```

```python
# FactorSpace.index(valuation) — Codificación
idx += active_value * strides[k]    # enc = Σ ℓ_k · σ_k
```

---

## 3. Función de Transición Factorizada Generalizada

### 3.1 Formulación Original (Caso Booleano)

En el framework original (Bueno et al., 2016, Ec. 5), la transición conjunta se factoriza como:

$$P(s' \mid s, a) = \prod_{i=1}^{n} P(x'_i \mid s, a), \qquad x'_i \in \{0, 1\} \tag{5}$$

Para cada fluente booleano, el motor WMC calcula $p_i = P(x'_i = 1 \mid s, a)$, y la probabilidad de $x'_i = 0$ es implícitamente $1 - p_i$. El valor esperado futuro se calcula mediante recursión binaria sobre el árbol de expansión de $2^n$ hojas.

### 3.2 Formulación Generalizada (Caso de Base Mixta)

**Definición 3.1** (Distribución marginal por factor). Para cada factor $F_k$ con dominio $\mathcal{D}_k = \{v_1, \ldots, v_{b_k}\}$, definimos la distribución marginal condicionada:

$$P_k(\cdot \mid s, a) \in \Delta(\mathcal{D}_k), \qquad P_k(v_j \mid s, a) = P(x'_k = v_j \mid s, a) \tag{6}$$

Bajo el supuesto (A3), la transición conjunta generalizada es:

$$P(s' \mid s, a) = \prod_{k=1}^{n} P_k(x'_k \mid s, a) \tag{7}$$

**Teorema 3.1** (Distribución de transición válida). *Bajo los supuestos (A1)-(A4), la ecuación (7) define una distribución de probabilidad válida sobre $\mathcal{S}$ para cada par $(s, a)$. Es decir:*

$$\forall (s, a): \quad \sum_{s' \in \mathcal{S}} P(s' \mid s, a) = 1 \tag{8}$$

**Demostración.**

$$\sum_{s' \in \mathcal{S}} P(s' \mid s, a) = \sum_{x'_1 \in \mathcal{D}_1} \cdots \sum_{x'_n \in \mathcal{D}_n} \prod_{k=1}^{n} P_k(x'_k \mid s, a)$$

Por la independencia condicional (A3), los factores del producto no comparten variables, así que la suma se factoriza:

$$= \prod_{k=1}^{n} \left( \sum_{v \in \mathcal{D}_k} P_k(v \mid s, a) \right) = \prod_{k=1}^{n} 1 = 1$$

donde la penúltima igualdad usa el supuesto (A4). $\square$

**Observación 3.1** (Rol crítico de (A4)). El supuesto (A4) no se verifica automáticamente para $t=1$. Mientras que la inyección de Disyunciones Anotadas en $t=0$ garantiza la exclusión mutua por construcción de ProbLog (los nodos `choice` imponen $\sum_j p_j \leq 1$), las probabilidades marginales en $t=1$ dependen enteramente de las reglas lógicas del usuario. Si las reglas permiten la derivación simultánea de dos valores del mismo grupo categórico, se puede violar (A4). Este es un punto de validación empírica obligatorio (ver Sección 6, Fase 1).

### 3.3 Valor Esperado Futuro Generalizado

**Definición 3.2** (Valor esperado futuro). Para una función de valor $V: \mathcal{S} \to \mathbb{R}$ y una transición factorizada, el valor esperado futuro es:

$$\mathbb{E}[V(s') \mid s, a] = \sum_{s' \in \mathcal{S}} P(s' \mid s, a) \cdot V(s') \tag{9}$$

**Teorema 3.2** (Cómputo recursivo por factores). *El valor esperado futuro puede calcularse recursivamente sobre los factores. Definiendo:*

$$E_k(i, p) = \begin{cases}
p \cdot V(i) & \text{si } k = n + 1 \\
\displaystyle\sum_{v \in \mathcal{D}_k} E_{k+1}\!\left(i + \ell_k(v) \cdot \sigma_k, \; p \cdot P_k(v \mid s, a)\right) & \text{si } k \leq n
\end{cases}$$

*se tiene que $\mathbb{E}[V(s') \mid s, a] = E_1(0, 1)$.*

**Demostración.**

Por inducción sobre $n$ (número de factores).

**Caso base ($n = 0$).** El espacio de estados tiene un único estado ($|\mathcal{S}| = 1$). La función de transición es trivial: $P(s_0 \mid s, a) = 1$. Se tiene $E_1(0, 1) = 1 \cdot V(0) = V(s_0) = \sum_{s'} P(s' \mid s, a) V(s')$. $\checkmark$

**Paso inductivo.** Supongamos que el resultado es correcto para $n-1$ factores. Para $n$ factores:

$$\mathbb{E}[V(s')] = \sum_{x'_1 \in \mathcal{D}_1} \cdots \sum_{x'_n \in \mathcal{D}_n} \left(\prod_{k=1}^{n} P_k(x'_k \mid s,a)\right) V(\text{enc}(x'_1, \ldots, x'_n))$$

Extraemos la suma sobre el primer factor:

$$= \sum_{v \in \mathcal{D}_1} P_1(v \mid s,a) \underbrace{\sum_{x'_2} \cdots \sum_{x'_n} \left(\prod_{k=2}^{n} P_k(x'_k \mid s,a)\right) V\!\left(\ell_1(v) \cdot \sigma_1 + \sum_{k=2}^n \ell_k(x'_k) \cdot \sigma_k\right)}_{= E_2(\ell_1(v) \cdot \sigma_1, \; P_1(v \mid s,a)) \text{ por hipótesis inductiva}}$$

La expresión subrayada corresponde a un problema de $n-1$ factores con índice base desplazado por $\ell_1(v) \cdot \sigma_1$ y probabilidad acumulada $P_1(v \mid s,a)$. Por hipótesis inductiva, esta coincide con $E_2(\ell_1(v) \cdot \sigma_1, P_1(v \mid s,a))$. Sumando sobre $v$:

$$= \sum_{v \in \mathcal{D}_1} E_2(\ell_1(v) \cdot \sigma_1, \; P_1(v \mid s,a)) = E_1(0, 1)$$

lo cual es exactamente la definición recursiva. $\square$

**Correspondencia con la implementación.** La función `ValueIteration.__expected_value` implementa $E_k$ con parámetros `k` (profundidad de recursión), `current_index` ($i$), y `joint` ($p$). La lista `transition_groups[k]` contiene los pares $(v, P_k(v \mid s,a))$ con probabilidades no despreciables. El método `FluentSchema.get_local_index(k, term)` computa $\ell_k(v)$.

### 3.4 Complejidad del Cómputo Recursivo

**Proposición 3.1** (Complejidad del valor esperado). *Sea $m_k$ el número de ramas activas (probabilidad $> \epsilon_{\text{thr}}$) del factor $k$. La complejidad del cómputo recursivo es:*

$$O\!\left(\prod_{k=1}^{n} m_k\right) \tag{10}$$

*En el peor caso, $m_k = b_k$ para todo $k$ y la complejidad es $O(|\mathcal{S}|)$. En dominios con transiciones sparse (muchas ramas con $p \approx 0$), $m_k \ll b_k$ y la complejidad se reduce significativamente.*

**Demostración.** La recursión genera un árbol de expansión donde cada nodo en el nivel $k$ tiene $m_k$ hijos. El número total de hojas es $\prod_{k=1}^n m_k$, y cada hoja requiere $O(1)$ operaciones (una multiplicación y un lookup en $V$). El número de nodos internos es menor al de hojas, así que la complejidad total es $O(\prod_k m_k)$. $\square$

**Observación 3.2.** En el caso original puramente booleano, $b_k = 2$ y $m_k \leq 2$ para todo $k$, dando $O(2^n) = O(|\mathcal{S}|)$. La extensión multivaluada no empeora la complejidad asintótica; ambos enfoques son $O(|\mathcal{S}|)$ en el peor caso. La diferencia es que el filtro sparse puede ser más efectivo para factores multivaluados donde solo unas pocas opciones tienen probabilidad no despreciable.

---

## 4. Conservación de la Masa Probabilística

Este es el primer punto crítico de validación. Necesitamos establecer bajo qué condiciones el supuesto (A4) se satisface.

### 4.1 Estado Actual ($t = 0$): Garantía por Construcción

**Proposición 4.1** (Masa unitaria en $t=0$). *Para factores booleanos inyectados con `add_fact(term, 0.5)` y factores multivaluados inyectados con `add_annotated_disjunction`, la masa probabilística de cada factor en $t=0$ es exactamente 1.*

**Demostración.**

**Caso Bool.** El hecho `term(0)` se inyecta con probabilidad $p = 0.5$. Bajo la Distribution Semantics (Sato, 1995), esto genera dos mundos posibles: uno donde `term(0)` es verdadero (prob. 0.5) y otro donde es falso (prob. 0.5). La suma es $0.5 + 0.5 = 1$. Crucialmente, durante la evaluación, la evidencia fija $p = 0$ o $p = 1$, lo cual preserva la masa unitaria: $1 + 0 = 1$ o $0 + 1 = 1$.

**Caso Multivalued.** La AD `add_annotated_disjunction(terms, [1/N]*N)` genera nodos `choice` internos en ProbLog con restricción de exclusión mutua. Por la semántica de las ADs en ProbLog (De Raedt et al., 2007), exactamente una opción se selecciona con la probabilidad asignada. La suma $\sum_{j=1}^N 1/N = 1$. Si $\sum_j p_j < 1$, ProbLog asigna implícitamente la masa residual a un átomo oculto `null`, preservando la masa unitaria. $\square$

### 4.2 Estado Futuro ($t = 1$): Dependencia del Modelo del Usuario

**Proposición 4.2** (Condición necesaria y suficiente para masa unitaria en $t=1$). *Para un factor multivaluado $F_k$ con dominio $\mathcal{D}_k = \{v_1, \ldots, v_{b_k}\}$, la condición $\sum_j P(x'_k = v_j \mid s, a) = 1$ se satisface si y solo si las reglas de transición del programa ProbLog garantizan que, para cada mundo posible consistente con la evidencia $(s, a)$, exactamente un valor $v_j$ es derivable en $t=1$.*

**Demostración.** ($\Rightarrow$) Si $\sum_j P(x'_k = v_j \mid s, a) = 1$ y los eventos $\{x'_k = v_j\}$ son mutuamente excluyentes (por la semántica de las ADs del modelo de transición), entonces en cada mundo posible exactamente un $v_j$ es verdadero.

($\Leftarrow$) Si en cada mundo posible exactamente un $v_j$ es verdadero, entonces $\{x'_k = v_j\}_{j=1}^{b_k}$ forman una partición del espacio muestral condicionado a $(s, a)$. Por los axiomas de Kolmogórov:

$$\sum_{j=1}^{b_k} P(x'_k = v_j \mid s, a) = P\!\left(\bigcup_{j=1}^{b_k} \{x'_k = v_j\}\right) = P(\Omega) = 1 \quad \square$$

**Observación 4.1** (Modos de fallo). Existen dos modos en que un modelo de usuario puede violar (A4):

1. **Sobredeterminación:** Dos o más valores de un grupo son simultáneamente derivables, causando $\sum_j P_j > 1$.
2. **Subdeterminación:** Ningún valor es derivable en algún mundo, causando $\sum_j P_j < 1$.

Ambos son errores lógicos del programa Prolog, no del framework. Sin embargo, el framework debe detectarlos (Sección 6, Fase 1).

### 4.3 Impacto de la Violación de (A4) sobre Value Iteration

**Proposición 4.3** (Propagación del error de masa). *Sea $\delta_k(s, a) = \left|1 - \sum_{v \in \mathcal{D}_k} P_k(v \mid s, a)\right|$ el error de masa del factor $k$. Si existe al menos un factor con $\delta_k > 0$, entonces las filas de la matriz de transición no suman 1, y el operador de Bellman puede no ser una $\gamma$-contracción.*

**Demostración.** Consideremos $P(s' \mid s, a)$ definida por (7). La suma sobre todos los estados sucesores:

$$\sum_{s'} P(s' \mid s, a) = \prod_{k=1}^{n} \left(\sum_{v \in \mathcal{D}_k} P_k(v \mid s, a)\right) = \prod_{k=1}^{n} (1 \pm \delta_k)$$

Si algún $\delta_k > 0$, este producto difiere de 1. Para el operador de Bellman $T^*$:

$$(T^* V)(s) = \max_{a} \left\{ R(s,a) + \gamma \sum_{s'} P(s' \mid s, a) V(s') \right\}$$

la contracción requiere que $\gamma \sum_{s'} P(s' \mid s, a) = \gamma < 1$. Si la suma difiere de 1, el factor efectivo de contracción pasa a ser $\gamma \cdot \prod_k (1 \pm \delta_k)$, que podría superar 1 si los errores son suficientemente grandes, destruyendo la convergencia garantizada. $\square$

---

## 5. Convergencia de Value Iteration Generalizado

### 5.1 Operador de Bellman sobre Espacio de Base Mixta

**Definición 5.1** (Operador de optimalidad de Bellman). Para el MDP factorizado generalizado, el operador $T^*: \mathbb{R}^{|\mathcal{S}|} \to \mathbb{R}^{|\mathcal{S}|}$ se define como:

$$(T^* V)(s) = \max_{a \in \mathcal{A}} \left\{ R(s, a) + \gamma \sum_{s' \in \mathcal{S}} P(s' \mid s, a) \cdot V(s') \right\} \tag{11}$$

**Teorema 5.1** (Contracción y convergencia). *Bajo los supuestos (A1)-(A4), el operador $T^*$ es una $\gamma$-contracción en norma supremo. Es decir, para toda $V, W \in \mathbb{R}^{|\mathcal{S}|}$:*

$$\|T^* V - T^* W\|_\infty \leq \gamma \|V - W\|_\infty \tag{12}$$

*Consecuentemente, $T^*$ tiene un único punto fijo $V^*$ y la secuencia $V^{(i+1)} = T^* V^{(i)}$ converge a $V^*$ desde cualquier inicialización.*

**Demostración.**

La prueba es una instancia directa del Teorema de Punto Fijo de Banach aplicado al operador de Bellman sobre MDPs finitos con descuento (Puterman, 2014, Teorema 6.2.3). Lo esencial es verificar que las **condiciones del teorema se satisfacen en el espacio generalizado**.

Sea $s \in \mathcal{S}$ arbitrario. Para cualquier acción $a$:

$$\left| \sum_{s'} P(s' \mid s,a) V(s') - \sum_{s'} P(s' \mid s,a) W(s') \right| = \left| \sum_{s'} P(s' \mid s,a) (V(s') - W(s')) \right|$$

$$\leq \sum_{s'} P(s' \mid s,a) |V(s') - W(s')| \leq \|V - W\|_\infty \underbrace{\sum_{s'} P(s' \mid s,a)}_{= 1 \text{ por (A4) y Teorema 3.1}}$$

Por lo tanto:

$$|(T^* V)(s) - (T^* W)(s)| = \left|\max_a Q_V(s,a) - \max_a Q_W(s,a)\right|$$

$$\leq \max_a |Q_V(s,a) - Q_W(s,a)| \leq \gamma \|V - W\|_\infty$$

Tomando supremo sobre $s$: $\|T^*V - T^*W\|_\infty \leq \gamma \|V - W\|_\infty$.

Como $\gamma < 1$ y $(\mathbb{R}^{|\mathcal{S}|}, \|\cdot\|_\infty)$ es un espacio de Banach completo (dimensión finita), el Teorema del Punto Fijo de Banach garantiza existencia, unicidad del punto fijo y convergencia geométrica. $\square$

**Observación 5.1** (Invarianza respecto a la codificación). La contracción del operador de Bellman depende únicamente de las propiedades de la distribución de transición (positividad y normalización) y del factor de descuento, no de la representación interna de los estados (binaria, mixed-radix, o cualquier otra biyección). La codificación mixed-radix es una elección de implementación que no altera las propiedades matemáticas del operador.

### 5.2 Criterio de Convergencia y Política $\varepsilon$-Óptima

**Teorema 5.2** (Puterman, 2014, Teorema 6.6.2). *Si Value Iteration se detiene cuando $\|V^{(i+1)} - V^{(i)}\|_\infty \leq \frac{\varepsilon(1-\gamma)}{2\gamma}$, entonces la política greedy $\pi_i$ respecto a $V^{(i)}$ satisface:*

$$\|V^{\pi_i} - V^*\|_\infty \leq \varepsilon$$

**Correspondencia con la implementación.** El criterio en `value_iteration.py`:

```python
if max_residual <= 2 * epsilon * (1 - gamma) / gamma:
    break
```

es algebraicamente equivalente a $\|V^{(i+1)} - V^{(i)}\|_\infty \leq \frac{\varepsilon'(1-\gamma)}{2\gamma}$ con $\varepsilon' = 4\varepsilon$. Esto significa que el parámetro `epsilon` del código produce una política $(4\varepsilon)$-óptima, no $\varepsilon$-óptima. Esta es una diferencia de parametrización, no un error; simplemente el `epsilon` del código tiene una semántica ligeramente distinta.

**Nota:** Si se desea que `epsilon` represente exactamente la $\varepsilon$-optimalidad de Puterman, la condición debería ser:

```python
if max_residual <= epsilon * (1 - gamma) / (2 * gamma):
    break
```

---

## 6. Cuantificación del Error de Truncamiento (Sparse Filter)

### 6.1 Formulación del Problema

El método `structured_transition` aplica un filtro que descarta ramas con probabilidad menor a $\epsilon_{\text{thr}} = 10^{-6}$:

```python
if p > 1e-6:
    group_data.append((term, p))
```

Esto introduce un error en la distribución de transición.

**Definición 6.1** (Distribución truncada). Sea $\tilde{P}_k(\cdot \mid s, a)$ la distribución marginal del factor $k$ tras el truncamiento:

$$\tilde{P}_k(v \mid s, a) = \begin{cases} P_k(v \mid s, a) & \text{si } P_k(v \mid s, a) > \epsilon_{\text{thr}} \\ 0 & \text{en caso contrario} \end{cases}$$

**Definición 6.2** (Masa perdida por factor). El defecto de masa del factor $k$ es:

$$\delta_k(s, a) = \sum_{v: P_k(v \mid s,a) \leq \epsilon_{\text{thr}}} P_k(v \mid s, a) \leq b_k \cdot \epsilon_{\text{thr}} \tag{13}$$

### 6.2 Cota del Error en la Distribución Conjunta

**Teorema 6.1** (Error de truncamiento en la transición conjunta). *Sea $\tilde{P}(s' \mid s, a) = \prod_k \tilde{P}_k(x'_k \mid s, a)$ la distribución truncada. La masa total perdida satisface:*

$$1 - \sum_{s'} \tilde{P}(s' \mid s, a) \leq 1 - \prod_{k=1}^{n} (1 - \delta_k) \leq \sum_{k=1}^{n} \delta_k \leq n \cdot b_{\max} \cdot \epsilon_{\text{thr}} \tag{14}$$

*donde $b_{\max} = \max_k b_k$.*

**Demostración.**

La masa total de la distribución truncada es:

$$\sum_{s'} \tilde{P}(s' \mid s, a) = \prod_{k=1}^{n} \sum_{v \in \mathcal{D}_k} \tilde{P}_k(v \mid s, a) = \prod_{k=1}^{n} (1 - \delta_k)$$

La masa perdida es:

$$1 - \prod_{k=1}^{n}(1 - \delta_k)$$

Usando la desigualdad $1 - \prod_k (1 - \delta_k) \leq \sum_k \delta_k$ (válida para $\delta_k \in [0, 1]$, demostrable por inducción o tomando logaritmos y usando $\ln(1-x) \leq -x$):

$$1 - \prod_k(1-\delta_k) \leq \sum_{k=1}^n \delta_k \leq \sum_{k=1}^n b_k \cdot \epsilon_{\text{thr}} \leq n \cdot b_{\max} \cdot \epsilon_{\text{thr}} \quad \square$$

**Ejemplo numérico.** Para $n = 15$ factores, $b_{\max} = 5$, $\epsilon_{\text{thr}} = 10^{-6}$:

$$\text{Masa perdida} \leq 15 \times 5 \times 10^{-6} = 7.5 \times 10^{-5}$$

### 6.3 Cota del Error en la Función de Valor

**Teorema 6.2** (Sesgo en la función de valor por truncamiento). *Sea $\tilde{V}^*$ el punto fijo del operador de Bellman truncado $\tilde{T}^*$ y $V^*$ el punto fijo del operador exacto $T^*$. Si la masa perdida máxima sobre todos los pares $(s, a)$ es $\delta_{\max}$, entonces:*

$$\|V^* - \tilde{V}^*\|_\infty \leq \frac{\gamma \cdot \delta_{\max} \cdot V_{\max}}{(1-\gamma)^2} \tag{15}$$

*donde $V_{\max} = R_{\max} / (1-\gamma)$ y $R_{\max} = \max_{s,a} |R(s, a)|$.*

**Demostración.**

Para cualquier $V$ y cualquier estado $s$:

$$|(T^* V)(s) - (\tilde{T}^* V)(s)| \leq \gamma \max_a \left|\sum_{s'} P(s' \mid s,a) V(s') - \sum_{s'} \tilde{P}(s' \mid s,a) V(s')\right|$$

$$\leq \gamma \max_a \sum_{s'} |P(s' \mid s,a) - \tilde{P}(s' \mid s,a)| \cdot |V(s')|$$

$$\leq \gamma \cdot \delta_{\max} \cdot \|V\|_\infty$$

Aplicando el Simulation Lemma estándar (véase Strehl et al., 2009): si dos operadores de Bellman difieren en a lo sumo $\alpha$ por paso, entonces sus puntos fijos difieren en a lo sumo $\alpha/(1-\gamma)$. Con $\alpha = \gamma \cdot \delta_{\max} \cdot V_{\max}$ y $\|V^*\|_\infty \leq V_{\max}$:

$$\|V^* - \tilde{V}^*\|_\infty \leq \frac{\gamma \cdot \delta_{\max} \cdot V_{\max}}{1 - \gamma} = \frac{\gamma \cdot \delta_{\max} \cdot R_{\max}}{(1-\gamma)^2} \quad \square$$

**Ejemplo numérico (continuación).** Con $\delta_{\max} = 7.5 \times 10^{-5}$, $R_{\max} = 10$, $\gamma = 0.9$:

$$\|V^* - \tilde{V}^*\|_\infty \leq \frac{0.9 \times 7.5 \times 10^{-5} \times 10}{(0.1)^2} = \frac{6.75 \times 10^{-4}}{0.01} = 0.0675$$

Para la mayoría de aplicaciones prácticas, un sesgo de $\approx 0.07$ unidades en una función de valor con rango $\sim 100$ es despreciable.

### 6.4 Condición Suficiente para Negligibilidad

**Corolario 6.1.** *El truncamiento es negligible (no altera la política óptima) si:*

$$\frac{\gamma \cdot n \cdot b_{\max} \cdot \epsilon_{\text{thr}} \cdot R_{\max}}{(1-\gamma)^2} < \frac{\min_{s} \Delta_{\text{gap}}(s)}{2} \tag{16}$$

*donde $\Delta_{\text{gap}}(s) = Q^*(s, a^*_1(s)) - Q^*(s, a^*_2(s))$ es la brecha de optimalidad entre la mejor y segunda mejor acción en el estado $s$.*

**Intuición.** Si el error inducido por el truncamiento es menor que la mitad de la brecha de optimalidad mínima, las acciones greedy no cambian y la política óptima se preserva exactamente.

---

## 7. Densificación Proposicional y Complejidad de Compilación

### 7.1 Impacto en el Programa Proposicional

**Proposición 7.1** (Crecimiento de variables proposicionales). *Un factor booleano introduce 1 variable proposicional. Un factor multivaluado de base $N$ introduce $N$ variables proposicionales más $O(N)$ cláusulas de restricción (exclusión mutua). El número total de variables proposicionales tras el grounding es:*

$$|\text{vars}| = \sum_{k: b_k = 2} 1 + \sum_{k: b_k > 2} b_k = \sum_{k=1}^{n} b_k' \tag{17}$$

*donde $b_k' = 1$ si $b_k = 2$ y $b_k' = b_k$ si $b_k > 2$.*

**Observación 7.1.** Esto es una consecuencia directa de cómo ProbLog implementa internamente las ADs. Un grupo de $N$ opciones no se representa como una variable categórica de base $N$ a nivel proposicional, sino como $N$ variables booleanas con restricciones de exclusión mutua. Estas restricciones incrementan el treewidth del grafo de dependencias, lo cual puede impactar exponencialmente el tiempo de compilación a d-DNNF.

### 7.2 Cota de Complejidad de Compilación

El tiempo de compilación de una fórmula proposicional a d-DNNF está acotado por $O(|\phi| \cdot 2^{tw(\phi)})$, donde $|\phi|$ es el tamaño de la fórmula y $tw(\phi)$ es su treewidth (Darwiche, 2001). La adición de restricciones de exclusión mutua puede incrementar el treewidth en $O(N)$ por cada grupo multivaluado, haciendo que la compilación sea potencialmente costosa para grupos grandes.

**Recomendación práctica.** Para el paper, sugerimos documentar empíricamente el tiempo de compilación como función de $N$ (tamaño del grupo multivaluado más grande), usando el `MDPDebugger.save_instructions_table` para contar nodos antes y después de la compilación.

---

## 8. Resumen de Resultados y Plan de Validación Empírica

### 8.1 Resultados Teóricos Establecidos

| # | Resultado | Referencia |
|---|-----------|------------|
| T2.1 | Biyección de codificación mixed-radix | Sección 2.2 |
| T3.1 | Validez de la distribución de transición factorizada | Sección 3.2 |
| T3.2 | Corrección del cómputo recursivo del valor esperado | Sección 3.3 |
| P3.1 | Complejidad $O(\prod m_k)$ del valor esperado | Sección 3.4 |
| P4.1 | Masa unitaria garantizada en $t=0$ | Sección 4.1 |
| P4.2 | Condición necesaria/suficiente para masa en $t=1$ | Sección 4.2 |
| T5.1 | $\gamma$-contracción del Bellman generalizado | Sección 5.1 |
| T5.2 | Convergencia y $\varepsilon$-optimalidad | Sección 5.2 |
| T6.1 | Cota del error de truncamiento en transiciones | Sección 6.2 |
| T6.2 | Cota del sesgo en función de valor por truncamiento | Sección 6.3 |
| C6.1 | Condición suficiente para negligibilidad del truncamiento | Sección 6.4 |

### 8.2 Plan de Validación Empírica (Tres Fases)

**Fase 1: Validación de Masa Probabilística.**
Para cada par $(s, a)$ en el espacio completo, calcular $\sum_{v \in \mathcal{D}_k} P_k(v \mid s, a)$ para cada factor multivaluado $k$ y verificar $|\text{suma} - 1| < 10^{-9}$. Usar `structured_transition` con $\epsilon_{\text{thr}} = 0$ (sin truncamiento).

**Fase 2: Validación de la Distribución Conjunta.**
Usar `MDPDebugger.export_transition_model` para generar matrices densas $P(s' \mid s, a)$ y verificar que cada fila suma 1 (con y sin truncamiento). Comparar contra la distribución obtenida por enumeración directa.

**Fase 3: Cuantificación del Sesgo de Truncamiento.**
Ejecutar `ValueIteration.run()` con umbrales $\epsilon_{\text{thr}} \in \{0, 10^{-9}, 10^{-6}, 10^{-3}\}$ y comparar $\|V^*_{\text{exact}} - V^*_{\text{truncado}}\|_\infty$ contra la cota teórica del Teorema 6.2.

### 8.3 Supuestos Esenciales vs. Removibles

| Supuesto | Esencial | Justificación |
|----------|----------|---------------|
| (A1) Finitud y descuento | **Sí** | Sin finitud no hay enumeración; sin descuento no hay contracción |
| (A2) Factorización del espacio | **Sí** | Es la estructura sobre la que se define toda la codificación |
| (A3) Independencia condicional | **Sí** | Sin ella, la factorización (7) es inválida |
| (A4) Masa unitaria por factor | **Sí** | Sin ella, el operador de Bellman puede no ser contracción (P4.3) |
| (A5) Modelos completos | Removible* | Se podría generalizar a modelos parciales con semántica well-founded de tres valores |
| (A6) Exclusión mutua por AD | Conveniente | Se podría imponer con restricciones lógicas alternativas |

*\*Remover (A5) requeriría manejar valores de verdad "desconocidos" en las probabilidades, lo cual es un trabajo futuro significativo.*

---

## 9. Conclusiones

Se ha demostrado formalmente que la extensión de MDP-ProbLog para fluentes multivaluados:

1. **Preserva la estructura de MDP válido** bajo los supuestos (A1)-(A4), con el espacio de estados generalizado a base mixta.

2. **Mantiene la corrección del cómputo de Value Iteration**, ya que el operador de Bellman es una $\gamma$-contracción independientemente de la codificación interna de los estados.

3. **Es una generalización estricta** del caso original: el framework puramente booleano se recupera como caso particular con $b_k = 2$ para todo $k$.

4. **El truncamiento heurístico introduce un error acotado y cuantificable**, con cotas explícitas que permiten al usuario verificar la negligibilidad del error para su dominio específico.

5. **El punto de vulnerabilidad principal** es la conservación de masa en $t=1$ (supuesto A4), que depende de la corrección lógica del programa Prolog del usuario y debe validarse empíricamente.

---

## Referencias

- Bellman, R. (1957). *Dynamic Programming*. Princeton University Press.
- Bueno, T. P., Mauá, D. D., de Barros, L. N., & Cozman, F. G. (2016). Markov Decision Processes Specified by Probabilistic Logic Programming. BRACIS 2016.
- Darwiche, A. (2001). On the tractable counting of theory models and its application to truth maintenance and belief revision. *JAIR*, 17, 275-318.
- De Raedt, L., Kimmig, A., & Toivonen, H. (2007). ProbLog: A probabilistic Prolog and its application in link discovery. *IJCAI 2007*.
- Fierens, D., et al. (2015). Inference and learning in probabilistic logic programs using weighted Boolean formulas. *TPLP*, 15(3), 358-401.
- Knuth, D. E. (1997). *The Art of Computer Programming, Vol. 2*. Addison-Wesley. Sec. 4.1.
- Puterman, M. L. (2014). *Markov Decision Processes: Discrete Stochastic Dynamic Programming*. Wiley.
- Sato, T. (1995). A statistical learning method for logic programs with distribution semantics. *ICLP 1995*.
- Strehl, A. L., Li, L., & Littman, M. L. (2009). Reinforcement learning in finite MDPs: PAC analysis. *JMLR*, 10, 2413-2444.
