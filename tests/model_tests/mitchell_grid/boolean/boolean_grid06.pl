% GRID boolean base test case 06
% N FLUENTES DE ESTADO:  7
% N DE ESTADOS:  128
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 2240

% State fluents 
state_fluent(b1).
state_fluent(b2).
state_fluent(b3).
state_fluent(b4).
state_fluent(b5).
state_fluent(b6).
state_fluent(b7).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- b1(1), b2(1), b3(1), b4(1), not(b5(1)), not(b6(1)), not(b7(1)), not(terminal).
terminal :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)).

%Transitions

%P(X | coor(1,1), a). -> (0 0 0 0 0 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,2), a). -> (1 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
% left -> coor(1,1) [0 0 0 0 0 0 0]: No requiere reglas
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,3), a). -> (0 1 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,4), a). -> (1 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,5), a). -> (0 0 1 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,6), a). -> (1 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,7), a). -> (0 1 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,8), a). -> (1 1 1 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,9), a). -> (0 0 0 1 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,10), a). -> (1 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,11), a). -> (0 1 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,12), a). -> (1 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,13), a). -> (0 0 1 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,14), a). -> (1 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(1,15), a). -> (0 1 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,1), a). -> (0 0 0 0 1 0 0)
% up -> coor(1,1) [0 0 0 0 0 0 0]: No requiere reglas
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,2), a). -> (1 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,3), a). -> (0 1 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,4), a). -> (1 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,5), a). -> (0 0 1 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,6), a). -> (1 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,7), a). -> (0 1 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,8), a). -> (1 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,9), a). -> (0 0 0 1 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,10), a). -> (1 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,11), a). -> (0 1 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,12), a). -> (1 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,13), a). -> (0 0 1 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,14), a). -> (1 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,15), a). -> (0 1 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.

%P(X | coor(2,16), a). -> (1 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), left.

%P(X | coor(3,1), a). -> (0 0 0 0 0 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,2), a). -> (1 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,3), a). -> (0 1 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,4), a). -> (1 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,5), a). -> (0 0 1 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,6), a). -> (1 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,7), a). -> (0 1 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,8), a). -> (1 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,9), a). -> (0 0 0 1 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,10), a). -> (1 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,11), a). -> (0 1 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,12), a). -> (1 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,13), a). -> (0 0 1 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,14), a). -> (1 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,15), a). -> (0 1 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.

%P(X | coor(3,16), a). -> (1 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), left.

%P(X | coor(4,1), a). -> (0 0 0 0 1 1 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,2), a). -> (1 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,3), a). -> (0 1 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,4), a). -> (1 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,5), a). -> (0 0 1 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,6), a). -> (1 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,7), a). -> (0 1 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,8), a). -> (1 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,9), a). -> (0 0 0 1 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,10), a). -> (1 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,11), a). -> (0 1 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,12), a). -> (1 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,13), a). -> (0 0 1 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,14), a). -> (1 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,15), a). -> (0 1 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.

%P(X | coor(4,16), a). -> (1 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), left.

%P(X | coor(5,1), a). -> (0 0 0 0 0 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,2), a). -> (1 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,3), a). -> (0 1 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,4), a). -> (1 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,5), a). -> (0 0 1 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,6), a). -> (1 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,7), a). -> (0 1 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,8), a). -> (1 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,9), a). -> (0 0 0 1 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,10), a). -> (1 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,11), a). -> (0 1 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,12), a). -> (1 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,13), a). -> (0 0 1 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,14), a). -> (1 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,15), a). -> (0 1 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.

%P(X | coor(5,16), a). -> (1 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), left.

%P(X | coor(6,1), a). -> (0 0 0 0 1 0 1)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,2), a). -> (1 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,3), a). -> (0 1 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,4), a). -> (1 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,5), a). -> (0 0 1 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,6), a). -> (1 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,7), a). -> (0 1 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,8), a). -> (1 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,9), a). -> (0 0 0 1 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,10), a). -> (1 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,11), a). -> (0 1 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,12), a). -> (1 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,13), a). -> (0 0 1 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,14), a). -> (1 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,15), a). -> (0 1 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.

%P(X | coor(6,16), a). -> (1 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), left.

%P(X | coor(7,1), a). -> (0 0 0 0 0 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,2), a). -> (1 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,3), a). -> (0 1 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,4), a). -> (1 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,5), a). -> (0 0 1 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,6), a). -> (1 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,7), a). -> (0 1 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,8), a). -> (1 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,9), a). -> (0 0 0 1 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,10), a). -> (1 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,11), a). -> (0 1 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,12), a). -> (1 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,13), a). -> (0 0 1 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,14), a). -> (1 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,15), a). -> (0 1 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.

%P(X | coor(7,16), a). -> (1 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), left.

%P(X | coor(8,1), a). -> (0 0 0 0 1 1 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,2), a). -> (1 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,3), a). -> (0 1 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,4), a). -> (1 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,5), a). -> (0 0 1 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,6), a). -> (1 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,7), a). -> (0 1 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,8), a). -> (1 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), right.

