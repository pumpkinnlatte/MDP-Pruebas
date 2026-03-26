%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).

%state fluents
state_fluent(x(X), multivalued) :- col(X).
state_fluent(y(Y), multivalued) :- row(Y).

%actions
action(left).
action(right). 
action(up). 
action(down). 

% utilities
utility(goal, 100).

% remard model
goal :- x(2, 1), y(1, 1).
absortion :- x(2, 0), y(1, 0).

%NOTAS
% 1. Completar las cabezas de las ADS
% 2. Usar las dos cordenadas en las reglas
% 3. Intentar eliminar el not(absortion), absortion 

% transitons factor x
1.0::x(1, 1) :- x(1, 0), left.
1.0::x(1, 1) :- x(2, 0), left.
1.0::x(2, 1) :- x(3, 0), left.

1.0::x(2, 1) :- x(1, 0), right.
1.0::x(3, 1) :- x(2, 0), right.
1.0::x(3, 1) :- x(3, 0), right.

1.0::x(1, 1); 0.0::x(2, 1); 0.0::x(3, 1):- x(1, 0), up.
1.0::x(2, 1); 0.0::x(1, 1); 0.0::x(3, 1):- x(2, 0), up.
1.0::x(3, 1); 0.0::x(1, 1); 0.0::x(2, 1):- x(3, 0), up.

1.0::x(1, 1) :- x(1, 0), down.
1.0::x(2, 1) :- x(2, 0), down.
1.0::x(3, 1) :- x(3, 0), down.

% transitions factor y

1.0::y(1, 1) :- y(1, 0), up.
1.0::y(1, 1) :- y(2, 0), up.

1.0::y(2, 1) :- y(1, 0), down.
1.0::y(2, 1) :- y(2, 0), down.

1.0::y(1, 1) :- y(1, 0), left.
1.0::y(2, 1) :- y(2, 0), left.

1.0::y(1, 1) :- y(1, 0), right.
1.0::y(2, 1) :- y(2, 0), right.


