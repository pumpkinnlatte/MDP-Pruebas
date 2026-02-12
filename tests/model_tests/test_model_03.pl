% state_fluent
state_fluent(moneda(X)) :- valor_moneda(X).

% valores del dado como ads
1/2::valor_moneda(cara);
1/2::valor_moneda(cruz).

%acciones
action(lanzar).
action(none).

%utilities
utility(lanzar, -1).
utility(none, -5).
% Transition model
0.8::moneda(cara, 1) :- moneda(cara, 0), lanzar.
0.2::moneda(cruz, 1) :- moneda(cruz, 0), lanzar.