%P(X | coor(8,9), a). -> (0 0 0 1 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,10), a). -> (1 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,11), a). -> (0 1 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,12), a). -> (1 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,13), a). -> (0 0 1 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,14), a). -> (1 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,15), a). -> (0 1 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.

%P(X | coor(8,16), a). -> (1 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), left.

% Transiciones de inercia

% coor(1,1) -> (0 0 0 0 0 0 0)
% up -> coor(1,1) [0 0 0 0 0 0 0]: No requiere reglas
% left -> coor(1,1) [0 0 0 0 0 0 0]: No requiere reglas
% stay -> coor(1,1) [0 0 0 0 0 0 0]: No requiere reglas

% coor(1,2) -> (1 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,3) -> (0 1 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,4) -> (1 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,5) -> (0 0 1 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,6) -> (1 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,7) -> (0 1 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,8) -> (1 1 1 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,9) -> (0 0 0 1 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,10) -> (1 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,11) -> (0 1 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,12) -> (1 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,13) -> (0 0 1 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,14) -> (1 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,15) -> (0 1 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(1,16) -> (1 1 1 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), left.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), stay.

% coor(2,1) -> (0 0 0 0 1 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,2) -> (1 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,3) -> (0 1 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,4) -> (1 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,5) -> (0 0 1 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,6) -> (1 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,7) -> (0 1 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,8) -> (1 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,9) -> (0 0 0 1 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,10) -> (1 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,11) -> (0 1 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,12) -> (1 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,13) -> (0 0 1 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,14) -> (1 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,15) -> (0 1 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(2,16) -> (1 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), stay.

% coor(3,1) -> (0 0 0 0 0 1 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,2) -> (1 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,3) -> (0 1 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,4) -> (1 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,5) -> (0 0 1 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,6) -> (1 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,7) -> (0 1 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,8) -> (1 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,9) -> (0 0 0 1 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,10) -> (1 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,11) -> (0 1 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,12) -> (1 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,13) -> (0 0 1 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,14) -> (1 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,15) -> (0 1 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(3,16) -> (1 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), stay.

% coor(4,1) -> (0 0 0 0 1 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,2) -> (1 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,3) -> (0 1 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,4) -> (1 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,5) -> (0 0 1 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,6) -> (1 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,7) -> (0 1 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,8) -> (1 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), stay.

% coor(4,9) -> (0 0 0 1 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,10) -> (1 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,11) -> (0 1 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,12) -> (1 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,13) -> (0 0 1 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,14) -> (1 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,15) -> (0 1 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(4,16) -> (1 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), stay.

% coor(5,1) -> (0 0 0 0 0 0 1)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,2) -> (1 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,3) -> (0 1 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,4) -> (1 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,5) -> (0 0 1 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,6) -> (1 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,7) -> (0 1 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,8) -> (1 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,9) -> (0 0 0 1 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,10) -> (1 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,11) -> (0 1 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,12) -> (1 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,13) -> (0 0 1 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,14) -> (1 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,15) -> (0 1 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(5,16) -> (1 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), stay.

% coor(6,1) -> (0 0 0 0 1 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,2) -> (1 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,3) -> (0 1 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,4) -> (1 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,5) -> (0 0 1 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,6) -> (1 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,7) -> (0 1 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,8) -> (1 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), stay.

% coor(6,9) -> (0 0 0 1 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,10) -> (1 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,11) -> (0 1 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,12) -> (1 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,13) -> (0 0 1 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,14) -> (1 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,15) -> (0 1 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(6,16) -> (1 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), stay.

% coor(7,1) -> (0 0 0 0 0 1 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,2) -> (1 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,3) -> (0 1 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,4) -> (1 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,5) -> (0 0 1 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,6) -> (1 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,7) -> (0 1 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,8) -> (1 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), stay.

% coor(7,9) -> (0 0 0 1 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,10) -> (1 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,11) -> (0 1 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,12) -> (1 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,13) -> (0 0 1 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,14) -> (1 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,15) -> (0 1 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(7,16) -> (1 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), stay.

% coor(8,1) -> (0 0 0 0 1 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,2) -> (1 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,3) -> (0 1 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,4) -> (1 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,5) -> (0 0 1 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,6) -> (1 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,7) -> (0 1 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,8) -> (1 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), stay.

% coor(8,9) -> (0 0 0 1 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,10) -> (1 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,11) -> (0 1 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,12) -> (1 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,13) -> (0 0 1 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,14) -> (1 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,15) -> (0 1 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.

% coor(8,16) -> (1 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), stay.

%Codificacion de estados 

% b1 b2 b3 b4 b5 b6 b7  Coordenada
% 0  0  0  0  0  0  0   coor(1,1)
% 1  0  0  0  0  0  0   coor(1,2)
% 0  1  0  0  0  0  0   coor(1,3)
% 1  1  0  0  0  0  0   coor(1,4)
% 0  0  1  0  0  0  0   coor(1,5)
% 1  0  1  0  0  0  0   coor(1,6)
% 0  1  1  0  0  0  0   coor(1,7)
% 1  1  1  0  0  0  0   coor(1,8)
% 0  0  0  1  0  0  0   coor(1,9)
% 1  0  0  1  0  0  0   coor(1,10)
% 0  1  0  1  0  0  0   coor(1,11)
% 1  1  0  1  0  0  0   coor(1,12)
% 0  0  1  1  0  0  0   coor(1,13)
% 1  0  1  1  0  0  0   coor(1,14)
% 0  1  1  1  0  0  0   coor(1,15)
% 1  1  1  1  0  0  0   coor(1,16)

% 0  0  0  0  1  0  0   coor(2,1)
% 1  0  0  0  1  0  0   coor(2,2)
% 0  1  0  0  1  0  0   coor(2,3)
% 1  1  0  0  1  0  0   coor(2,4)
% 0  0  1  0  1  0  0   coor(2,5)
% 1  0  1  0  1  0  0   coor(2,6)
% 0  1  1  0  1  0  0   coor(2,7)
% 1  1  1  0  1  0  0   coor(2,8)
% 0  0  0  1  1  0  0   coor(2,9)
% 1  0  0  1  1  0  0   coor(2,10)
% 0  1  0  1  1  0  0   coor(2,11)
% 1  1  0  1  1  0  0   coor(2,12)
% 0  0  1  1  1  0  0   coor(2,13)
% 1  0  1  1  1  0  0   coor(2,14)
% 0  1  1  1  1  0  0   coor(2,15)
% 1  1  1  1  1  0  0   coor(2,16)

% 0  0  0  0  0  1  0   coor(3,1)
% 1  0  0  0  0  1  0   coor(3,2)
% 0  1  0  0  0  1  0   coor(3,3)
% 1  1  0  0  0  1  0   coor(3,4)
% 0  0  1  0  0  1  0   coor(3,5)
% 1  0  1  0  0  1  0   coor(3,6)
% 0  1  1  0  0  1  0   coor(3,7)
% 1  1  1  0  0  1  0   coor(3,8)
% 0  0  0  1  0  1  0   coor(3,9)
% 1  0  0  1  0  1  0   coor(3,10)
% 0  1  0  1  0  1  0   coor(3,11)
% 1  1  0  1  0  1  0   coor(3,12)
% 0  0  1  1  0  1  0   coor(3,13)
% 1  0  1  1  0  1  0   coor(3,14)
% 0  1  1  1  0  1  0   coor(3,15)
% 1  1  1  1  0  1  0   coor(3,16)

% 0  0  0  0  1  1  0   coor(4,1)
% 1  0  0  0  1  1  0   coor(4,2)
% 0  1  0  0  1  1  0   coor(4,3)
% 1  1  0  0  1  1  0   coor(4,4)
% 0  0  1  0  1  1  0   coor(4,5)
% 1  0  1  0  1  1  0   coor(4,6)
% 0  1  1  0  1  1  0   coor(4,7)
% 1  1  1  0  1  1  0   coor(4,8)
% 0  0  0  1  1  1  0   coor(4,9)
% 1  0  0  1  1  1  0   coor(4,10)
% 0  1  0  1  1  1  0   coor(4,11)
% 1  1  0  1  1  1  0   coor(4,12)
% 0  0  1  1  1  1  0   coor(4,13)
% 1  0  1  1  1  1  0   coor(4,14)
% 0  1  1  1  1  1  0   coor(4,15)
% 1  1  1  1  1  1  0   coor(4,16)

% 0  0  0  0  0  0  1   coor(5,1)
% 1  0  0  0  0  0  1   coor(5,2)
% 0  1  0  0  0  0  1   coor(5,3)
% 1  1  0  0  0  0  1   coor(5,4)
% 0  0  1  0  0  0  1   coor(5,5)
% 1  0  1  0  0  0  1   coor(5,6)
% 0  1  1  0  0  0  1   coor(5,7)
% 1  1  1  0  0  0  1   coor(5,8)
% 0  0  0  1  0  0  1   coor(5,9)
% 1  0  0  1  0  0  1   coor(5,10)
% 0  1  0  1  0  0  1   coor(5,11)
% 1  1  0  1  0  0  1   coor(5,12)
% 0  0  1  1  0  0  1   coor(5,13)
% 1  0  1  1  0  0  1   coor(5,14)
% 0  1  1  1  0  0  1   coor(5,15)
% 1  1  1  1  0  0  1   coor(5,16)

% 0  0  0  0  1  0  1   coor(6,1)
% 1  0  0  0  1  0  1   coor(6,2)
% 0  1  0  0  1  0  1   coor(6,3)
% 1  1  0  0  1  0  1   coor(6,4)
% 0  0  1  0  1  0  1   coor(6,5)
% 1  0  1  0  1  0  1   coor(6,6)
% 0  1  1  0  1  0  1   coor(6,7)
% 1  1  1  0  1  0  1   coor(6,8)
% 0  0  0  1  1  0  1   coor(6,9)
% 1  0  0  1  1  0  1   coor(6,10)
% 0  1  0  1  1  0  1   coor(6,11)
% 1  1  0  1  1  0  1   coor(6,12)
% 0  0  1  1  1  0  1   coor(6,13)
% 1  0  1  1  1  0  1   coor(6,14)
% 0  1  1  1  1  0  1   coor(6,15)
% 1  1  1  1  1  0  1   coor(6,16)

% 0  0  0  0  0  1  1   coor(7,1)
% 1  0  0  0  0  1  1   coor(7,2)
% 0  1  0  0  0  1  1   coor(7,3)
% 1  1  0  0  0  1  1   coor(7,4)
% 0  0  1  0  0  1  1   coor(7,5)
% 1  0  1  0  0  1  1   coor(7,6)
% 0  1  1  0  0  1  1   coor(7,7)
% 1  1  1  0  0  1  1   coor(7,8)
% 0  0  0  1  0  1  1   coor(7,9)
% 1  0  0  1  0  1  1   coor(7,10)
% 0  1  0  1  0  1  1   coor(7,11)
% 1  1  0  1  0  1  1   coor(7,12)
% 0  0  1  1  0  1  1   coor(7,13)
% 1  0  1  1  0  1  1   coor(7,14)
% 0  1  1  1  0  1  1   coor(7,15)
% 1  1  1  1  0  1  1   coor(7,16)

% 0  0  0  0  1  1  1   coor(8,1)
% 1  0  0  0  1  1  1   coor(8,2)
% 0  1  0  0  1  1  1   coor(8,3)
% 1  1  0  0  1  1  1   coor(8,4)
% 0  0  1  0  1  1  1   coor(8,5)
% 1  0  1  0  1  1  1   coor(8,6)
% 0  1  1  0  1  1  1   coor(8,7)
% 1  1  1  0  1  1  1   coor(8,8)
% 0  0  0  1  1  1  1   coor(8,9)
% 1  0  0  1  1  1  1   coor(8,10)
% 0  1  0  1  1  1  1   coor(8,11)
% 1  1  0  1  1  1  1   coor(8,12)
% 0  0  1  1  1  1  1   coor(8,13)
% 1  0  1  1  1  1  1   coor(8,14)
% 0  1  1  1  1  1  1   coor(8,15)
% 1  1  1  1  1  1  1   coor(8,16)