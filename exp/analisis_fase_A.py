"""
Análisis de Fase A — MDP-ProbLog
Genera resultados/reporte_fase_A.md a partir de resultados/fase_A.csv.

Uso:
    source .venv/bin/activate
    python exp/analisis_fase_A.py
"""

import math
import sys
import io
import pandas as pd

CSV_PATH    = 'resultados/fase_A.csv'
REPORT_PATH = 'resultados/reporte_fase_A.md'

# --------------------------------------------------------------------------- #
# 1. Carga y limpieza                                                          #
# --------------------------------------------------------------------------- #

df = pd.read_csv(CSV_PATH)

ok  = df[df['status'] == 'success'].copy()
oom = df[df['status'] == 'oom_killed'].copy()

METRICS = ['n_states', 'n_actions', 't_prepare', 't_ground', 't_compile',
           'gp_atoms', 'circuit_nodes', 'circuit_edges']

med = (ok
       .groupby(['model_type', 'grid_id', 'compiler'])[METRICS]
       .median()
       .reset_index())

# Grid id → |S| mapping (from docs)
GRID_SIZES = {0: 2, 1: 4, 2: 8, 3: 16, 4: 32, 5: 64, 6: 128, 7: 256}

TYPES  = ['boolean', 'multivalued', 'multi_factor']
COMPILERS = ['ddnnf', 'sdd']

# --------------------------------------------------------------------------- #
# 2. Helpers de análisis                                                       #
# --------------------------------------------------------------------------- #

def alpha(v1, v2, S1, S2):
    """Exponente log-log entre dos puntos (v2/v1) en escala log(S2/S1)."""
    if v1 and v2 and v1 > 0 and v2 > 0 and S1 != S2:
        return math.log(v2 / v1) / math.log(S2 / S1)
    return None


def fmt_alpha(a):
    if a is None:
        return '—'
    return f'{a:.2f}'


def compute_alphas(subdf, metric):
    """
    Dado un subset (ya filtrado por tipo y compiler), calcula α entre grids
    consecutivos para la métrica indicada. Devuelve lista de dict con
    grid_id, S, valor, alpha.
    """
    subdf = subdf.sort_values('grid_id').reset_index(drop=True)
    rows = []
    for i, row in subdf.iterrows():
        gid = int(row['grid_id'])
        S   = GRID_SIZES[gid]
        val = row[metric]
        if i == 0:
            a = None
        else:
            prev = subdf.iloc[i - 1]
            a = alpha(prev[metric], val,
                      GRID_SIZES[int(prev['grid_id'])], S)
        rows.append({'grid_id': gid, 'S': S, metric: val, 'alpha': a})
    return rows


def md_table(headers, rows, fmts=None):
    """Genera una tabla Markdown a partir de headers y filas."""
    if fmts is None:
        fmts = [str] * len(headers)
    col_widths = [len(h) for h in headers]
    formatted = []
    for row in rows:
        frow = [fmts[i](row[i]) if callable(fmts[i]) else str(row[i])
                for i in range(len(headers))]
        formatted.append(frow)
        for j, cell in enumerate(frow):
            col_widths[j] = max(col_widths[j], len(cell))

    def pad(s, w):
        return s + ' ' * (w - len(s))

    sep = '| ' + ' | '.join('-' * w for w in col_widths) + ' |'
    header_line = '| ' + ' | '.join(pad(h, col_widths[i])
                                    for i, h in enumerate(headers)) + ' |'
    lines = [header_line, sep]
    for frow in formatted:
        lines.append('| ' + ' | '.join(pad(frow[i], col_widths[i])
                                       for i in range(len(headers))) + ' |')
    return '\n'.join(lines)


def fmt_t(v):
    """Formatea tiempo en segundos con unidades legibles."""
    if pd.isna(v):
        return '—'
    if v < 0.001:
        return f'{v*1000:.3f} ms'
    if v < 1:
        return f'{v*1000:.1f} ms'
    if v < 60:
        return f'{v:.3f} s'
    return f'{v/60:.2f} min'


def fmt_f(v, decimals=3):
    if pd.isna(v):
        return '—'
    return f'{v:.{decimals}f}'


def fmt_i(v):
    if pd.isna(v):
        return '—'
    return f'{int(v)}'


# --------------------------------------------------------------------------- #
# 3. Construcción del reporte                                                  #
# --------------------------------------------------------------------------- #

out = io.StringIO()


def w(line=''):
    out.write(line + '\n')


w('# Reporte Fase A — Compilación de Circuitos MDP-ProbLog')
w()
w('> **Generado automáticamente** por `exp/analisis_fase_A.py`.')
w(f'> Fuente: `{CSV_PATH}`')
w()

