% GRID multi-valued base test case 06
% N FLUENTES DE ESTADO:  1
% N DE ESTADOS:  128
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 10 reglas generalizadas a cada estado

%state fluents
state_fluent(coor(X,Y), multivalued) :- row(X), col(Y).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- coor(1,16, 1), not(terminal).

%restriction
terminal :- coor(1,16, 0).

% Transiciones validas 

% Movimientos Horizontales Exitosos
1.00::coor(X, Y_new, 1) :- coor(X, Y, 0), right, Y_new is Y + 1, col(Y_new), not(terminal).
1.00::coor(X, Y_new, 1) :- coor(X, Y, 0), left, Y_new is Y - 1, col(Y_new), not(terminal).

% Movimientos Verticales Exitosos
1.00::coor(X_new, Y, 1) :- coor(X, Y, 0), down, X_new is X + 1, row(X_new), not(terminal).
1.00::coor(X_new, Y, 1) :- coor(X, Y, 0), up, X_new is X - 1, row(X_new), not(terminal).

% Acción Stay (Generalizada para todo el grid)
1.00::coor(X, Y, 1):- coor(X, Y, 0), stay, not(terminal).

% Reglas de inercia

% Rebote Horizontal (Si intenta salir de las columnas)
1.00::coor(X, Y, 1):- coor(X, Y, 0), right, Y_new is Y + 1, not(col(Y_new)), not(terminal).
1.00::coor(X, Y, 1):- coor(X, Y, 0), left, Y_new is Y - 1, not(col(Y_new)), not(terminal).

% Rebote Vertical (Si intenta salir de las filas)
1.00::coor(X, Y, 1):- coor(X, Y, 0), down, X_new is X + 1, not(row(X_new)), not(terminal).
1.00::coor(X, Y, 1):- coor(X, Y, 0), up, X_new is X - 1, not(row(X_new)), not(terminal).

% Cualquier acción en un estado terminal devuelve al mismo estado
1.00::coor(X, Y, 1):- coor(X, Y, 0), terminal.

%Background knowledge
row(1).
row(2).
row(3).
row(4).
row(5).
row(6).
row(7).
row(8).

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