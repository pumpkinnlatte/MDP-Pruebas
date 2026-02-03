% Resultado esperado: IFS o error por probabilidad > 1
% Método: Definicion Explicita
% Cantidad de ISF: 16

state_fluent(isf_case_09(X), isf) :- isf_values(X).

0.5::isf_values(a);
0.7::isf_values(b);
0.8::isf_values(c);
0.2::isf_values(d).

otro(yes);
otro(no).

