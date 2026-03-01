%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).

%state fluents
state_fluent(position(coor(X,Y)), enum) :- row(X), col(Y).

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
goal :- position(coor(1,3), 1), not(terminal).

%restriction
terminal :- position(coor(1,3), 0).

%Transitions

% Movimientos Horizontales
1.00::position(coor(X, Y_new), 1) :- position(coor(X, Y), 0), right, Y_new is Y + 1, col(Y_new), not(terminal).
1.00::position(coor(X, Y_new), 1) :- position(coor(X, Y), 0), left, Y_new is Y - 1, col(Y_new),  not(terminal).

% Movimientos Verticales
1.00::position(coor(X_new, Y), 1) :- position(coor(X, Y), 0), down, X_new is X + 1, row(X_new), not(terminal).
1.00::position(coor(X_new, Y), 1) :- position(coor(X, Y), 0), up, X_new is X - 1, row(X_new), not(terminal).

% Acción Stay
1.00::position(coor(1, 3), 1) :- position(coor(1, 3), 0), stay.






 