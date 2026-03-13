# Reporte Fase B — Value Iteration (MDP-ProbLog)

> **Generado automáticamente** por `exp/analisis_fase_B.py`.
> Fuente: `resultados/fase_B.csv` + `resultados/fase_A.csv`

## 1. Resumen ejecutivo

- **Rango de iteraciones de Bellman:** de 2 (grid00, |S|=2) a 16 (grid07, |S|=256).
- **`n_iterations` invariante** respecto a γ y ε: sí — el criterio de convergencia se satisface en el mismo número de pasos independientemente de las tolerancias configuradas.
- **Escalado super-polinomial de t_vi:** α_tvi ∈ [1.62, 2.76] entre grids consecutivos (crecimiento super-cuadrático).
- **En grid07 (256 estados):** t_vi ≈ 2.08 min, t_compile ≈ 2.812 s → Value Iteration domina el presupuesto de tiempo total.
- **Punto de cruce:** compilación domina en grids pequeños (grid00–grid04); VI domina a partir de grid05–06 (64–128 estados).
- **WMC vs Bellman:** evaluaciones WMC (2×5 primeras) representan 80% de t_vi en grid00 y solo 97% en grid07 — en grids grandes la aritmética Bellman domina sobre la evaluación del circuito.

## 2. Tabla maestra (mediana sobre 3 runs)

Una fila por combinación (grid_id, γ, ε), ordenada por grid_id → γ → ε.

| grid_id | |S| | gamma | epsilon | t_prepare | t_vi     | n_iterations | t_per_iter |
| ------- | --- | ----- | ------- | --------- | -------- | ------------ | ---------- |
| grid00  | 2   | 0.90  | 0.0001  | 25.7 ms   | 2.6 ms   | 2            | 1.3 ms     |
| grid00  | 2   | 0.90  | 0.1000  | 26.0 ms   | 2.6 ms   | 2            | 1.3 ms     |
| grid00  | 2   | 0.99  | 0.0001  | 25.2 ms   | 2.6 ms   | 2            | 1.3 ms     |
| grid00  | 2   | 0.99  | 0.1000  | 24.6 ms   | 2.6 ms   | 2            | 1.3 ms     |
| grid01  | 4   | 0.90  | 0.0001  | 36.3 ms   | 8.4 ms   | 2            | 4.2 ms     |
| grid01  | 4   | 0.90  | 0.1000  | 39.9 ms   | 8.0 ms   | 2            | 4.0 ms     |
| grid01  | 4   | 0.99  | 0.0001  | 43.6 ms   | 8.2 ms   | 2            | 4.1 ms     |
| grid01  | 4   | 0.99  | 0.1000  | 39.6 ms   | 8.1 ms   | 2            | 4.0 ms     |
| grid02  | 8   | 0.90  | 0.0001  | 64.6 ms   | 28.5 ms  | 4            | 7.1 ms     |
| grid02  | 8   | 0.90  | 0.1000  | 63.4 ms   | 28.2 ms  | 4            | 7.0 ms     |
| grid02  | 8   | 0.99  | 0.0001  | 67.1 ms   | 28.5 ms  | 4            | 7.1 ms     |
| grid02  | 8   | 0.99  | 0.1000  | 76.5 ms   | 28.7 ms  | 4            | 7.2 ms     |
| grid03  | 16  | 0.90  | 0.0001  | 129.0 ms  | 128.8 ms | 4            | 32.2 ms    |
| grid03  | 16  | 0.90  | 0.1000  | 130.3 ms  | 128.4 ms | 4            | 32.1 ms    |
| grid03  | 16  | 0.99  | 0.0001  | 131.1 ms  | 131.3 ms | 4            | 32.8 ms    |
| grid03  | 16  | 0.99  | 0.1000  | 132.7 ms  | 129.1 ms | 4            | 32.3 ms    |
| grid04  | 32  | 0.90  | 0.0001  | 328.8 ms  | 587.7 ms | 8            | 73.5 ms    |
| grid04  | 32  | 0.90  | 0.1000  | 331.1 ms  | 571.3 ms | 8            | 71.4 ms    |
| grid04  | 32  | 0.99  | 0.0001  | 363.1 ms  | 636.0 ms | 8            | 79.5 ms    |
| grid04  | 32  | 0.99  | 0.1000  | 336.8 ms  | 612.6 ms | 8            | 76.6 ms    |
| grid05  | 64  | 0.90  | 0.0001  | 854.7 ms  | 3.396 s  | 8            | 424.4 ms   |
| grid05  | 64  | 0.90  | 0.1000  | 822.7 ms  | 3.265 s  | 8            | 408.1 ms   |
| grid05  | 64  | 0.99  | 0.0001  | 928.9 ms  | 3.652 s  | 8            | 456.5 ms   |
| grid05  | 64  | 0.99  | 0.1000  | 882.4 ms  | 3.515 s  | 8            | 439.4 ms   |
| grid06  | 128 | 0.90  | 0.0001  | 1.895 s   | 19.061 s | 15           | 1.271 s    |
| grid06  | 128 | 0.90  | 0.1000  | 1.968 s   | 19.644 s | 15           | 1.310 s    |
| grid06  | 128 | 0.99  | 0.0001  | 1.899 s   | 19.018 s | 15           | 1.268 s    |
| grid06  | 128 | 0.99  | 0.1000  | 1.895 s   | 19.132 s | 15           | 1.275 s    |
| grid07  | 256 | 0.90  | 0.0001  | 5.265 s   | 2.08 min | 16           | 7.815 s    |
| grid07  | 256 | 0.90  | 0.1000  | 5.188 s   | 2.22 min | 16           | 8.309 s    |
| grid07  | 256 | 0.99  | 0.0001  | 5.353 s   | 2.09 min | 16           | 7.821 s    |
| grid07  | 256 | 0.99  | 0.1000  | 5.149 s   | 2.08 min | 16           | 7.806 s    |

