# Reporte Fase A — Compilación de Circuitos MDP-ProbLog

> **Generado automáticamente** por `exp/analisis_fase_A.py`.
> Fuente: `resultados/fase_A.csv`

## 1. Resumen ejecutivo

- **Arquitectura ganadora en compacidad de circuito:** `multivalued` (1,292 nodos en grid05, 2.0× menos que el peor tipo).
- **Arquitectura ganadora en tiempo de compilación:** `multivalued` (305.1 ms en grid05, 109× más rápido que el peor tipo).
- **Tamaño máximo alcanzado** (grid_id, |S|): `boolean` → grid05 (64 estados), `multivalued` → grid07 (256 estados), `multi_factor` → grid05 (64 estados).
- `boolean` y `multi_factor` sufren OOM a partir de grid06 (128 estados); `multivalued` escala hasta grid07 (256 estados).
- En grid05 (64 estados): `multivalued` tiene 1,292 nodos frente a 2,573 (`boolean`) y 2,016 (`multi_factor`).

## 2. Diseño experimental

### Arquitecturas de modelado

| Tipo           | Fluentes                                    | Codificación del estado                             |
| -------------- | ------------------------------------------- | --------------------------------------------------- |
| `boolean`      | N variables binarias independientes         | Producto cartesiano 2ᴺ — cada bit es un indicador   |
| `multivalued`  | 1 fluente `coor(X,Y)` (N posiciones)        | One-hot sobre K posiciones — un único factor base K |
| `multi_factor` | 2 fluentes `x(X)` × `y(Y)` (filas×columnas) | Mixed-radix — dos factores independientes           |

> **Nota:** `multi_factor_grid00` usa 1 fluente (igual que `multivalued`) porque un grid 1×2 no admite factorización útil.

### Instancias y configuración

| ID | `boolean`  | `multivalued`     | `multi_factor` | |S| | Backends   | Runs |
| -- | ---------- | ----------------- | -------------- | --- | ---------- | ---- |
| 00 | 1 fluente  | `coor(X,Y)` 1×2   | 1 fluente 1×2  | 2   | ddnnf, sdd | 3    |
| 01 | 2 fluentes | `coor(X,Y)` 2×2   | `x`×`y` 2×2    | 4   | ddnnf, sdd | 3    |
| 02 | 3 fluentes | `coor(X,Y)` 2×4   | `x`×`y` 2×4    | 8   | ddnnf, sdd | 3    |
| 03 | 4 fluentes | `coor(X,Y)` 4×4   | `x`×`y` 4×4    | 16  | ddnnf, sdd | 3    |
| 04 | 5 fluentes | `coor(X,Y)` 4×8   | `x`×`y` 4×8    | 32  | ddnnf, sdd | 3    |
| 05 | 6 fluentes | `coor(X,Y)` 8×8   | `x`×`y` 8×8    | 64  | ddnnf, sdd | 3    |
| 06 | 7 fluentes | `coor(X,Y)` 8×16  | `x`×`y` 8×16   | 128 | ddnnf, sdd | 3    |
| 07 | 8 fluentes | `coor(X,Y)` 16×16 | `x`×`y` 16×16  | 256 | ddnnf, sdd | 3    |

Las tareas con `status=success` previo se omiten en reinicios (*skip-if-exists*).

## 3. Tabla maestra de resultados (medianas sobre 3 runs)

### Backend: `ddnnf`

