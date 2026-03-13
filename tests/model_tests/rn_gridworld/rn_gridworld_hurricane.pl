% ==========================================================
% Russell & Norvig 3x4 Gridworld — Hurricane Variant (1e-7)
% ==========================================================
% Base: rn_gridworld01.pl (R&N classic, 0.80/0.10/0.10)
% Perturbación: cada transición direccional reduce la prob.
% intencionada de 0.80 a 0.7999999 y añade una rama huracán
% con prob. 1e-7 que teleporta a un destino fijo.
%
% Destinos huracán (elegidos para evitar colisiones con
% ramas existentes del mismo AD):
%   - Mayoría de estados: coor(3,1,1)
%   - coor(2,1), coor(3,1), coor(3,2): coor(1,4,1)
% ==========================================================

% KNOWLEDGE BASE
row(1). row(2). row(3).
col(1). col(2). col(3). col(4).

% STATE FLUENTS
state_fluent(coor(X,Y), multivalued) :- row(X), col(Y).

% ACTIONS
action(left). action(right). action(up). action(down). action(stay).

% UTILITIES
utility(goal, 1.0).
utility(hole, -1.0).
utility(step, -0.04).

% SPECIAL STATES
terminal :- coor(3,4, 0).
terminal :- coor(2,4, 0).
obstacle :- coor(2,2, 0).

% REWARD MODEL
goal :- coor(3,4, 1), not(terminal).
hole :- coor(2,4, 1), not(terminal).
step :- not(terminal), not(obstacle).

% ==========================================================
% TRANSICIONES ESTOCÁSTICAS (HURRICANE 1e-7)
% ==========================================================

% --- DESDE coor(1,1) --- [huracán → coor(3,1)]
0.7999999::coor(1,2, 1); 0.10::coor(2,1, 1); 0.10::coor(1,1, 1); 0.0000001::coor(3,1, 1) :- coor(1,1, 0), right.
0.7999999::coor(1,1, 1); 0.10::coor(1,1, 1); 0.10::coor(2,1, 1); 0.0000001::coor(3,1, 1) :- coor(1,1, 0), left.
0.7999999::coor(2,1, 1); 0.10::coor(1,1, 1); 0.10::coor(1,2, 1); 0.0000001::coor(3,1, 1) :- coor(1,1, 0), up.
0.7999999::coor(1,1, 1); 0.10::coor(1,2, 1); 0.10::coor(1,1, 1); 0.0000001::coor(3,1, 1) :- coor(1,1, 0), down.
1.00::coor(1,1, 1) :- coor(1,1, 0), stay.

% --- DESDE coor(1,2) --- [huracán → coor(3,1)]
0.7999999::coor(1,3, 1); 0.10::coor(1,2, 1); 0.10::coor(1,2, 1); 0.0000001::coor(3,1, 1) :- coor(1,2, 0), right.
0.7999999::coor(1,1, 1); 0.10::coor(1,2, 1); 0.10::coor(1,2, 1); 0.0000001::coor(3,1, 1) :- coor(1,2, 0), left.
0.7999999::coor(1,2, 1); 0.10::coor(1,1, 1); 0.10::coor(1,3, 1); 0.0000001::coor(3,1, 1) :- coor(1,2, 0), up.
0.7999999::coor(1,2, 1); 0.10::coor(1,3, 1); 0.10::coor(1,1, 1); 0.0000001::coor(3,1, 1) :- coor(1,2, 0), down.
1.00::coor(1,2, 1) :- coor(1,2, 0), stay.

% --- DESDE coor(1,3) --- [huracán → coor(3,1)]
0.7999999::coor(1,4, 1); 0.10::coor(2,3, 1); 0.10::coor(1,3, 1); 0.0000001::coor(3,1, 1) :- coor(1,3, 0), right.
0.7999999::coor(1,2, 1); 0.10::coor(1,3, 1); 0.10::coor(2,3, 1); 0.0000001::coor(3,1, 1) :- coor(1,3, 0), left.
0.7999999::coor(2,3, 1); 0.10::coor(1,2, 1); 0.10::coor(1,4, 1); 0.0000001::coor(3,1, 1) :- coor(1,3, 0), up.
0.7999999::coor(1,3, 1); 0.10::coor(1,4, 1); 0.10::coor(1,2, 1); 0.0000001::coor(3,1, 1) :- coor(1,3, 0), down.
1.00::coor(1,3, 1) :- coor(1,3, 0), stay.

% --- DESDE coor(1,4) --- [huracán → coor(3,1)]
0.7999999::coor(1,4, 1); 0.10::coor(2,4, 1); 0.10::coor(1,4, 1); 0.0000001::coor(3,1, 1) :- coor(1,4, 0), right.
0.7999999::coor(1,3, 1); 0.10::coor(1,4, 1); 0.10::coor(2,4, 1); 0.0000001::coor(3,1, 1) :- coor(1,4, 0), left.
0.7999999::coor(2,4, 1); 0.10::coor(1,3, 1); 0.10::coor(1,4, 1); 0.0000001::coor(3,1, 1) :- coor(1,4, 0), up.
0.7999999::coor(1,4, 1); 0.10::coor(1,4, 1); 0.10::coor(1,3, 1); 0.0000001::coor(3,1, 1) :- coor(1,4, 0), down.
1.00::coor(1,4, 1) :- coor(1,4, 0), stay.