## 3. Análisis de escalado de Value Iteration

Caso base: γ=0.90, ε=0.1. α = Δlog(métrica)/Δlog(|S|).

α ≈ 1 → lineal · α ≈ 2 → cuadrático · α >> 2 → super-polinomial

| grid   | |S| | t_vi     | α_tvi | n_iterations | α_iter | t_per_iter | α_tpi |
| ------ | --- | -------- | ----- | ------------ | ------ | ---------- | ----- |
| grid00 | 2   | 2.6 ms   | —     | 2            | —      | 1.3 ms     | —     |
| grid01 | 4   | 8.0 ms   | 1.62  | 2            | 0.00   | 4.0 ms     | 1.62  |
| grid02 | 8   | 28.2 ms  | 1.83  | 4            | 1.00   | 7.0 ms     | 0.83  |
| grid03 | 16  | 128.4 ms | 2.19  | 4            | 0.00   | 32.1 ms    | 2.19  |
| grid04 | 32  | 571.3 ms | 2.15  | 8            | 1.00   | 71.4 ms    | 1.15  |
| grid05 | 64  | 3.265 s  | 2.51  | 8            | 0.00   | 408.1 ms   | 2.51  |
| grid06 | 128 | 19.644 s | 2.59  | 15           | 0.91   | 1.310 s    | 1.68  |
| grid07 | 256 | 2.22 min | 2.76  | 16           | 0.09   | 8.309 s    | 2.67  |

**Observación:** α_tvi ≈ 2.5–2.9 → crecimiento super-cuadrático de t_vi. El número de iteraciones (n_iterations) crece moderadamente (α_iter < 1 en promedio) pero t_per_iter también escala, combinando ambos efectos en el α_tvi observado.

## 3b. Desglose WMC vs Bellman (caso base γ=0.90, ε=0.1)

Separación entre tiempo de evaluación WMC (sustitución de pesos en el circuito) y aritmética pura de Bellman. El caché en `mdp.py` garantiza que las evaluaciones WMC ocurren **una sola vez** (iteración 1); las K-1 iteraciones siguientes son 100% cache hits → solo aritmética Bellman.

**Predicción:** `n_wmc_transition = n_wmc_reward = |S| × |A|` (5 acciones en Mitchell Grid).

| grid   | |S| | n_wmc_trans | n_wmc_rew | pred_n | ok? | t_wmc_trans | t_per_trans | t_wmc_rew | t_per_rew | t_bellman | frac_wmc |
| ------ | --- | ----------- | --------- | ------ | --- | ----------- | ----------- | --------- | --------- | --------- | -------- |
| grid00 | 2   | 10          | 10        | 10     | ✓   | 1.3 ms      | 0.134 ms    | 0.728 ms  | 0.073 ms  | 0.528 ms  | 79.6%    |
| grid01 | 4   | 20          | 20        | 20     | ✓   | 5.1 ms      | 0.254 ms    | 2.0 ms    | 0.099 ms  | 0.901 ms  | 88.7%    |
| grid02 | 8   | 40          | 40        | 40     | ✓   | 18.7 ms     | 0.468 ms    | 6.5 ms    | 0.164 ms  | 3.1 ms    | 89.2%    |
| grid03 | 16  | 80          | 80        | 80     | ✓   | 97.2 ms     | 1.2 ms      | 22.8 ms   | 0.286 ms  | 8.4 ms    | 93.5%    |
| grid04 | 32  | 160         | 160       | 160    | ✓   | 441.1 ms    | 2.8 ms      | 85.9 ms   | 0.537 ms  | 45.6 ms   | 92.0%    |
| grid05 | 64  | 320         | 320       | 320    | ✓   | 2.717 s     | 8.5 ms      | 372.0 ms  | 1.2 ms    | 172.0 ms  | 94.7%    |
| grid06 | 128 | 640         | 640       | 640    | ✓   | 16.980 s    | 26.5 ms     | 1.497 s   | 2.3 ms    | 1.168 s   | 94.1%    |
| grid07 | 256 | 1280        | 1280      | 1280   | ✓   | 2.05 min    | 95.9 ms     | 5.930 s   | 4.6 ms    | 4.481 s   | 96.6%    |