| model_type   | grid_id | |S| | gp_atoms | circuit_nodes | t_ground | t_compile | t_prepare |
| ------------ | ------- | --- | -------- | ------------- | -------- | --------- | --------- |
| boolean      | grid00  | 2   | 13       | 27            | 4.1 ms   | 4.5 ms    | 15.5 ms   |
| boolean      | grid01  | 4   | 28       | 79            | 7.2 ms   | 7.2 ms    | 23.7 ms   |
| boolean      | grid02  | 8   | 69       | 201           | 18.9 ms  | 37.0 ms   | 80.6 ms   |
| boolean      | grid03  | 16  | 170      | 485           | 56.3 ms  | 404.9 ms  | 515.6 ms  |
| boolean      | grid04  | 32  | 411      | 1129          | 181.4 ms | 2.000 s   | 2.349 s   |
| boolean      | grid05  | 64  | 972      | 2573          | 452.8 ms | 33.300 s  | 34.198 s  |
| multi_factor | grid00  | 2   | 21       | 52            | 11.0 ms  | 4.9 ms    | 26.2 ms   |
| multi_factor | grid01  | 4   | 50       | 124           | 12.6 ms  | 21.0 ms   | 53.4 ms   |
| multi_factor | grid02  | 8   | 110      | 292           | 55.8 ms  | 79.5 ms   | 154.5 ms  |
| multi_factor | grid03  | 16  | 208      | 536           | 109.3 ms | 184.0 ms  | 310.9 ms  |
| multi_factor | grid04  | 32  | 404      | 1048          | 239.9 ms | 1.598 s   | 1.858 s   |
| multi_factor | grid05  | 64  | 792      | 2016          | 483.5 ms | 21.443 s  | 21.944 s  |
| multivalued  | grid00  | 2   | 21       | 52            | 11.3 ms  | 5.2 ms    | 27.2 ms   |
| multivalued  | grid01  | 4   | 35       | 92            | 21.0 ms  | 8.1 ms    | 42.6 ms   |
| multivalued  | grid02  | 8   | 63       | 172           | 41.1 ms  | 16.8 ms   | 74.6 ms   |
| multivalued  | grid03  | 16  | 119      | 332           | 84.2 ms  | 38.3 ms   | 134.7 ms  |
| multivalued  | grid04  | 32  | 231      | 652           | 181.2 ms | 114.6 ms  | 312.9 ms  |
| multivalued  | grid05  | 64  | 455      | 1292          | 426.5 ms | 305.1 ms  | 762.4 ms  |
| multivalued  | grid06  | 128 | 903      | 2572          | 1.005 s  | 710.9 ms  | 1.771 s   |
| multivalued  | grid07  | 256 | 1799     | 5132          | 2.317 s  | 2.812 s   | 5.288 s   |

### Backend: `sdd`

| model_type   | grid_id | |S| | gp_atoms | circuit_nodes | t_ground | t_compile | t_prepare |
| ------------ | ------- | --- | -------- | ------------- | -------- | --------- | --------- |
| boolean      | grid00  | 2   | 13       | 27            | 2.7 ms   | 3.0 ms    | 10.6 ms   |
| boolean      | grid01  | 4   | 28       | 79            | 7.1 ms   | 7.2 ms    | 24.9 ms   |
| boolean      | grid02  | 8   | 69       | 201           | 19.9 ms  | 37.6 ms   | 80.1 ms   |
| boolean      | grid03  | 16  | 170      | 485           | 57.4 ms  | 426.2 ms  | 540.2 ms  |
| boolean      | grid04  | 32  | 411      | 1129          | 192.1 ms | 2.022 s   | 2.376 s   |
| boolean      | grid05  | 64  | 972      | 2573          | 437.7 ms | 32.143 s  | 32.986 s  |
| multi_factor | grid00  | 2   | 21       | 52            | 10.9 ms  | 4.9 ms    | 27.6 ms   |
| multi_factor | grid01  | 4   | 50       | 124           | 12.4 ms  | 20.5 ms   | 53.3 ms   |
| multi_factor | grid02  | 8   | 110      | 292           | 57.8 ms  | 78.6 ms   | 156.0 ms  |
| multi_factor | grid03  | 16  | 208      | 536           | 107.1 ms | 184.6 ms  | 309.9 ms  |
| multi_factor | grid04  | 32  | 404      | 1048          | 246.0 ms | 1.599 s   | 1.863 s   |
| multi_factor | grid05  | 64  | 792      | 2016          | 494.1 ms | 21.569 s  | 22.082 s  |
| multivalued  | grid00  | 2   | 21       | 52            | 10.9 ms  | 4.9 ms    | 27.3 ms   |
| multivalued  | grid01  | 4   | 35       | 92            | 21.2 ms  | 8.0 ms    | 40.6 ms   |
| multivalued  | grid02  | 8   | 63       | 172           | 43.2 ms  | 16.8 ms   | 71.9 ms   |
| multivalued  | grid03  | 16  | 119      | 332           | 85.2 ms  | 37.7 ms   | 176.8 ms  |
| multivalued  | grid04  | 32  | 231      | 652           | 181.6 ms | 112.6 ms  | 311.8 ms  |
| multivalued  | grid05  | 64  | 455      | 1292          | 424.0 ms | 307.6 ms  | 761.3 ms  |
| multivalued  | grid06  | 128 | 903      | 2572          | 998.4 ms | 715.5 ms  | 1.775 s   |
| multivalued  | grid07  | 256 | 1799     | 5132          | 2.335 s  | 2.680 s   | 5.149 s   |

