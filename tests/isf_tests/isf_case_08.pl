% Resultado esperado: IFS
% Método: Definicion Explicita
% Cantidad de ISF: 4

state_fluent(isf_case_08(X), isf) :- isf_values(X).

0.5::isf_values(a);
0.5::isf_values(b).

otro(yes);
otro(no).