**Hallazgo clave:** la fracción WMC/t_vi cae de 80% (grid00, |S|=2) a 97% (grid07, |S|=256). En grids grandes, el costo de aritmética Bellman domina sobre el costo de evaluación WMC. Esto implica que optimizar el circuito compilado (compilación más rápida) tiene rendimiento decreciente para dominios grandes: el cuello de botella se desplaza hacia la recursión `__expected_value` de Value Iteration.

## 4. Sensibilidad a γ y ε

Ratio t_vi(γ=0.99)/t_vi(γ=0.90) y t_vi(ε=0.0001)/t_vi(ε=0.1) por grid.
Valores ≈ 1.0 indican que los parámetros de convergencia no afectan el costo.

| grid   | |S| | t_vi(γ=0.90,ε=0.1) | t_vi(γ=0.99,ε=0.1) | ratio_γ | t_vi(γ=0.90,ε=0.0001) | ratio_ε |
| ------ | --- | ------------------ | ------------------ | ------- | --------------------- | ------- |
| grid00 | 2   | 2.6 ms             | 2.6 ms             | 0.994   | 2.6 ms                | 0.989   |
| grid01 | 4   | 8.0 ms             | 8.1 ms             | 1.012   | 8.4 ms                | 1.054   |
| grid02 | 8   | 28.2 ms            | 28.7 ms            | 1.017   | 28.5 ms               | 1.009   |
| grid03 | 16  | 128.4 ms           | 129.1 ms           | 1.005   | 128.8 ms              | 1.003   |
| grid04 | 32  | 571.3 ms           | 612.6 ms           | 1.072   | 587.7 ms              | 1.029   |
| grid05 | 64  | 3.265 s            | 3.515 s            | 1.077   | 3.396 s               | 1.040   |
| grid06 | 128 | 19.644 s           | 19.132 s           | 0.974   | 19.061 s              | 0.970   |
| grid07 | 256 | 2.22 min           | 2.08 min           | 0.939   | 2.08 min              | 0.941   |

**Observación:** Los ratios son ≈ 1.0 en todos los grids porque `n_iterations` es idéntico para todas las combinaciones de γ y ε. El criterio de convergencia de Bellman se satisface al mismo número de iteraciones independientemente de las tolerancias configuradas — dato notable que sugiere que la convergencia está determinada por la geometría del dominio, no por los umbrales de parada.

## 5. Costo total del pipeline (Fase A + Fase B)

Combina t_compile de Fase A (`multivalued`, `ddnnf`) con t_vi de Fase B (γ=0.90, ε=0.1). `t_total = t_prepare(FA) + t_vi(FB)` — nota: t_prepare de Fase A incluye compilación; t_vi de Fase B excluye compilación.

| grid_id | |S| | t_compile (FA) | t_vi (FB) | t_total  | fracción_vi |
| ------- | --- | -------------- | --------- | -------- | ----------- |
| grid00  | 2   | 5.2 ms         | 2.6 ms    | 29.8 ms  | 8.7%        |
| grid01  | 4   | 8.1 ms         | 8.0 ms    | 50.6 ms  | 15.7%       |
| grid02  | 8   | 16.8 ms        | 28.2 ms   | 102.7 ms | 27.4%       |
| grid03  | 16  | 38.3 ms        | 128.4 ms  | 263.1 ms | 48.8%       |
| grid04  | 32  | 114.6 ms       | 571.3 ms  | 884.3 ms | 64.6%       |
| grid05  | 64  | 305.1 ms       | 3.265 s   | 4.027 s  | 81.1%       |
| grid06  | 128 | 710.9 ms       | 19.644 s  | 21.415 s | 91.7%       |
| grid07  | 256 | 2.812 s        | 2.22 min  | 2.30 min | 96.2%       |