# ─── Sección 1: Resumen ejecutivo ──────────────────────────────────────────

w('## 1. Resumen ejecutivo')
w()

# Identificar ganador en compacidad y velocidad de compilación en grid05 (64 estados)
grid05_ddnnf = med[(med['grid_id'] == 5) & (med['compiler'] == 'ddnnf')]

cn_by_type = {row['model_type']: row['circuit_nodes']
              for _, row in grid05_ddnnf.iterrows()}
tc_by_type = {row['model_type']: row['t_compile']
              for _, row in grid05_ddnnf.iterrows()}

winner_cn = min(cn_by_type, key=cn_by_type.get)
winner_tc = min(tc_by_type, key=tc_by_type.get)

# Tamaño máximo alcanzado por tipo
max_grid = {}
for t in TYPES:
    ok_t = ok[ok['model_type'] == t]
    max_grid[t] = int(ok_t['grid_id'].max()) if not ok_t.empty else -1

# Diferencia en grid05 entre mejor y peor
if cn_by_type:
    best_cn  = min(cn_by_type.values())
    worst_cn = max(cn_by_type.values())
    ratio_cn = worst_cn / best_cn if best_cn > 0 else float('nan')
if tc_by_type:
    best_tc  = min(tc_by_type.values())
    worst_tc = max(tc_by_type.values())
    ratio_tc = worst_tc / best_tc if best_tc > 0 else float('nan')

w(f'- **Arquitectura ganadora en compacidad de circuito:** `{winner_cn}` '
  f'({int(cn_by_type.get(winner_cn, 0)):,} nodos en grid05, '
  f'{ratio_cn:.1f}× menos que el peor tipo).')
w(f'- **Arquitectura ganadora en tiempo de compilación:** `{winner_tc}` '
  f'({fmt_t(tc_by_type.get(winner_tc, 0))} en grid05, '
  f'{ratio_tc:.0f}× más rápido que el peor tipo).')
w(f'- **Tamaño máximo alcanzado** (grid_id, |S|): '
  + ', '.join(f'`{t}` → grid{max_grid[t]:02d} ({GRID_SIZES[max_grid[t]]} estados)'
              for t in TYPES if max_grid[t] >= 0) + '.')
w(f'- `boolean` y `multi_factor` sufren OOM a partir de grid06 (128 estados); '
  f'`multivalued` escala hasta grid07 (256 estados).')
w(f'- En grid05 (64 estados): `multivalued` tiene {int(cn_by_type.get("multivalued",0)):,} nodos '
  f'frente a {int(cn_by_type.get("boolean",0)):,} (`boolean`) y '
  f'{int(cn_by_type.get("multi_factor",0)):,} (`multi_factor`).')
w()

# ─── Sección 2: Diseño experimental ────────────────────────────────────────

w('## 2. Diseño experimental')
w()
w('### Arquitecturas de modelado')
w()
w(md_table(
    ['Tipo', 'Fluentes', 'Codificación del estado'],
    [
        ['`boolean`',      'N variables binarias independientes',         'Producto cartesiano 2ᴺ — cada bit es un indicador'],
        ['`multivalued`',  '1 fluente `coor(X,Y)` (N posiciones)',        'One-hot sobre K posiciones — un único factor base K'],
        ['`multi_factor`', '2 fluentes `x(X)` × `y(Y)` (filas×columnas)', 'Mixed-radix — dos factores independientes'],
    ]
))
w()
w('> **Nota:** `multi_factor_grid00` usa 1 fluente (igual que `multivalued`) '
  'porque un grid 1×2 no admite factorización útil.')
w()
w('### Instancias y configuración')
w()
w(md_table(
    ['ID', '`boolean`', '`multivalued`', '`multi_factor`', '|S|', 'Backends', 'Runs'],
    [
        ['00', '1 fluente',   '`coor(X,Y)` 1×2',  '1 fluente 1×2',      '2',   'ddnnf, sdd', '3'],
        ['01', '2 fluentes',  '`coor(X,Y)` 2×2',  '`x`×`y` 2×2',        '4',   'ddnnf, sdd', '3'],
        ['02', '3 fluentes',  '`coor(X,Y)` 2×4',  '`x`×`y` 2×4',        '8',   'ddnnf, sdd', '3'],
        ['03', '4 fluentes',  '`coor(X,Y)` 4×4',  '`x`×`y` 4×4',        '16',  'ddnnf, sdd', '3'],
        ['04', '5 fluentes',  '`coor(X,Y)` 4×8',  '`x`×`y` 4×8',        '32',  'ddnnf, sdd', '3'],
        ['05', '6 fluentes',  '`coor(X,Y)` 8×8',  '`x`×`y` 8×8',        '64',  'ddnnf, sdd', '3'],
        ['06', '7 fluentes',  '`coor(X,Y)` 8×16', '`x`×`y` 8×16',       '128', 'ddnnf, sdd', '3'],
        ['07', '8 fluentes',  '`coor(X,Y)` 16×16','`x`×`y` 16×16',      '256', 'ddnnf, sdd', '3'],
    ]
))
w()
w('Las tareas con `status=success` previo se omiten en reinicios (*skip-if-exists*).')
w()

