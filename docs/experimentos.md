# Marco Experimental MDP-ProbLog

## ¿Qué hace este sistema?

**MDP-ProbLog** resuelve Procesos de Decisión de Markov (MDPs) especificados en sintaxis Prolog/ProbLog. El motor convierte la especificación declarativa en un circuito lógico compilado (d-DNNF o SDD) y sobre ese circuito ejecuta Value Iteration para encontrar la política óptima `π*`.

Los experimentos comparan tres formas de codificar el mismo dominio de navegación en un grid (Mitchell Grid) para responder dos preguntas:

1. **¿Qué arquitectura de modelado produce circuitos más compactos?** (Fase A)
2. **¿Cómo afecta eso al costo de Value Iteration?** (Fase B)

---

## Los modelos de prueba — Mitchell Grid

### Tres arquitecturas, mismo dominio

Todos los modelos representan un agente navegando en un grid 2D con 5 acciones: `left`, `right`, `up`, `down`, `stay`. Lo que varía es *cómo* se codifica la posición del agente como fluentes lógicos.

| Tipo | Fluentes | Codificación del estado |
|------|----------|------------------------|
| `boolean` | N variables binarias independientes | Producto cartesiano 2^N — cada bit es un indicador |
| `multivalued` | 1 fluente multivaluado `coor(X,Y)` | One-hot sobre K posiciones — un único factor base K |
| `multi_factor` | 2 fluentes multivaluados `x(X)` y `y(Y)` | Mixed-radix filas × columnas — dos factores independientes |

> **Nota:** `multi_factor_grid00` usa 1 fluente (igual que `multivalued`) porque un grid 1×2 no admite factorización útil. A partir de `grid01`, usa los 2 fluentes separados.

### Progresión de tamaño — 8 instancias por tipo

| ID | `boolean` | `multivalued` | `multi_factor` | S | A |
|----|-----------|---------------|----------------|-------|-------|
| 00 | 1 fluente | `coor(X,Y)` 1×2 | 1 fluente 1×2 | 2 | 5 |
| 01 | 2 fluentes | `coor(X,Y)` 2×2 | `x(X)`×`y(Y)` 2×2 | 4 | 5 |
| 02 | 3 fluentes | `coor(X,Y)` 2×4 | `x(X)`×`y(Y)` 2×4 | 8 | 5 |
| 03 | 4 fluentes | `coor(X,Y)` 4×4 | `x(X)`×`y(Y)` 4×4 | 16 | 5 |
| 04 | 5 fluentes | `coor(X,Y)` 4×8 | `x(X)`×`y(Y)` 4×8 | 32 | 5 |
| 05 | 6 fluentes | `coor(X,Y)` 8×8 | `x(X)`×`y(Y)` 8×8 | 64 | 5 |
| 06 | 7 fluentes | `coor(X,Y)` 8×16 | `x(X)`×`y(Y)` 8×16 | 128 | 5 |
| 07 | 8 fluentes | `coor(X,Y)` 16×16 | `x(X)`×`y(Y)` 16×16 | 256 | 5 |

Los archivos `.pl` están en:
```
tests/model_tests/mitchell_grid/
├── boolean/        boolean_grid00.pl … boolean_grid07.pl
├── multivalued/    multivalued_grid00.pl … multivalued_grid07.pl
└── multi-factor/   multi_factor_grid00.pl … multi_factor_grid07.pl
```

---

## Flujo experimental

```
Smoke test  ──▶  Fase A  ──▶  Fase B
(grid00+01)      (compilación)  (Value Iteration)
```

### Smoke test

Corre solo `grid00` y `grid01` de los tres tipos con ambos backends. Sirve para verificar que el entorno funciona antes de lanzar la batería completa. Genera `resultados/fase_smoke.csv`.

### Fase A — Compilación de circuitos

Para cada combinación `(tipo, grid, backend, run)` mide el costo de preparar el MDP:

| Métrica | Descripción |
|---------|-------------|
| `t_ground` | Tiempo de grounding (aterrizaje proposicional del programa Prolog) |
| `t_compile` | Tiempo de compilación del circuito lógico (d-DNNF o SDD) |
| `t_prepare` | Tiempo total de `MDP.__prepare__()` |
| `gp_atoms` | Átomos en el programa aterrizado |
| `circuit_nodes` | Nodos en el circuito compilado |
| `circuit_edges` | Aristas en el circuito compilado |
| `n_states` / `n_actions` | Tamaño del espacio de estados y acciones |

