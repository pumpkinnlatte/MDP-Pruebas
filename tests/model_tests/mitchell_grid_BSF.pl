% State fluents (3 bits para codificar 6 celdas)
state_fluent(b1).
state_fluent(b2).
state_fluent(b3).

% Actions
action(left).
action(right).
action(up).
action(down).
action(stay).

% Utilities
utility(goal, 100).

% Evitamos evaluar el estado bloqueado
blocked :- b1(0), b2(0), b3(0).      % 111

% ---------------------------------------------------------
% Reward model
% ---------------------------------------------------------

goal :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).
goal :- b1(0), b2(0), not(b3(0)), up, not(blocked).

% ---------------------------------------------------------
% Transitions
% ---------------------------------------------------------

% Desde (1,1) -> 001
% Hacia (1,2) -> 010 (right) -> Enciende b2
1.00::b2(1) :- not(b1(0)), not(b2(0)), b3(0), right, not(blocked).

% Hacia (2,1) -> 100 (down) -> Enciende b1
1.00::b1(1) :- not(b1(0)), not(b2(0)), b3(0), down, not(blocked).

% Desde (1,2) -> 010
% Hacia (1,3) -> 011 (right) -> Enciende b2 y b3
1.00::b2(1) :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).
1.00::b3(1) :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).

% Hacia (1,1) -> 001 (left) -> Enciende b3
1.00::b3(1) :- not(b1(0)), b2(0), not(b3(0)), left, not(blocked).

% Hacia (2,2) -> 101 (down) -> Enciende b1 y b3
1.00::b1(1) :- not(b1(0)), b2(0), not(b3(0)), down, not(blocked).
1.00::b3(1) :- not(b1(0)), b2(0), not(b3(0)), down, not(blocked).

% Desde (1,3) -> 011
% Hacia (1,3) -> 011 (stay) -> Mantiene encendido b2 y b3
1.00::b2(1) :- not(b1(0)), b2(0), b3(0), stay, not(blocked).
1.00::b3(1) :- not(b1(0)), b2(0), b3(0), stay, not(blocked).

% Desde (2,1) -> 100
% Hacia (1,1) -> 001 (up) -> Enciende b3
1.00::b3(1) :- b1(0), not(b2(0)), not(b3(0)), up, not(blocked).

% Hacia (2,2) -> 101 (right) -> Enciende b1 y b3
1.00::b1(1) :- b1(0), not(b2(0)), not(b3(0)), right, not(blocked).
1.00::b3(1) :- b1(0), not(b2(0)), not(b3(0)), right, not(blocked).

% Desde (2,2) -> 101
% Hacia (1,2) -> 010 (up) -> Enciende b2
1.00::b2(1) :- b1(0), not(b2(0)), b3(0), up, not(blocked).

% Hacia (2,1) -> 100 (left) -> Enciende b1
1.00::b1(1) :- b1(0), not(b2(0)), b3(0), left, not(blocked).

% Hacia (2,3) -> 110 (right) -> Enciende b1 y b2
1.00::b1(1) :- b1(0), not(b2(0)), b3(0), right, not(blocked).
1.00::b2(1) :- b1(0), not(b2(0)), b3(0), right, not(blocked).

% Desde (2,3) -> 110
% Hacia (1,3) -> 011 (up) -> Enciende b2 y b3
1.00::b2(1) :- b1(0), b2(0), not(b3(0)), up, not(blocked).
1.00::b3(1) :- b1(0), b2(0), not(b3(0)), up, not(blocked).

% Hacia (2,2) -> 101 (left) -> Enciende b1 y b3
1.00::b1(1) :- b1(0), b2(0), not(b3(0)), left, not(blocked).
1.00::b3(1) :- b1(0), b2(0), not(b3(0)), left, not(blocked).

% b1  b2  b3    State / Coordinate
% 0   0   0     invalido
% 0   0   1     coor(1,1)
% 0   1   0     coor(1,2)
% 0   1   1     coor(1,3)
% 1   0   0     coor(2,1)
% 1   0   1     coor(2,2)
% 1   1   0     coor(2,3)
% 1   1   1     invalido