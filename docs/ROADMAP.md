# Evaluación Matemática y Reestructuración del Roadmap Definitivo

## Evaluación Crítica Matemática

Su documento acierta contundentemente al demostrar que la codificación de bases mixtas (mixed-radix) constituye una biyección estricta (Teorema 2.1), garantizando que el espacio de estados factorizado no colapse ni genere estados fantasmas. Asimismo, la derivación del Teorema 3.2 sobre el cálculo recursivo del valor esperado es algorítmicamente elegante y su análisis de complejidad $\mathcal{O}(\prod m_k)$ justifica teóricamente el uso del framework en dominios con transiciones dispersas (sparse).

No obstante, el núcleo neurálgico de su fundamentación —y el vector de vulnerabilidad más crítico del sistema— se encuentra en la Proposición 4.2 y el Supuesto (A4). Usted establece formalmente que la conservación de la masa probabilística unitaria en el instante $t=1$ depende exclusivamente de que el usuario diseñe reglas lógicas perfectas.  Matemáticamente, el motor de inferencia WMC de ProbLog tratará cada valor del fluente multivaluado en $t=1$ como una consulta marginal independiente. Si las reglas del usuario padecen de "sobredeterminación" (dos ramas lógicas derivan valores distintos del mismo grupo simultáneamente), la suma marginal excederá 1.0. Como usted demuestra impecablemente en la Proposición 4.3, esto destruye la propiedad de $\gamma$-contracción del operador de Bellman, provocando que el algoritmo de Iteración de Valor diverja matemáticamente hacia el infinito o converja hacia políticas subóptimas y sesgadas. Confiar la estabilidad del algoritmo central a la pericia del usuario sin un mecanismo de mitigación es arquitectónicamente inaceptable para un framework de este calibre.

Por otro lado, su análisis del error de truncamiento (Filtro Disperso) en la Sección 6 es sobresaliente. Acotar el sesgo de la función de valor mediante la desigualdad $\|V^* - \tilde{V}^*\|_\infty \leq \frac{\gamma \cdot \delta_{\max} \cdot R_{\max}}{(1-\gamma)^2}$ (Teorema 6.2) proporciona una garantía teórica (PAC-bound) que legitima el descarte de ramas computacionalmente irrelevantes. Sin embargo, la teoría debe contrastarse con la praxis empírica.

---

## Reestructuración del Plan de Acción (Roadmap Definitivo)

A la luz de este nuevo análisis matemático, nuestro plan empírico debe evolucionar no solo para observar, sino para **mitigar** proactivamente las deficiencias detectadas. Propongo el siguiente *roadmap* definitivo, estructurado en cuatro fases secuenciales:

### Fase 1: Auditoría Estocástica y Mitigación de Conservación de Masa (Supuesto A4)
En lugar de limitarnos a observar si la masa suma 1.0, debemos programar un "Linter Semántico" o un módulo de validación dinámica dentro de la clase `MDP`. Antes de iniciar la Iteración de Valor, el sistema muestreará un subconjunto representativo de pares $(s, a)$ y evaluará $\sum_j P_k(v_j \mid s, a)$. Si detecta una divergencia de la unidad que exceda la tolerancia de máquina, el framework detendrá la ejecución y arrojará una excepción analítica (ej. `FluentMassConservationError`), señalando exactamente qué grupo multivaluado y bajo qué contexto lógico se ha violado el axioma. Esto corrige el defecto de delegar toda la responsabilidad al usuario.

### Fase 2: Cuantificación Empírica del Sesgo de Truncamiento (Teorema 6.2)
Debemos someter a prueba su cota teórica. Seleccionaremos un dominio estocástico altamente entrópico. Evaluaremos el MDP con truncamiento estricto ($\epsilon_{\text{thr}} = 0$) para obtener el $V^*$ verdadero. Posteriormente, ejecutaremos el sistema con el umbral actual ($\epsilon_{\text{thr}} = 10^{-6}$) y mediremos el error máximo absoluto punto a punto.  El objetivo es verificar rigurosamente que el error empírico observado jamás exceda el límite asintótico dictaminado por su fórmula. Esto cimentará la credibilidad académica del filtro heurístico.

### Fase 3: Análisis de Explosión de Treewidth y Densificación Proposicional (Proposición 7.1)
Como usted señala en la ecuación (17), la inyección de restricciones de exclusión mutua incrementa el número de variables proposicionales. Diseñaremos un experimento de estrés: modelaremos un dominio simple incrementando iterativamente la cardinalidad de un fluente multivaluado (N = 2, 3, 5, 10, 20). Utilizaremos el `MDPDebugger` para registrar el número de nodos proposicionales y mediremos el tiempo real de la función `compile()`. Esto generará una curva de escalabilidad que nos indicará el límite práctico del framework antes de que la compilación d-DNNF colapse.

### Fase 4: Adaptación Arquitectónica hacia Planificación Asíncrona (RTDP)
Habiendo validado y asegurado la solidez matemática de las transiciones locales (Fases 1 y 2), y reconociendo los límites de compilación (Fase 3), procederemos a abandonar la enumeración plana del espacio $\prod b_i$. Construiremos el motor asíncrono RTDP discutido previamente, acotando el esfuerzo computacional exclusivamente a las envolturas alcanzables desde un estado inicial $s_0$.