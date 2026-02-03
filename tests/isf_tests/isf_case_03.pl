% Resultado esperado: IFS
% Método: Por Inferencia
% Cantidad de ISF: 2

state_fluent(isf_case_03(X, Y)) :- isf_values(X), otro(Y).

isf_values(a).
isf_values(b).

otro(c).