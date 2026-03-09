% GRID bi factored multi-valued base test case 01
% N FLUENTES DE ESTADO:  2
% N DE ESTADOS:  4
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 20 reglas generalizadas a cada estado

%state fluents
state_fluent(x(X), multivalued) :- row(X).
state_fluent(y(Y), multivalued) :- col(Y).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- x(1, 1), y(2, 1), not(terminal).
terminal :- x(1, 0), y(2, 0).

%Transitions
%P(X | coor(1,1), a).
1.00::x(1, 1):- x(1, 0), y(1, 0), right.
1.00::y(2, 1):- x(1, 0), y(1, 0), right.

1.00::x(2, 1):- x(1, 0), y(1, 0), down.
1.00::y(1, 1):- x(1, 0), y(1, 0), down.

%P(X | coor(1,2), a).
1.00::x(1, 1):- x(1, 0), y(2, 0), stay.
1.00::y(2, 1):- x(1, 0), y(2, 0), stay.


%P(X | coor(2,1), a).
1.00::x(1, 1):- x(2, 0), y(1, 0), up.
1.00::y(1, 1):- x(2, 0), y(1, 0), up.

1.00::x(2, 1):- x(2, 0), y(1, 0), right.
1.00::y(2, 1):- x(2, 0), y(1, 0), right.

%P(X | coor(2,2), a).
1.00::x(1, 1):- x(2, 0), y(2, 0), up.
1.00::y(2, 1):- x(2, 0), y(2, 0), up.

1.00::x(1, 1):- x(2, 0), y(2, 0), left.
1.00::y(2, 1):- x(2, 0), y(2, 0), left.

% Transiciones de inercia

% coor(1,1) 
1.00::x(1, 1):- x(1, 0), y(1, 0), left.
1.00::y(1, 1):- x(1, 0), y(1, 0), left.

1.00::x(1, 1):- x(1, 0), y(1, 0), up.
1.00::y(1, 1):- x(1, 0), y(1, 0), up.

1.00::x(1, 1):- x(1, 0), y(1, 0), stay.
1.00::y(1, 1):- x(1, 0), y(1, 0), stay.

% coor(1,2) 
1.00::x(1, 1):- x(1, 0), y(2, 0), right.
1.00::y(2, 1):- x(1, 0), y(2, 0), right.

1.00::x(1, 1):- x(1, 0), y(2, 0), up.
1.00::y(2, 1):- x(1, 0), y(2, 0), up.

1.00::x(1, 1):- x(1, 0), y(2, 0), left.
1.00::y(2, 1):- x(1, 0), y(2, 0), left.

1.00::x(1, 2):- x(1, 0), y(2, 0), down.
1.00::y(2, 2):- x(1, 0), y(2, 0), down.

% coor(2,1) 
1.00::x(2, 1):- x(2, 0), y(1, 0), down.
1.00::y(1, 1):- x(2, 0), y(1, 0), down.

1.00::x(2, 1):- x(2, 0), y(1, 0), left.
1.00::y(1, 1):- x(2, 0), y(1, 0), left.

1.00::x(2, 1):- x(2, 0), y(1, 0), stay.
1.00::y(1, 1):- x(2, 0), y(1, 0), stay.

% coor(2,2) 
1.00::x(2, 1):- x(2, 0), y(2, 0), down.
1.00::y(2, 1):- x(2, 0), y(2, 0), down.

1.00::x(2, 1):- x(2, 0), y(2, 0), stay.
1.00::y(2, 1):- x(2, 0), y(2, 0), stay.

1.00::x(2, 1):- x(2, 0), y(2, 0), right.
1.00::y(2, 1):- x(2, 0), y(2, 0), right.


%Background knowledge
row(1).
row(2).

col(1).
col(2).