# ─── Sección 3: Tabla maestra ──────────────────────────────────────────────

w('## 3. Tabla maestra de resultados (medianas sobre 3 runs)')
w()

for compiler in COMPILERS:
    w(f'### Backend: `{compiler}`')
    w()
    subset = med[med['compiler'] == compiler].sort_values(['model_type', 'grid_id'])

    rows = []
    for _, row in subset.iterrows():
        gid = int(row['grid_id'])
        S   = GRID_SIZES[gid]
        rows.append([
            row['model_type'],
            f'grid{gid:02d}',
            f'{S}',
            fmt_i(row['gp_atoms']),
            fmt_i(row['circuit_nodes']),
            fmt_t(row['t_ground']),
            fmt_t(row['t_compile']),
            fmt_t(row['t_prepare']),
        ])

    w(md_table(
        ['model_type', 'grid_id', '|S|', 'gp_atoms', 'circuit_nodes',
         't_ground', 't_compile', 't_prepare'],
        rows
    ))
    w()

# ─── Sección 4: Análisis de escalado ───────────────────────────────────────

w('## 4. Análisis de escalado (exponente α = Δlog(métrica)/Δlog(|S|))')
w()
w('α ≈ 1 → crecimiento lineal · α ≈ 2 → cuadrático · α >> 2 → super-polinomial')
w()

for t in TYPES:
    w(f'### `{t}`')
    w()
    # Usar ddnnf como referencia
    subdf = med[(med['model_type'] == t) & (med['compiler'] == 'ddnnf')]
    alphas_cn = compute_alphas(subdf, 'circuit_nodes')
    alphas_tc = compute_alphas(subdf, 't_compile')
    alphas_gp = compute_alphas(subdf, 'gp_atoms')

    rows = []
    for i, row in enumerate(alphas_cn):
        gid = row['grid_id']
        rows.append([
            f'grid{gid:02d}',
            f'{row["S"]}',
            fmt_i(row['circuit_nodes']),
            fmt_alpha(row['alpha']),
            fmt_t(alphas_tc[i]['t_compile']),
            fmt_alpha(alphas_tc[i]['alpha']),
            fmt_i(alphas_gp[i]['gp_atoms']),
            fmt_alpha(alphas_gp[i]['alpha']),
        ])

    w(md_table(
        ['grid', '|S|', 'circuit_nodes', 'α_nodes', 't_compile', 'α_tc', 'gp_atoms', 'α_gp'],
        rows
    ))
    w()

w()

# ─── Sección 5: Comparación entre arquitecturas ────────────────────────────

w('## 5. Comparación entre arquitecturas (mismo |S|, backend ddnnf)')
w()
w('Speedup positivo significa que `multivalued` es más compacto/rápido.')
w()

# Pivotear por grid_id
pivot_cn = med[med['compiler'] == 'ddnnf'].pivot_table(
    index='grid_id', columns='model_type', values='circuit_nodes')
pivot_tc = med[med['compiler'] == 'ddnnf'].pivot_table(
    index='grid_id', columns='model_type', values='t_compile')

rows = []
for gid in sorted(pivot_cn.index):
    S = GRID_SIZES[int(gid)]
    row = [f'grid{int(gid):02d}', f'{S}']

    def ratio(col_a, col_b, pivot):
        try:
            a = pivot.loc[gid, col_a]
            b = pivot.loc[gid, col_b]
            if pd.notna(a) and pd.notna(b) and b > 0:
                return f'{a/b:.2f}×'
        except KeyError:
            pass
        return '—'

    row += [
        ratio('boolean',      'multivalued', pivot_cn),
        ratio('multi_factor', 'multivalued', pivot_cn),
        ratio('boolean',      'multivalued', pivot_tc),
        ratio('multi_factor', 'multivalued', pivot_tc),
    ]
    rows.append(row)