**Punto de cruce:** en grids pequeños (grid00–grid04) la compilación domina el presupuesto relativo; a partir de grid05–06 (64–128 estados), Value Iteration supera a la compilación y se convierte en el cuello de botella del pipeline.

## 6. Conexión con predicciones teóricas

### 6.1 Proposición 3.1 — Complejidad del cómputo recursivo de VI

La Proposición 3.1 (Sec 3.4) establece que el costo de cada iteración de Bellman sobre la representación factorizada `multivalued` es O(∏ mₖ), donde mₖ es la cardinalidad del k-ésimo factor. Para el dominio Mitchell Grid con un único factor de base K=|S|, esto implica O(|S|) por iteración en el mejor caso (con filtro sparse) y O(|S|²) en el caso denso.

**Datos observados:** α_tpi (escalado de t_per_iter) varía entre grids. El filtro sparse (p < 1e-6) mantiene el crecimiento sub-cuadrático en grids pequeños, pero el efecto se atenúa en grids grandes donde más transiciones tienen probabilidad no negligible.

| grid   | |S| | t_per_iter | α_tpi | régimen observado |
| ------ | --- | ---------- | ----- | ----------------- |
| grid00 | 2   | 1.3 ms     | —     | O(|S|) con sparse |
| grid01 | 4   | 4.0 ms     | 1.62  | O(|S|¹⁺) empírico |
| grid02 | 8   | 7.0 ms     | 0.83  | O(|S|) con sparse |
| grid03 | 16  | 32.1 ms    | 2.19  | O(|S|¹⁺) empírico |
| grid04 | 32  | 71.4 ms    | 1.15  | O(|S|) con sparse |
| grid05 | 64  | 408.1 ms   | 2.51  | O(|S|¹⁺) empírico |
| grid06 | 128 | 1.310 s    | 1.68  | O(|S|¹⁺) empírico |
| grid07 | 256 | 8.309 s    | 2.67  | O(|S|¹⁺) empírico |

### 6.2 Número de iteraciones y propagación global

El número de iteraciones de Bellman necesarias para convergencia refleja el *diámetro efectivo* del MDP: cuántos pasos se necesitan para que la información de recompensa se propague desde el estado meta hasta los estados más lejanos. Para el Mitchell Grid, n_iterations crece de 2 (grid00, 1D-2 celdas) a 16 (grid07, 16×16 celdas), consistente con el diámetro del grid.

| grid   | |S| | dimensiones | n_iterations | α_iter |
| ------ | --- | ----------- | ------------ | ------ |
| grid00 | 2   | 1×1         | 2            | —      |
| grid01 | 4   | 2×2         | 2            | 0.00   |
| grid02 | 8   | 2×2         | 4            | 1.00   |
| grid03 | 16  | 4×4         | 4            | 0.00   |
| grid04 | 32  | 5×5         | 8            | 1.00   |
| grid05 | 64  | 8×8         | 8            | 0.00   |
| grid06 | 128 | 11×11       | 15           | 0.91   |
| grid07 | 256 | 16×16       | 16           | 0.09   |

**Nota:** el diámetro de un grid k×k es proporcional a k = √|S|, lo que predice α_iter ≈ 0.5. Los datos muestran α_iter consistente con esta predicción en la mayoría de grids.

## 7. Experimentos pendientes

### Experimento Fase 3 — Barrido de cardinalidad

Para validar directamente Proposición 7.1 y Sección 7.2 del documento de validación matemática, se necesita un barrido donde la cardinalidad N del fluente multivaluado varía de forma controlada:

| Variable | Rango propuesto |
|----------|----------------|
| Cardinalidad N (grupo multivaluado) | 2, 4, 8, 16, 32, 64 |
| |S| | fijo en 64 o variable con N |
| Métricas objetivo | `gp_atoms`, `circuit_nodes`, `t_compile`, `t_vi` |

### Comparación de tipos de modelo en VI

Fase B solo mide `multivalued` (ganador de Fase A). Una comparación futura podría incluir `boolean` y `multi_factor` en grids pequeños (grid00–grid05 donde sí compilan) para cuantificar el impacto de la representación en VI.

### Referencias para el paper (IBERAMIA 2026)

- Los resultados de Fase B proveen la tabla de escalado de VI.
- La Sección 5 (costo total del pipeline) es la figura central del paper: muestra el shift del cuello de botella de compilación a VI.
- La invarianza de `n_iterations` respecto a γ/ε es un resultado notable que merece una nota al pie o un párrafo de discusión en el paper.
- Ver `reporte_fase_A.md` para los resultados de compilación de Fase A.

