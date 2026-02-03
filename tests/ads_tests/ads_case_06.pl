% Resultado esperado: ADs
% Group Key: mv_case_06
% Método: Inferencia
% Base: 3

state_fluent(mv_case_06(X, Y)) :- mv_values(X), other(Y).

0.333333333333::mv_values(a);
0.333333333333::mv_values(b);
0.333333333333::mv_values(c).

% Independientes

0.60::other(yes).
0.40::other(no).