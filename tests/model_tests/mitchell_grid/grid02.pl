%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).

%state fluents
state_fluent(pos(coor(X,Y)), ads) :- row(X), col(Y).

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
goal :- pos(coor(1,3), 1), not(terminal).

%restriction
terminal :- pos(coor(1,3), 0).

%Transitions

% Movimientos Horizontales
1.00::pos(coor(X, Y_new), 1) :- pos(coor(X, Y), 0), right, Y_new is Y + 1, col(Y_new), not(terminal).
1.00::pos(coor(X, Y_new), 1) :- pos(coor(X, Y), 0), left, Y_new is Y - 1, col(Y_new),  not(terminal).

% Movimientos Verticales
1.00::pos(coor(X_new, Y), 1) :- pos(coor(X, Y), 0), down, X_new is X + 1, row(X_new), not(terminal).
1.00::pos(coor(X_new, Y), 1) :- pos(coor(X, Y), 0), up, X_new is X - 1, row(X_new), not(terminal).

% Acción Stay
1.00::pos(coor(1, 3), 1) :- pos(coor(1, 3), 0), stay.






 