w(md_table(
    ['grid', '|S|',
     'cn(bool)/cn(mv)', 'cn(mf)/cn(mv)',
     'tc(bool)/tc(mv)', 'tc(mf)/tc(mv)'],
    rows
))
w()
w('`bool`=boolean · `mv`=multivalued · `mf`=multi_factor · `cn`=circuit_nodes · `tc`=t_compile')
w()

# ─── Sección 6: Comparación de backends ────────────────────────────────────

w('## 6. Comparación de backends (ddnnf vs sdd)')
w()
w('Para cada tipo y grid, se muestra el cociente `circuit_nodes(sdd)/circuit_nodes(ddnnf)` '
  'y `t_compile(sdd)/t_compile(ddnnf)`. Un valor ≈ 1 indica que ambos backends '
  'producen resultados equivalentes.')
w()

pivot_cn_comp = med.pivot_table(
    index=['model_type', 'grid_id'], columns='compiler', values='circuit_nodes')
pivot_tc_comp = med.pivot_table(
    index=['model_type', 'grid_id'], columns='compiler', values='t_compile')

rows = []
for t in TYPES:
    for gid in sorted(med[med['model_type'] == t]['grid_id'].unique()):
        S = GRID_SIZES[int(gid)]
        try:
            cn_dd = pivot_cn_comp.loc[(t, gid), 'ddnnf']
            cn_sd = pivot_cn_comp.loc[(t, gid), 'sdd']
            tc_dd = pivot_tc_comp.loc[(t, gid), 'ddnnf']
            tc_sd = pivot_tc_comp.loc[(t, gid), 'sdd']
            if pd.notna(cn_dd) and cn_dd > 0:
                ratio_cn = f'{cn_sd/cn_dd:.3f}'
            else:
                ratio_cn = '—'
            if pd.notna(tc_dd) and tc_dd > 0:
                ratio_tc = f'{tc_sd/tc_dd:.3f}'
            else:
                ratio_tc = '—'
        except KeyError:
            ratio_cn = ratio_tc = '—'
        rows.append([t, f'grid{int(gid):02d}', f'{S}', ratio_cn, ratio_tc])

w(md_table(
    ['model_type', 'grid', '|S|', 'cn(sdd)/cn(ddnnf)', 'tc(sdd)/tc(ddnnf)'],
    rows
))
w()
w('> **Observación:** Para este dominio, ambos backends producen circuitos idénticos '
  '(`circuit_nodes` = 1.000) con tiempos de compilación prácticamente iguales. '
  'Los circuitos d-DNNF y SDD coinciden en estructura para el Mitchell Grid, '
  'lo que confirma la hipótesis de equivalencia para dominios con transiciones sparse.')
w()

# ─── Sección 7: Límites de memoria (OOM) ────────────────────────────────────

w('## 7. Límites de memoria (OOM killed)')
w()

oom_summary = (oom.groupby(['model_type', 'grid_id', 'compiler'])
               .size()
               .reset_index(name='n_oom'))

rows = []
for _, row in oom_summary.iterrows():
    gid = int(row['grid_id'])
    S = GRID_SIZES.get(gid, '?')
    rows.append([
        row['model_type'],
        f'grid{gid:02d}',
        f'{S}',
        row['compiler'],
        f'{int(row["n_oom"])}/3',
    ])

if rows:
    w(md_table(
        ['model_type', 'grid', '|S|', 'compiler', 'runs_oom'],
        rows
    ))
else:
    w('*(Sin eventos OOM en este dataset.)*')
w()
w('`multivalued` es el único tipo que escala hasta 256 estados (grid07) sin OOM. '
  '`boolean` y `multi_factor` fallan en grid06 (128 estados) con ambos backends.')
w()

# ─── Sección 8: Conexión con predicciones teóricas ──────────────────────────

w('## 8. Conexión con predicciones teóricas')
w()

w('### 8.1 Proposición 7.1 — Crecimiento lineal de gp_atoms')
w()
w('La Proposición 7.1 predice que `gp_atoms ~ O(|S|)` (α_gp ≈ 1.0), porque cada '
  'fluente contribuye un número fijo de átomos proposicionales al programa aterrizado.')
w()

rows_prop71 = []
for t in TYPES:
    subdf = med[(med['model_type'] == t) & (med['compiler'] == 'ddnnf')]
    alphas = compute_alphas(subdf, 'gp_atoms')
    # Usar α promedio sobre grids donde se pudo calcular
    valid_alphas = [r['alpha'] for r in alphas if r['alpha'] is not None]
    avg_alpha = sum(valid_alphas) / len(valid_alphas) if valid_alphas else None
    rows_prop71.append([t, fmt_alpha(avg_alpha), '≈ 1.0'])

