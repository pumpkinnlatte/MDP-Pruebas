%%% Ruleta de N=5 Caras - Modelo de Stress para Fase 3
%%% Dominio sintetico para evaluar el impacto computacional de inyectar
%%% Annotated Disjunctions (ADs) para simular fluentes multivaluados.
%%%
%%% Estructura:
%%%   - 1 fluente multivaluado: color(X) con 5 valores {c1, c2, c3, c4, c5}
%%%   - 1 accion: spin
%%%   - Transiciones uniformes: desde cualquier color, cada color tiene prob 1/5
%%%   - El framework inyecta 1 AD de base 5, generando O(N^2)=25 atomos ground
%%%     y clausulas de exclusion mutua que inflan el treewidth de la formula CNF.
%%%
%%% Proposicion 7.1 (Eq. 17): |vars| = b_k' = N = 5 proposicionales por factor
%%% Pero en la practica, N fuentes x N cabezas = N^2 reglas AD ground.
%%% Seccion 7.2: T_compile = O(|phi| * 2^tw(phi)), tw crece con N.

% Definicion de valores posibles (AD de dominio)
1/5::c_values(c1); 1/5::c_values(c2); 1/5::c_values(c3); 1/5::c_values(c4); 1/5::c_values(c5).

% Declaracion del fluente multivaluado
state_fluent(color(X), multivalued) :- c_values(X).

% Accion disponible
action(spin).

% Utilidad (costo constante por paso)
utility(cost, -1).
cost.

% Transiciones: N reglas con N cabezas cada una (uniforme)
% Desde color(c1,0): girar produce cualquier color con prob 1/5
1/5::color(c1, 1); 1/5::color(c2, 1); 1/5::color(c3, 1); 1/5::color(c4, 1); 1/5::color(c5, 1) :- color(c1, 0), spin.
% Desde color(c2,0):
1/5::color(c1, 1); 1/5::color(c2, 1); 1/5::color(c3, 1); 1/5::color(c4, 1); 1/5::color(c5, 1) :- color(c2, 0), spin.
% Desde color(c3,0):
1/5::color(c1, 1); 1/5::color(c2, 1); 1/5::color(c3, 1); 1/5::color(c4, 1); 1/5::color(c5, 1) :- color(c3, 0), spin.
% Desde color(c4,0):
1/5::color(c1, 1); 1/5::color(c2, 1); 1/5::color(c3, 1); 1/5::color(c4, 1); 1/5::color(c5, 1) :- color(c4, 0), spin.
% Desde color(c5,0):
1/5::color(c1, 1); 1/5::color(c2, 1); 1/5::color(c3, 1); 1/5::color(c4, 1); 1/5::color(c5, 1) :- color(c5, 0), spin.
