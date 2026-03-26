%Background knowledge
row(1).
row(2).
row(3).

col(1).
col(2).
col(3).
col(4).

%state fluents
state_fluent(coor(X,Y), multivalued) :- row(X), col(Y).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 1).
utility(hole, -1).
utility(step, -0.04). % costo por moverese

%reward model
terminal :- coor(3,4, 0). % Meta
terminal :- coor(2,4, 0). % Trampa (Hole)
obstacle :- coor(2,2, 0). % Obstáculo

goal :- coor(3,4, 1), not(terminal).   % +1 al entrar al goal
hole :- coor(2,4, 1), not(terminal).   % -1 al entrar a la trampa
step :- not(terminal), not(obstacle).   % -0.04 por cada paso normal

%Transitions
% --- DESDE coor(1,1) ---
0.80::coor(1,2, 1); 0.10::coor(2,1, 1); 0.10::coor(1,1, 1) :- coor(1,1, 0), right.
0.90::coor(1,1, 1); 0.10::coor(2,1, 1) :- coor(1,1, 0), left.
0.80::coor(2,1, 1); 0.10::coor(1,1, 1); 0.10::coor(1,2, 1) :- coor(1,1, 0), up.
0.90::coor(1,1, 1); 0.10::coor(1,2, 1) :- coor(1,1, 0), down.
1.00::coor(1,1, 1) :- coor(1,1, 0), stay.

% --- DESDE coor(1,2) ---
% Arriba está el obstáculo (2,2), por lo que choca y se queda en (1,2)
0.80::coor(1,3, 1); 0.10::coor(1,2, 1); 0.10::coor(1,2, 1) :- coor(1,2, 0), right.
0.80::coor(1,1, 1); 0.10::coor(1,2, 1); 0.10::coor(1,2, 1) :- coor(1,2, 0), left.
0.80::coor(1,2, 1); 0.10::coor(1,1, 1); 0.10::coor(1,3, 1) :- coor(1,2, 0), up.
0.80::coor(1,2, 1); 0.10::coor(1,3, 1); 0.10::coor(1,1, 1) :- coor(1,2, 0), down.
1.00::coor(1,2, 1) :- coor(1,2, 0), stay.

% --- DESDE coor(1,3) ---
0.80::coor(1,4, 1); 0.10::coor(2,3, 1); 0.10::coor(1,3, 1) :- coor(1,3, 0), right.
0.80::coor(1,2, 1); 0.10::coor(1,3, 1); 0.10::coor(2,3, 1) :- coor(1,3, 0), left.
0.80::coor(2,3, 1); 0.10::coor(1,2, 1); 0.10::coor(1,4, 1) :- coor(1,3, 0), up.
0.80::coor(1,3, 1); 0.10::coor(1,4, 1); 0.10::coor(1,2, 1) :- coor(1,3, 0), down.
1.00::coor(1,3, 1) :- coor(1,3, 0), stay.

% --- DESDE coor(1,4) --- (Abajo de la trampa 2,4)
0.80::coor(1,4, 1); 0.10::coor(2,4, 1); 0.10::coor(1,4, 1) :- coor(1,4, 0), right.
0.80::coor(1,3, 1); 0.10::coor(1,4, 1); 0.10::coor(2,4, 1) :- coor(1,4, 0), left.
0.80::coor(2,4, 1); 0.10::coor(1,3, 1); 0.10::coor(1,4, 1) :- coor(1,4, 0), up.
0.80::coor(1,4, 1); 0.10::coor(1,4, 1); 0.10::coor(1,3, 1) :- coor(1,4, 0), down.
1.00::coor(1,4, 1) :- coor(1,4, 0), stay.

% --- DESDE coor(2,1) --- (A la izquierda del obstáculo 2,2)
% A la derecha está el obstáculo, choca y se queda en (2,1)
0.80::coor(2,1, 1); 0.10::coor(3,1, 1); 0.10::coor(1,1, 1) :- coor(2,1, 0), right.
0.80::coor(2,1, 1); 0.10::coor(1,1, 1); 0.10::coor(3,1, 1) :- coor(2,1, 0), left.
0.80::coor(3,1, 1); 0.10::coor(2,1, 1); 0.10::coor(2,1, 1) :- coor(2,1, 0), up.
0.80::coor(1,1, 1); 0.10::coor(2,1, 1); 0.10::coor(2,1, 1) :- coor(2,1, 0), down.
1.00::coor(2,1, 1) :- coor(2,1, 0), stay.

% --- DESDE coor(2,3) --- (Entre el obstáculo 2,2 y la trampa 2,4)
0.80::coor(2,4, 1); 0.10::coor(3,3, 1); 0.10::coor(1,3, 1) :- coor(2,3, 0), right.
0.80::coor(2,3, 1); 0.10::coor(1,3, 1); 0.10::coor(3,3, 1) :- coor(2,3, 0), left.
0.80::coor(3,3, 1); 0.10::coor(2,3, 1); 0.10::coor(2,4, 1) :- coor(2,3, 0), up.
0.80::coor(1,3, 1); 0.10::coor(2,4, 1); 0.10::coor(2,3, 1) :- coor(2,3, 0), down.
1.00::coor(2,3, 1) :- coor(2,3, 0), stay.

% --- DESDE coor(3,1) ---
0.80::coor(3,2, 1); 0.10::coor(3,1, 1); 0.10::coor(2,1, 1) :- coor(3,1, 0), right.
0.80::coor(3,1, 1); 0.10::coor(2,1, 1); 0.10::coor(3,1, 1) :- coor(3,1, 0), left.
0.80::coor(3,1, 1); 0.10::coor(3,1, 1); 0.10::coor(3,2, 1) :- coor(3,1, 0), up.
0.80::coor(2,1, 1); 0.10::coor(3,2, 1); 0.10::coor(3,1, 1) :- coor(3,1, 0), down.
1.00::coor(3,1, 1) :- coor(3,1, 0), stay.

% --- DESDE coor(3,2) --- (Arriba del obstáculo 2,2)
0.80::coor(3,3, 1); 0.10::coor(3,2, 1); 0.10::coor(3,2, 1) :- coor(3,2, 0), right.
0.80::coor(3,1, 1); 0.10::coor(3,2, 1); 0.10::coor(3,2, 1) :- coor(3,2, 0), left.
0.80::coor(3,2, 1); 0.10::coor(3,1, 1); 0.10::coor(3,3, 1) :- coor(3,2, 0), up.
0.80::coor(3,2, 1); 0.10::coor(3,3, 1); 0.10::coor(3,1, 1) :- coor(3,2, 0), down.
1.00::coor(3,2, 1) :- coor(3,2, 0), stay.

% --- DESDE coor(3,3) --- (A la izquierda de la Meta 3,4)
0.80::coor(3,4, 1); 0.10::coor(3,3, 1); 0.10::coor(2,3, 1) :- coor(3,3, 0), right.
0.80::coor(3,2, 1); 0.10::coor(2,3, 1); 0.10::coor(3,3, 1) :- coor(3,3, 0), left.
0.80::coor(3,3, 1); 0.10::coor(3,2, 1); 0.10::coor(3,4, 1) :- coor(3,3, 0), up.
0.80::coor(2,3, 1); 0.10::coor(3,4, 1); 0.10::coor(3,2, 1) :- coor(3,3, 0), down.
1.00::coor(3,3, 1) :- coor(3,3, 0), stay.


% Meta, Trampa y Obstáculo son absorbentes y bloquean el movimiento.
1.00::coor(X, Y, 1) :- coor(X, Y, 0), terminal.
1.00::coor(X, Y, 1) :- coor(X, Y, 0), obstacle.