## 4. Análisis de escalado (exponente α = Δlog(métrica)/Δlog(|S|))

α ≈ 1 → crecimiento lineal · α ≈ 2 → cuadrático · α >> 2 → super-polinomial

### `boolean`

| grid   | |S| | circuit_nodes | α_nodes | t_compile | α_tc | gp_atoms | α_gp |
| ------ | --- | ------------- | ------- | --------- | ---- | -------- | ---- |
| grid00 | 2   | 27            | —       | 4.5 ms    | —    | 13       | —    |
| grid01 | 4   | 79            | 1.55    | 7.2 ms    | 0.67 | 28       | 1.11 |
| grid02 | 8   | 201           | 1.35    | 37.0 ms   | 2.36 | 69       | 1.30 |
| grid03 | 16  | 485           | 1.27    | 404.9 ms  | 3.45 | 170      | 1.30 |
| grid04 | 32  | 1129          | 1.22    | 2.000 s   | 2.30 | 411      | 1.27 |
| grid05 | 64  | 2573          | 1.19    | 33.300 s  | 4.06 | 972      | 1.24 |

### `multivalued`

| grid   | |S| | circuit_nodes | α_nodes | t_compile | α_tc | gp_atoms | α_gp |
| ------ | --- | ------------- | ------- | --------- | ---- | -------- | ---- |
| grid00 | 2   | 52            | —       | 5.2 ms    | —    | 21       | —    |
| grid01 | 4   | 92            | 0.82    | 8.1 ms    | 0.65 | 35       | 0.74 |
| grid02 | 8   | 172           | 0.90    | 16.8 ms   | 1.05 | 63       | 0.85 |
| grid03 | 16  | 332           | 0.95    | 38.3 ms   | 1.19 | 119      | 0.92 |
| grid04 | 32  | 652           | 0.97    | 114.6 ms  | 1.58 | 231      | 0.96 |
| grid05 | 64  | 1292          | 0.99    | 305.1 ms  | 1.41 | 455      | 0.98 |
| grid06 | 128 | 2572          | 0.99    | 710.9 ms  | 1.22 | 903      | 0.99 |
| grid07 | 256 | 5132          | 1.00    | 2.812 s   | 1.98 | 1799     | 0.99 |

### `multi_factor`

| grid   | |S| | circuit_nodes | α_nodes | t_compile | α_tc | gp_atoms | α_gp |
| ------ | --- | ------------- | ------- | --------- | ---- | -------- | ---- |
| grid00 | 2   | 52            | —       | 4.9 ms    | —    | 21       | —    |
| grid01 | 4   | 124           | 1.25    | 21.0 ms   | 2.10 | 50       | 1.25 |
| grid02 | 8   | 292           | 1.24    | 79.5 ms   | 1.92 | 110      | 1.14 |
| grid03 | 16  | 536           | 0.88    | 184.0 ms  | 1.21 | 208      | 0.92 |
| grid04 | 32  | 1048          | 0.97    | 1.598 s   | 3.12 | 404      | 0.96 |
| grid05 | 64  | 2016          | 0.94    | 21.443 s  | 3.75 | 792      | 0.97 |


## 5. Comparación entre arquitecturas (mismo |S|, backend ddnnf)

Speedup positivo significa que `multivalued` es más compacto/rápido.