Genera `resultados/fase_A.csv` (máximo 144 filas: 8 grids × 3 tipos × 2 backends × 3 runs).

### Fase B — Value Iteration

Toma el tipo de modelo con mejor desempeño en Fase A y mide el costo de resolver el MDP completo:

| Métrica | Descripción |
|---------|-------------|
| `t_vi` | Tiempo total de Value Iteration |
| `n_iterations` | Iteraciones hasta convergencia |
| `t_per_iter` | Tiempo promedio por iteración de Bellman |
| `gamma` | Factor de descuento usado |
| `epsilon` | Tolerancia de convergencia usada |

Genera `resultados/fase_B.csv`.

---

## Cómo ejecutar

### Requisitos previos

```bash
source .venv/bin/activate
```

Todos los comandos se corren desde la **raíz del repositorio**.

### Smoke test — verificar que funciona

```bash
python exp/orquestador.py --phase smoke
```

Revisa que `resultados/fase_smoke.csv` existe y tiene filas con `status=success`.

### Fase A — batería completa

```bash
python exp/orquestador.py --phase A
```

Con timeout personalizado (default: 3600 s por tarea):

```bash
python exp/orquestador.py --phase A --timeout 600
```

### Fase A — selección a la carta

```bash
# Solo booleanos
python exp/orquestador.py --phase A --model_types boolean

# Solo multivalued y multi_factor, solo d-DNNF
python exp/orquestador.py --phase A --model_types multivalued multi_factor --compilers ddnnf

# Solo grids pequeños (grid00 a grid03)
python exp/orquestador.py --phase A --grid_ids 0 1 2 3
```

### Fase B — con el modelo ganador

```bash
# Reemplazar multi_factor con el tipo que resultó más eficiente en Fase A
python exp/orquestador.py --phase B --winner multi_factor

# Con selección de backend
python exp/orquestador.py --phase B --winner multi_factor --compilers ddnnf
```

### Opciones disponibles

| Argumento | Valores | Default | Descripción |
|-----------|---------|---------|-------------|
| `--phase` | `smoke` `A` `B` | `smoke` | Fase a ejecutar |
| `--model_types` | `boolean` `multivalued` `multi_factor` | todos | Tipos de modelo |
| `--compilers` | `ddnnf` `sdd` | ambos | Backends de compilación |
| `--grid_ids` | `0`–`7` | todos | IDs de instancias |
| `--timeout` | entero (segundos) | `3600` | Límite por tarea |
| `--winner` | nombre de tipo | — | Requerido para `--phase B` |

---

## Salidas

| Archivo | Cuándo se genera | Contenido |
|---------|-----------------|-----------|
| `resultados/fase_smoke.csv` | Smoke test | Métricas de 6 tareas de verificación |
| `resultados/fase_A.csv` | Fase A | Métricas de compilación, hasta 144 filas |
| `resultados/fase_B.csv` | Fase B | Métricas de VI con variaciones de γ y ε |
| `src/debug/` | Cada `python main.py` | Matrices de transición, recompensas, tabla Q*, convergencia |

Las columnas de `fase_A.csv` son:

```
phase, model_type, grid_id, compiler, run_id,
n_states, n_actions, t_prepare, t_ground, t_compile,
gp_atoms, gp_nodes, circuit_nodes, circuit_edges,
status, error_msg
```

`fase_B.csv` añade: `gamma, epsilon, t_vi, n_iterations, t_per_iter`.

El campo `status` puede ser `success`, `timeout` o `error`. Las tareas con `status != success` no se saltean en reinicios — solo las `success`.

---

## Reanudación tras interrupción

El orquestador implementa **skip-if-exists**: al iniciar, lee el CSV existente y omite todas las tareas cuya clave `(model_type, grid_id, compiler, run_id)` ya aparezca con `status=success`. Basta con relanzar el mismo comando para continuar donde se quedó:

```bash
# Se interrumpió. Retomar exactamente desde donde quedó:
python exp/orquestador.py --phase A
```

No se re-ejecutan tareas ya completadas; solo se corren las pendientes o fallidas.