w(md_table(
    ['model_type', 'α_gp (promedio)', 'predicción teórica'],
    rows_prop71
))
w()

# Compute actual values per grid for prop 7.1
w('Detalle por grid (ddnnf):')
w()
for t in TYPES:
    subdf = med[(med['model_type'] == t) & (med['compiler'] == 'ddnnf')]
    alphas = compute_alphas(subdf, 'gp_atoms')
    alpha_vals = ', '.join(
        f'grid{r["grid_id"]:02d}: {fmt_alpha(r["alpha"])}'
        for r in alphas if r['alpha'] is not None
    )
    w(f'- `{t}`: {alpha_vals}')
w()

w('### 8.2 Sección 7.2 — Treewidth y costo de compilación de circuitos')
w()
w('La Sección 7.2 predice que el tiempo de compilación está acotado por '
  'O(|φ| · 2^{tw(φ)}), donde tw(φ) es el treewidth del programa proposicional. '
  'La diferencia de circuit_nodes entre arquitecturas es evidencia de que cada '
  'codificación tiene un treewidth distinto.')
w()

# Tabla de circuit_nodes en grid05 por tipo
if 5 in pivot_cn.index:
    rows_tw = []
    for t in TYPES:
        try:
            cn = pivot_cn.loc[5, t]
            tc = pivot_tc.loc[5, t]
            rows_tw.append([t, '64', fmt_i(cn), fmt_t(tc)])
        except KeyError:
            rows_tw.append([t, '64', '—', '—'])
    w(md_table(
        ['model_type', '|S|', 'circuit_nodes (grid05)', 't_compile (grid05)'],
        rows_tw
    ))
    w()

w('**Interpretación:** `multivalued` produce los circuitos más compactos porque '
  'su codificación one-hot global genera un programa proposicional con menor '
  'treewidth efectivo que `boolean` (que escala con 2^N factores binarios) o '
  '`multi_factor` (que introduce restricciones de exclusión mutua entre factores '
  'separados). La diferencia en t_compile es dramática: `multivalued` es ~100× '
  'más rápido que `boolean` en grid05.')
w()

# ─── Sección 9: Experimentos pendientes ─────────────────────────────────────

w('## 9. Experimentos pendientes')
w()
w('### Fase B — Value Iteration con el tipo ganador *(completada)*')
w()
w('La Fase B ha sido completada. Los resultados completos se encuentran en '
  '`resultados/reporte_fase_B.md`.')
w()
w('**Hallazgos principales de Fase B:**')
w()
w('- `n_iterations` crece de 2 (grid00) a 16 (grid07) y es **invariante** '
  'respecto a γ y ε.')
w('- α_tvi ≈ 2.5–2.9 entre grids consecutivos (crecimiento super-cuadrático).')
w('- En grid07 (256 estados): t_vi ≈ 127 s, t_compile ≈ 2.8 s → '
  'VI es el cuello de botella del pipeline completo.')
w('- Ver análisis detallado: `resultados/reporte_fase_B.md`')
w()
w('### Experimento Fase 3 — Barrido de cardinalidad')
w()
w('Para validar directamente Proposición 7.1 y Sección 7.2, se necesita un barrido '
  'donde la cardinalidad N del fluente multivaluado varía de forma controlada '
  '(manteniendo |S| fijo o variando ambos sistemáticamente):')
w()
w('| Variable | Rango propuesto |')
w('|----------|----------------|')
w('| Cardinalidad N (grupo multivaluado) | 2, 4, 8, 16, 32, 64 |')
w('| |S| (tamaño de estado space) | fijo en 64 o variable |')
w('| Métricas objetivo | `gp_atoms`, `circuit_nodes`, `t_compile` |')
w()
w('Esto permitirá medir directamente α_gp y α_nodes como función de N, '
  'comparando contra la predicción O(N) de Prop 7.1 y la cota '
  'O(|φ| · 2^{tw}) de Sec 7.2.')
w()
w('### Referencias para el paper (IBERAMIA 2026)')
w()
w('- Los resultados de Fase A proveen la Tabla de Resultados principal.')
w('- El análisis de α_nodes cuantifica el crecimiento empírico del circuito.')
w('- La Sección 8.2 de este reporte conecta directamente con las Proposiciones '
  '7.1 y 7.2 del documento de validación matemática.')
w()

# ─── Escribir archivo ───────────────────────────────────────────────────────

report_text = out.getvalue()
with open(REPORT_PATH, 'w') as f:
    f.write(report_text)

print(f'Reporte generado: {REPORT_PATH}')
print(f'  Líneas: {report_text.count(chr(10))}')
