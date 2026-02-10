% Resultado esperado: ADs
% Group Key: mv_case_05
% Método: Inferencia    
% Base: 4 

state_fluent(mv_case_05(X, Y)) :- mv_values(X), other(Y).

0.25::mv_values(a);
0.25::mv_values(b);
0.25::mv_values(c);
0.25::mv_values(d).

% Independientes

other(yes).
other(no).