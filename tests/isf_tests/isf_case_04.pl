% Resultado esperado: IFS
% Método: Por Inferencia
% Cantidad de ISF: 4

state_fluent(isf_case_04(X, Y)) :- isf_values(X), otro(Y).

isf_values(a).
isf_values(b).

otro(yes).
otro(no).