% --- DESDE coor(2,1) --- [huracán → coor(1,4)] (coor(3,1) es rama regular)
0.7999999::coor(2,1, 1); 0.10::coor(3,1, 1); 0.10::coor(1,1, 1); 0.0000001::coor(1,4, 1) :- coor(2,1, 0), right.
0.7999999::coor(2,1, 1); 0.10::coor(1,1, 1); 0.10::coor(3,1, 1); 0.0000001::coor(1,4, 1) :- coor(2,1, 0), left.
0.7999999::coor(3,1, 1); 0.10::coor(2,1, 1); 0.10::coor(2,1, 1); 0.0000001::coor(1,4, 1) :- coor(2,1, 0), up.
0.7999999::coor(1,1, 1); 0.10::coor(2,1, 1); 0.10::coor(2,1, 1); 0.0000001::coor(1,4, 1) :- coor(2,1, 0), down.
1.00::coor(2,1, 1) :- coor(2,1, 0), stay.

% --- DESDE coor(2,3) --- [huracán → coor(3,1)]
0.7999999::coor(2,4, 1); 0.10::coor(3,3, 1); 0.10::coor(1,3, 1); 0.0000001::coor(3,1, 1) :- coor(2,3, 0), right.
0.7999999::coor(2,3, 1); 0.10::coor(1,3, 1); 0.10::coor(3,3, 1); 0.0000001::coor(3,1, 1) :- coor(2,3, 0), left.
0.7999999::coor(3,3, 1); 0.10::coor(2,3, 1); 0.10::coor(2,4, 1); 0.0000001::coor(3,1, 1) :- coor(2,3, 0), up.
0.7999999::coor(1,3, 1); 0.10::coor(2,4, 1); 0.10::coor(2,3, 1); 0.0000001::coor(3,1, 1) :- coor(2,3, 0), down.
1.00::coor(2,3, 1) :- coor(2,3, 0), stay.

% --- DESDE coor(3,1) --- [huracán → coor(1,4)] (coor(3,1) es rama regular)
0.7999999::coor(3,2, 1); 0.10::coor(3,1, 1); 0.10::coor(2,1, 1); 0.0000001::coor(1,4, 1) :- coor(3,1, 0), right.
0.7999999::coor(3,1, 1); 0.10::coor(2,1, 1); 0.10::coor(3,1, 1); 0.0000001::coor(1,4, 1) :- coor(3,1, 0), left.
0.7999999::coor(3,1, 1); 0.10::coor(3,1, 1); 0.10::coor(3,2, 1); 0.0000001::coor(1,4, 1) :- coor(3,1, 0), up.
0.7999999::coor(2,1, 1); 0.10::coor(3,2, 1); 0.10::coor(3,1, 1); 0.0000001::coor(1,4, 1) :- coor(3,1, 0), down.
1.00::coor(3,1, 1) :- coor(3,1, 0), stay.

% --- DESDE coor(3,2) --- [huracán → coor(1,4)] (coor(3,1) es rama regular en left/up/down)
0.7999999::coor(3,3, 1); 0.10::coor(3,2, 1); 0.10::coor(3,2, 1); 0.0000001::coor(1,4, 1) :- coor(3,2, 0), right.
0.7999999::coor(3,1, 1); 0.10::coor(3,2, 1); 0.10::coor(3,2, 1); 0.0000001::coor(1,4, 1) :- coor(3,2, 0), left.
0.7999999::coor(3,2, 1); 0.10::coor(3,1, 1); 0.10::coor(3,3, 1); 0.0000001::coor(1,4, 1) :- coor(3,2, 0), up.
0.7999999::coor(3,2, 1); 0.10::coor(3,3, 1); 0.10::coor(3,1, 1); 0.0000001::coor(1,4, 1) :- coor(3,2, 0), down.
1.00::coor(3,2, 1) :- coor(3,2, 0), stay.

% --- DESDE coor(3,3) --- [huracán → coor(3,1)]
0.7999999::coor(3,4, 1); 0.10::coor(3,3, 1); 0.10::coor(2,3, 1); 0.0000001::coor(3,1, 1) :- coor(3,3, 0), right.
0.7999999::coor(3,2, 1); 0.10::coor(2,3, 1); 0.10::coor(3,3, 1); 0.0000001::coor(3,1, 1) :- coor(3,3, 0), left.
0.7999999::coor(3,3, 1); 0.10::coor(3,2, 1); 0.10::coor(3,4, 1); 0.0000001::coor(3,1, 1) :- coor(3,3, 0), up.
0.7999999::coor(2,3, 1); 0.10::coor(3,4, 1); 0.10::coor(3,2, 1); 0.0000001::coor(3,1, 1) :- coor(3,3, 0), down.
1.00::coor(3,3, 1) :- coor(3,3, 0), stay.

% ==========================================================
% ESTADOS ABSORBENTES (SINK STATES)
% ==========================================================
1.00::coor(X, Y, 1) :- coor(X, Y, 0), terminal.
1.00::coor(X, Y, 1) :- coor(X, Y, 0), obstacle.
