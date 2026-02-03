% Resultado esperado: 
% Group Key: mv_case_09
% Método: Definicion Explicita
% Base: 3 grupos de mv_values con base 2

state_fluent(mv_case_09(X, Y), ads) :- mv_values(X), other(Y).

mv_values(a).
mv_values(b).
mv_values(c).

% Disyuncion

0.60::other(yes);
0.40::other(no).