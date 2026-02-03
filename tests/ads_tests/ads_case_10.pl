% Resultado esperado: 
% Group Key: mv_case_10
% Método: Definicion Explicita
% Base: 2 grupos de mv_values con 2 de other

state_fluent(mv_case_10(X, Y), ads) :- mv_values(X), other(Y).

mv_values(a);
mv_values(b).

% Disyuncion

0.60::other(yes);
0.40::other(no).