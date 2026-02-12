
% Fluente de estado para una moneda
state_fluent(cara).

% P(x'' | x, a)

0.8::cara(1) :- cara(0).
0.1::cara() :- not(cara(0)).