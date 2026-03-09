% GRID bi factored multi-valued base test case 07
% N FLUENTES DE ESTADO:  2
% N DE ESTADOS:  256
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
goal :- x(1, 1), y(8, 1), not(terminal).
terminal :- x(1, 0), y(8, 0).

% Transitions
% Movimientos Horizontales Exitosos
1.00::x(X, 1)     :- x(X, 0), y(Y, 0), right, Y_new is Y + 1, col(Y_new), not(terminal).
1.00::y(Y_new, 1) :- x(X, 0), y(Y, 0), right, Y_new is Y + 1, col(Y_new), not(terminal).

1.00::x(X, 1)     :- x(X, 0), y(Y, 0), left, Y_new is Y - 1, col(Y_new), not(terminal).
1.00::y(Y_new, 1) :- x(X, 0), y(Y, 0), left, Y_new is Y - 1, col(Y_new), not(terminal).

% Movimientos Verticales Exitosos
1.00::x(X_new, 1) :- x(X, 0), y(Y, 0), down, X_new is X + 1, row(X_new), not(terminal).
1.00::y(Y, 1)     :- x(X, 0), y(Y, 0), down, X_new is X + 1, row(X_new), not(terminal).

1.00::x(X_new, 1) :- x(X, 0), y(Y, 0), up, X_new is X - 1, row(X_new), not(terminal).
1.00::y(Y, 1)     :- x(X, 0), y(Y, 0), up, X_new is X - 1, row(X_new), not(terminal).

% Acción Stay (Generalizada)
1.00::x(X, 1) :- x(X, 0), y(Y, 0), stay, not(terminal).
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), stay, not(terminal).

% Transiciones de inercia
% Rebote Horizontal
1.00::x(X, 1) :- x(X, 0), y(Y, 0), right, Y_new is Y + 1, not(col(Y_new)), not(terminal).
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), right, Y_new is Y + 1, not(col(Y_new)), not(terminal).

1.00::x(X, 1) :- x(X, 0), y(Y, 0), left, Y_new is Y - 1, not(col(Y_new)), not(terminal).
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), left, Y_new is Y - 1, not(col(Y_new)), not(terminal).

% Rebote Vertical
1.00::x(X, 1) :- x(X, 0), y(Y, 0), down, X_new is X + 1, not(row(X_new)), not(terminal).
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), down, X_new is X + 1, not(row(X_new)), not(terminal).

1.00::x(X, 1) :- x(X, 0), y(Y, 0), up, X_new is X - 1, not(row(X_new)), not(terminal).
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), up, X_new is X - 1, not(row(X_new)), not(terminal).

% Cualquier acción en un estado terminal devuelve al mismo estado
1.00::x(X, 1) :- x(X, 0), y(Y, 0), terminal.
1.00::y(Y, 1) :- x(X, 0), y(Y, 0), terminal.

%Background knowledge
row(1).
row(2).
row(3).
row(4).
row(5).
row(6).
row(7).
row(8).
row(9).
row(10).
row(11).
row(12).
row(13).
row(14).
row(15).
row(16).

col(1).
col(2).
col(3).
col(4).
col(5).
col(6).
col(7).
col(8).
col(9).
col(10).
col(11).
col(12).
col(13).
col(14).
col(15).
col(16).