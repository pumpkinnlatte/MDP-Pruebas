% GRID boolean base test case 03
% N FLUENTES DE ESTADO:  4
% N DE ESTADOS:  16
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 160

% State fluents 
state_fluent(b1).
state_fluent(b2).
state_fluent(b3).
state_fluent(b4).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- b1(1), b2(1), not(b3(1)), not(b4(1)), not(terminal).
terminal :- b1(0), b2(0), not(b3(0)), not(b4(0)).

%Transitions

%P(X | coor(1,1), a). -> (0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), right.

%P(X | coor(1,2), a). -> (1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), down.
% left -> coor(1,1) [0 0 0 0]: No requiere reglas
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), right.

%P(X | coor(1,3), a). -> (0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), right.

%P(X | coor(2,1), a). -> (0 0 1 0)
% up -> coor(1,1) [0 0 0 0]: No requiere reglas
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), right.

%P(X | coor(2,2), a). -> (1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), right.

%P(X | coor(2,3), a). -> (0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), right.

%P(X | coor(2,4), a). -> (1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), left.

%P(X | coor(3,1), a). -> (0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), right.

%P(X | coor(3,2), a). -> (1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), right.

%P(X | coor(3,3), a). -> (0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), right.

%P(X | coor(3,4), a). -> (1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), up.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), down.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), left.

%P(X | coor(4,1), a). -> (0 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), right.

%P(X | coor(4,2), a). -> (1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), right.

%P(X | coor(4,3), a). -> (0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), right.

%P(X | coor(4,4), a). -> (1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), left.

% Transiciones de inercia

% coor(1,1) -> (0 0 0 0)
% up -> coor(1,1) [0 0 0 0]: No requiere reglas
% left -> coor(1,1) [0 0 0 0]: No requiere reglas
% stay -> coor(1,1) [0 0 0 0]: No requiere reglas

% coor(1,2) -> (1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), stay.

% coor(1,3) -> (0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), stay.

% coor(1,4) -> (1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), down.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), left.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), left.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), right.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), right.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), stay.

% coor(2,1) -> (0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), stay.

% coor(2,2) -> (1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), stay.

% coor(2,3) -> (0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), stay.

% coor(2,4) -> (1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), stay.

% coor(3,1) -> (0 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), stay.

% coor(3,2) -> (1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), stay.

% coor(3,3) -> (0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), stay.

% coor(3,4) -> (1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), right.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), right.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), stay.

% coor(4,1) -> (0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), stay.

% coor(4,2) -> (1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), stay.

% coor(4,3) -> (0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), stay.

% coor(4,4) -> (1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), stay.


%Codificacion de estados 

% b1 b2 b3 b4
% 0  0  0  0  coor(1,1)
% 1  0  0  0  coor(1,2)
% 0  1  0  0  coor(1,3)
% 1  1  0  0  coor(1,4)

% 0  0  1  0  coor(2,1)
% 1  0  1  0  coor(2,2)
% 0  1  1  0  coor(2,3)
% 1  1  1  0  coor(2,4)

% 0  0  0  1  coor(3,1)
% 1  0  0  1  coor(3,2)
% 0  1  0  1  coor(3,3)
% 1  1  0  1  coor(3,4)

% 0  0  1  1  coor(4,1)
% 1  0  1  1  coor(4,2)
% 0  1  1  1  coor(4,3)
% 1  1  1  1  coor(4,4)