| grid   | |S| | cn(bool)/cn(mv) | cn(mf)/cn(mv) | tc(bool)/tc(mv) | tc(mf)/tc(mv) |
| ------ | --- | --------------- | ------------- | --------------- | ------------- |
| grid00 | 2   | 0.52×           | 1.00×         | 0.88×           | 0.95×         |
| grid01 | 4   | 0.86×           | 1.35×         | 0.89×           | 2.60×         |
| grid02 | 8   | 1.17×           | 1.70×         | 2.21×           | 4.74×         |
| grid03 | 16  | 1.46×           | 1.61×         | 10.57×          | 4.80×         |
| grid04 | 32  | 1.73×           | 1.61×         | 17.45×          | 13.94×        |
| grid05 | 64  | 1.99×           | 1.56×         | 109.16×         | 70.29×        |
| grid06 | 128 | —               | —             | —               | —             |
| grid07 | 256 | —               | —             | —               | —             |

`bool`=boolean · `mv`=multivalued · `mf`=multi_factor · `cn`=circuit_nodes · `tc`=t_compile

## 6. Comparación de backends (ddnnf vs sdd)

Para cada tipo y grid, se muestra el cociente `circuit_nodes(sdd)/circuit_nodes(ddnnf)` y `t_compile(sdd)/t_compile(ddnnf)`. Un valor ≈ 1 indica que ambos backends producen resultados equivalentes.

| model_type   | grid   | |S| | cn(sdd)/cn(ddnnf) | tc(sdd)/tc(ddnnf) |
| ------------ | ------ | --- | ----------------- | ----------------- |
| boolean      | grid00 | 2   | 1.000             | 0.659             |
| boolean      | grid01 | 4   | 1.000             | 1.000             |
| boolean      | grid02 | 8   | 1.000             | 1.014             |
| boolean      | grid03 | 16  | 1.000             | 1.053             |
| boolean      | grid04 | 32  | 1.000             | 1.011             |
| boolean      | grid05 | 64  | 1.000             | 0.965             |
| multivalued  | grid00 | 2   | 1.000             | 0.957             |
| multivalued  | grid01 | 4   | 1.000             | 0.992             |
| multivalued  | grid02 | 8   | 1.000             | 1.001             |
| multivalued  | grid03 | 16  | 1.000             | 0.984             |
| multivalued  | grid04 | 32  | 1.000             | 0.983             |
| multivalued  | grid05 | 64  | 1.000             | 1.008             |
| multivalued  | grid06 | 128 | 1.000             | 1.006             |
| multivalued  | grid07 | 256 | 1.000             | 0.953             |
| multi_factor | grid00 | 2   | 1.000             | 1.000             |
| multi_factor | grid01 | 4   | 1.000             | 0.977             |
| multi_factor | grid02 | 8   | 1.000             | 0.990             |
| multi_factor | grid03 | 16  | 1.000             | 1.003             |
| multi_factor | grid04 | 32  | 1.000             | 1.000             |
| multi_factor | grid05 | 64  | 1.000             | 1.006             |

> **Observación:** Para este dominio, ambos backends producen circuitos idénticos (`circuit_nodes` = 1.000) con tiempos de compilación prácticamente iguales. Los circuitos d-DNNF y SDD coinciden en estructura para el Mitchell Grid, lo que confirma la hipótesis de equivalencia para dominios con transiciones sparse.

## 7. Límites de memoria (OOM killed)

| model_type   | grid   | |S| | compiler | runs_oom |
| ------------ | ------ | --- | -------- | -------- |
| boolean      | grid06 | 128 | ddnnf    | 3/3      |
| boolean      | grid06 | 128 | sdd      | 3/3      |
| boolean      | grid07 | 256 | ddnnf    | 3/3      |
| boolean      | grid07 | 256 | sdd      | 3/3      |
| multi_factor | grid06 | 128 | ddnnf    | 3/3      |
| multi_factor | grid06 | 128 | sdd      | 3/3      |
| multi_factor | grid07 | 256 | ddnnf    | 3/3      |
| multi_factor | grid07 | 256 | sdd      | 3/3      |

