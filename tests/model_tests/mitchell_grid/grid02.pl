%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).

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
utility(stay, 0).

%reward model
goal :- coor(1,3, 1), not(terminal).

%restriction
terminal :- coor(1,3, 0).

% ==========================================
% TRANSICIONES VÁLIDAS (ÉXITO)
% ==========================================

% Movimientos Horizontales Exitosos
1.00::coor(X, Y_new, 1) :- coor(X, Y, 0), right, Y_new is Y + 1, col(Y_new), not(terminal).
1.00::coor(X, Y_new, 1) :- coor(X, Y, 0), left, Y_new is Y - 1, col(Y_new), not(terminal).

% Movimientos Verticales Exitosos
1.00::coor(X_new, Y, 1) :- coor(X, Y, 0), down, X_new is X + 1, row(X_new), not(terminal).
1.00::coor(X_new, Y, 1) :- coor(X, Y, 0), up, X_new is X - 1, row(X_new), not(terminal).

% Acción Stay (Generalizada para todo el grid)
1.00::coor(X, Y, 1):- coor(X, Y, 0), stay, not(terminal).

% ==========================================
% REGLAS DE INERCIA (PREVENCIÓN DE FUGA ESTOCÁSTICA)
% ==========================================

% Rebote Horizontal (Si intenta salir de las columnas)
1.00::coor(X, Y, 1):- coor(X, Y, 0), right, Y_new is Y + 1, not(col(Y_new)), not(terminal).
1.00::coor(X, Y, 1):- coor(X, Y, 0), left, Y_new is Y - 1, not(col(Y_new)), not(terminal).

% Rebote Vertical (Si intenta salir de las filas)
1.00::coor(X, Y, 1):- coor(X, Y, 0), down, X_new is X + 1, not(row(X_new)), not(terminal).
1.00::coor(X, Y, 1):- coor(X, Y, 0), up, X_new is X - 1, not(row(X_new)), not(terminal).

% Sumidero del Estado Terminal (Sink State)
% Cualquier acción en un estado terminal devuelve al mismo estado
1.00::coor(X, Y, 1):- coor(X, Y, 0), terminal.