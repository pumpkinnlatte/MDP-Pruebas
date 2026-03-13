% GRID bi factored multi-valued base test case
% N FLUENTES DE ESTADO:  2
% N DE ESTADOS:  6
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 30 

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
goal :- x(1, 1), y(3, 1).

terminal :- x(1, 0), y(3, 0).


%Transitions
%P(X | coor(1,1), a).
1.00::x(1, 1):- x(1, 0), y(1, 0), right.
1.00::y(2, 1):- x(1, 0), y(1, 0), right.

1.00::x(2, 1):- x(1, 0), y(1, 0), down.
1.00::y(1, 1):- x(1, 0), y(1, 0), down.

%P(X | coor(1,2), a).
1.00::x(1, 1):- x(1, 0), y(2, 0), right.
1.00::y(3, 1):- x(1, 0), y(2, 0), right.

1.00::x(1, 1):- x(1, 0), y(2, 0), left.
1.00::y(1, 1):- x(1, 0), y(2, 0), left.

1.00::x(2, 2):- x(1, 0), y(2, 0), down.
1.00::y(2, 2):- x(1, 0), y(2, 0), down.

%P(X | coor(1,3), a).
1.00::x(1, 1):- x(1, 0), y(3, 0), stay, not(terminal).
1.00::y(3, 1):- x(1, 0), y(3, 0), stay, not(terminal).

1.00::x(1, 1):- x(1, 0), y(3, 0), left, not(terminal).
1.00::y(3, 1):- x(1, 0), y(3, 0), left, not(terminal).

1.00::x(1, 1):- x(1, 0), y(3, 0), right, not(terminal).
1.00::y(3, 1):- x(1, 0), y(3, 0), right, not(terminal).

1.00::x(1, 1):- x(1, 0), y(3, 0), up, not(terminal).
1.00::y(3, 1):- x(1, 0), y(3, 0), up, not(terminal).

1.00::x(1, 1):- x(1, 0), y(3, 0), down, not(terminal).
1.00::y(3, 1):- x(1, 0), y(3, 0), down, not(terminal).

%P(X | coor(2,1), a).
1.00::x(1, 1):- x(2, 0), y(1, 0), up.
1.00::y(1, 1):- x(2, 0), y(1, 0), up.

1.00::x(2, 1):- x(2, 0), y(1, 0), right.
1.00::y(2, 1):- x(2, 0), y(1, 0), right.

%P(X | coor(2,2), a).
1.00::x(1, 1):- x(2, 0), y(2, 0), up.
1.00::y(2, 1):- x(2, 0), y(2, 0), up.

1.00::x(2, 1):- x(2, 0), y(2, 0), left.
1.00::y(2, 1):- x(2, 0), y(2, 0), left.

1.00::x(2, 1):- x(2, 0), y(2, 0), right.
1.00::y(3, 1):- x(2, 0), y(2, 0), right.

%P(X | coor(2,3), a).

1.00::x(1, 1):- x(2, 0), y(3, 0), up.
1.00::y(3, 1):- x(2, 0), y(3, 0), up.

1.00::x(2, 2):- x(2, 0), y(3, 0), left.
1.00::y(2, 2):- x(2, 0), y(3, 0), left.

% Inercia para coor(1,1) (Choque contra pared superior e izquierda)
1.00::x(1, 0):- x(1, 0), y(1, 0), left.
1.00::y(1, 0):- x(1, 0), y(1, 0), left.

1.00::x(1, 1):- x(1, 0), y(1, 0), up.
1.00::y(1, 1):- x(1, 0), y(1, 0), up.

1.00::x(1, 1):- x(1, 0), y(1, 0), stay.
1.00::y(1, 1):- x(1, 0), y(1, 0), stay.

% Inercia para coor(1,2) (Choque contra pared superior)
1.00::x(1, 1):- x(1, 0), y(2, 0), up.
1.00::y(2, 1):- x(1, 0), y(2, 0), up.

1.00::x(1, 1):- x(1, 0), y(2, 0), stay.
1.00::y(2, 1):- x(1, 0), y(2, 0), stay.

% Inercia para coor(2,1) (Choque contra pared inferior e izquierda)
1.00::x(2, 1):- x(2, 0), y(1, 0), down.
1.00::y(1, 1):- x(2, 0), y(1, 0), down.

1.00::x(2, 1):- x(2, 0), y(1, 0), left.
1.00::y(1, 1):- x(2, 0), y(1, 0), left.

1.00::x(2, 1):- x(2, 0), y(1, 0), stay.
1.00::y(1, 1):- x(2, 0), y(1, 0), stay.

% Inercia para coor(2,2) (Choque contra pared inferior)
1.00::x(2, 1):- x(2, 0), y(2, 0), down.
1.00::y(2, 1):- x(2, 0), y(2, 0), down.

1.00::x(2, 1):- x(2, 0), y(2, 0), stay.
1.00::y(2, 1):- x(2, 0), y(2, 0), stay.

% Inercia para coor(2,3) (Choque contra pared inferior y derecha)
1.00::x(2, 1):- x(2, 0), y(3, 0), down.
1.00::y(3, 1):- x(2, 0), y(3, 0), down.

1.00::x(2, 1):- x(2, 0), y(3, 0), right.
1.00::y(3, 1):- x(2, 0), y(3, 0), right.

1.00::x(2, 1):- x(2, 0), y(3, 0), stay.
1.00::y(3, 1):- x(2, 0), y(3, 0), stay.

%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).