`multivalued` es el único tipo que escala hasta 256 estados (grid07) sin OOM. `boolean` y `multi_factor` fallan en grid06 (128 estados) con ambos backends.

## 8. Conexión con predicciones teóricas

### 8.1 Proposición 7.1 — Crecimiento lineal de gp_atoms

La Proposición 7.1 predice que `gp_atoms ~ O(|S|)` (α_gp ≈ 1.0), porque cada fluente contribuye un número fijo de átomos proposicionales al programa aterrizado.

| model_type   | α_gp (promedio) | predicción teórica |
| ------------ | --------------- | ------------------ |
| boolean      | 1.24            | ≈ 1.0              |
| multivalued  | 0.92            | ≈ 1.0              |
| multi_factor | 1.05            | ≈ 1.0              |

Detalle por grid (ddnnf):

- `boolean`: grid01: 1.11, grid02: 1.30, grid03: 1.30, grid04: 1.27, grid05: 1.24
- `multivalued`: grid01: 0.74, grid02: 0.85, grid03: 0.92, grid04: 0.96, grid05: 0.98, grid06: 0.99, grid07: 0.99
- `multi_factor`: grid01: 1.25, grid02: 1.14, grid03: 0.92, grid04: 0.96, grid05: 0.97

### 8.2 Sección 7.2 — Treewidth y costo de compilación de circuitos

La Sección 7.2 predice que el tiempo de compilación está acotado por O(|φ| · 2^{tw(φ)}), donde tw(φ) es el treewidth del programa proposicional. La diferencia de circuit_nodes entre arquitecturas es evidencia de que cada codificación tiene un treewidth distinto.

| model_type   | |S| | circuit_nodes (grid05) | t_compile (grid05) |
| ------------ | --- | ---------------------- | ------------------ |
| boolean      | 64  | 2573                   | 33.300 s           |
| multivalued  | 64  | 1292                   | 305.1 ms           |
| multi_factor | 64  | 2016                   | 21.443 s           |

**Interpretación:** `multivalued` produce los circuitos más compactos porque su codificación one-hot global genera un programa proposicional con menor treewidth efectivo que `boolean` (que escala con 2^N factores binarios) o `multi_factor` (que introduce restricciones de exclusión mutua entre factores separados). La diferencia en t_compile es dramática: `multivalued` es ~100× más rápido que `boolean` en grid05.

## 9. Experimentos pendientes

### Fase B — Value Iteration con el tipo ganador *(completada)*

La Fase B ha sido completada. Los resultados completos se encuentran en `resultados/reporte_fase_B.md`.

**Hallazgos principales de Fase B:**

- `n_iterations` crece de 2 (grid00) a 16 (grid07) y es **invariante** respecto a γ y ε.
- α_tvi ≈ 2.5–2.9 entre grids consecutivos (crecimiento super-cuadrático).
- En grid07 (256 estados): t_vi ≈ 127 s, t_compile ≈ 2.8 s → VI es el cuello de botella del pipeline completo.
- Ver análisis detallado: `resultados/reporte_fase_B.md`

### Experimento Fase 3 — Barrido de cardinalidad

Para validar directamente Proposición 7.1 y Sección 7.2, se necesita un barrido donde la cardinalidad N del fluente multivaluado varía de forma controlada (manteniendo |S| fijo o variando ambos sistemáticamente):

| Variable | Rango propuesto |
|----------|----------------|
| Cardinalidad N (grupo multivaluado) | 2, 4, 8, 16, 32, 64 |
| |S| (tamaño de estado space) | fijo en 64 o variable |
| Métricas objetivo | `gp_atoms`, `circuit_nodes`, `t_compile` |

Esto permitirá medir directamente α_gp y α_nodes como función de N, comparando contra la predicción O(N) de Prop 7.1 y la cota O(|φ| · 2^{tw}) de Sec 7.2.

### Referencias para el paper (IBERAMIA 2026)

- Los resultados de Fase A proveen la Tabla de Resultados principal.
- El análisis de α_nodes cuantifica el crecimiento empírico del circuito.
- La Sección 8.2 de este reporte conecta directamente con las Proposiciones 7.1 y 7.2 del documento de validación matemática.

