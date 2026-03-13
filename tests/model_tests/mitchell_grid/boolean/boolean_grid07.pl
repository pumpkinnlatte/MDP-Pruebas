% GRID boolean base test case 07
% N FLUENTES DE ESTADO:  8
% N DE ESTADOS:  256
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 5120

% State fluents 
state_fluent(b1).
state_fluent(b2).
state_fluent(b3).
state_fluent(b4).
state_fluent(b5).
state_fluent(b6).
state_fluent(b7).
state_fluent(b8).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).


%reward model
goal :- b1(1), b2(1), b3(1), b4(1), not(b5(1)), not(b6(1)), not(b7(1)), not(b8(1)), not(terminal).
terminal :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)).

%Transitions

%P(X | coor(1,1), a). -> (0 0 0 0 0 0 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,2), a). -> (1 0 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
% left -> coor(1,1) [0 0 0 0 0 0 0 0]: No requiere reglas
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,3), a). -> (0 1 0 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,4), a). -> (1 1 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,5), a). -> (0 0 1 0 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,6), a). -> (1 0 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,7), a). -> (0 1 1 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,8), a). -> (1 1 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,9), a). -> (0 0 0 1 0 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,10), a). -> (1 0 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,11), a). -> (0 1 0 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,12), a). -> (1 1 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,13), a). -> (0 0 1 1 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,14), a). -> (1 0 1 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(1,15), a). -> (0 1 1 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,1), a). -> (0 0 0 0 1 0 0 0)
% up -> coor(1,1) [0 0 0 0 0 0 0 0]: No requiere reglas
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,2), a). -> (1 0 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,3), a). -> (0 1 0 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,4), a). -> (1 1 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,5), a). -> (0 0 1 0 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,6), a). -> (1 0 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,7), a). -> (0 1 1 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,8), a). -> (1 1 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,9), a). -> (0 0 0 1 1 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,10), a). -> (1 0 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,11), a). -> (0 1 0 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,12), a). -> (1 1 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,13), a). -> (0 0 1 1 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,14), a). -> (1 0 1 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,15), a). -> (0 1 1 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.

%P(X | coor(2,16), a). -> (1 1 1 1 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.

%P(X | coor(3,1), a). -> (0 0 0 0 0 1 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,2), a). -> (1 0 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,3), a). -> (0 1 0 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,4), a). -> (1 1 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,5), a). -> (0 0 1 0 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,6), a). -> (1 0 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,7), a). -> (0 1 1 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,8), a). -> (1 1 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,9), a). -> (0 0 0 1 0 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,10), a). -> (1 0 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,11), a). -> (0 1 0 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,12), a). -> (1 1 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,13), a). -> (0 0 1 1 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,14), a). -> (1 0 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,15), a). -> (0 1 1 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(3,16), a). -> (1 1 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.

%P(X | coor(4,1), a). -> (0 0 0 0 1 1 0 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,2), a). -> (1 0 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,3), a). -> (0 1 0 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,4), a). -> (1 1 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,5), a). -> (0 0 1 0 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,6), a). -> (1 0 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,7), a). -> (0 1 1 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,8), a). -> (1 1 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,9), a). -> (0 0 0 1 1 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,10), a). -> (1 0 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,11), a). -> (0 1 0 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,12), a). -> (1 1 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,13), a). -> (0 0 1 1 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,14), a). -> (1 0 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,15), a). -> (0 1 1 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.

%P(X | coor(4,16), a). -> (1 1 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), left.

%P(X | coor(5,1), a). -> (0 0 0 0 0 0 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,2), a). -> (1 0 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,3), a). -> (0 1 0 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,4), a). -> (1 1 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,5), a). -> (0 0 1 0 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,6), a). -> (1 0 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,7), a). -> (0 1 1 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,8), a). -> (1 1 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,9), a). -> (0 0 0 1 0 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,10), a). -> (1 0 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,11), a). -> (0 1 0 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,12), a). -> (1 1 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,13), a). -> (0 0 1 1 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,14), a). -> (1 0 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,15), a). -> (0 1 1 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(5,16), a). -> (1 1 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.

%P(X | coor(6,1), a). -> (0 0 0 0 1 0 1 0)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,2), a). -> (1 0 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,3), a). -> (0 1 0 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,4), a). -> (1 1 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,5), a). -> (0 0 1 0 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,6), a). -> (1 0 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,7), a). -> (0 1 1 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,8), a). -> (1 1 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,9), a). -> (0 0 0 1 1 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,10), a). -> (1 0 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,11), a). -> (0 1 0 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,12), a). -> (1 1 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,13), a). -> (0 0 1 1 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,14), a). -> (1 0 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,15), a). -> (0 1 1 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.

%P(X | coor(6,16), a). -> (1 1 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), left.

%P(X | coor(7,1), a). -> (0 0 0 0 0 1 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,2), a). -> (1 0 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,3), a). -> (0 1 0 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,4), a). -> (1 1 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,5), a). -> (0 0 1 0 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,6), a). -> (1 0 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,7), a). -> (0 1 1 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,8), a). -> (1 1 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,9), a). -> (0 0 0 1 0 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,10), a). -> (1 0 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,11), a). -> (0 1 0 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,12), a). -> (1 1 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,13), a). -> (0 0 1 1 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,14), a). -> (1 0 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,15), a). -> (0 1 1 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(7,16), a). -> (1 1 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), left.

%P(X | coor(8,1), a). -> (0 0 0 0 1 1 1 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,2), a). -> (1 0 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,3), a). -> (0 1 0 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,4), a). -> (1 1 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,5), a). -> (0 0 1 0 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,6), a). -> (1 0 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,7), a). -> (0 1 1 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,8), a). -> (1 1 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,9), a). -> (0 0 0 1 1 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,10), a). -> (1 0 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,11), a). -> (0 1 0 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,12), a). -> (1 1 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,13), a). -> (0 0 1 1 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,14), a). -> (1 0 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,15), a). -> (0 1 1 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.

%P(X | coor(8,16), a). -> (1 1 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), left.

%P(X | coor(9,1), a). -> (0 0 0 0 0 0 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,2), a). -> (1 0 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,3), a). -> (0 1 0 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,4), a). -> (1 1 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,5), a). -> (0 0 1 0 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,6), a). -> (1 0 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,7), a). -> (0 1 1 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,8), a). -> (1 1 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,9), a). -> (0 0 0 1 0 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,10), a). -> (1 0 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,11), a). -> (0 1 0 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,12), a). -> (1 1 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,13), a). -> (0 0 1 1 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,14), a). -> (1 0 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,15), a). -> (0 1 1 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(9,16), a). -> (1 1 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.

%P(X | coor(10,1), a). -> (0 0 0 0 1 0 0 1)
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,2), a). -> (1 0 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,3), a). -> (0 1 0 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,4), a). -> (1 1 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,5), a). -> (0 0 1 0 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,6), a). -> (1 0 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,7), a). -> (0 1 1 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,8), a). -> (1 1 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,9), a). -> (0 0 0 1 1 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,10), a). -> (1 0 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,11), a). -> (0 1 0 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,12), a). -> (1 1 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,13), a). -> (0 0 1 1 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,14), a). -> (1 0 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,15), a). -> (0 1 1 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.

%P(X | coor(10,16), a). -> (1 1 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), left.

%P(X | coor(11,1), a). -> (0 0 0 0 0 1 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,2), a). -> (1 0 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,3), a). -> (0 1 0 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,4), a). -> (1 1 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,5), a). -> (0 0 1 0 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,6), a). -> (1 0 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,7), a). -> (0 1 1 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,8), a). -> (1 1 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,9), a). -> (0 0 0 1 0 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,10), a). -> (1 0 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,11), a). -> (0 1 0 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,12), a). -> (1 1 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,13), a). -> (0 0 1 1 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,14), a). -> (1 0 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,15), a). -> (0 1 1 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(11,16), a). -> (1 1 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), left.

%P(X | coor(12,1), a). -> (0 0 0 0 1 1 0 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,2), a). -> (1 0 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,3), a). -> (0 1 0 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,4), a). -> (1 1 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,5), a). -> (0 0 1 0 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,6), a). -> (1 0 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,7), a). -> (0 1 1 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,8), a). -> (1 1 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,9), a). -> (0 0 0 1 1 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,10), a). -> (1 0 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,11), a). -> (0 1 0 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,12), a). -> (1 1 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,13), a). -> (0 0 1 1 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,14), a). -> (1 0 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,15), a). -> (0 1 1 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.

%P(X | coor(12,16), a). -> (1 1 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), left.

%P(X | coor(13,1), a). -> (0 0 0 0 0 0 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,2), a). -> (1 0 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,3), a). -> (0 1 0 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,4), a). -> (1 1 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,5), a). -> (0 0 1 0 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,6), a). -> (1 0 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,7), a). -> (0 1 1 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,8), a). -> (1 1 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,9), a). -> (0 0 0 1 0 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,10), a). -> (1 0 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,11), a). -> (0 1 0 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,12), a). -> (1 1 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,13), a). -> (0 0 1 1 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,14), a). -> (1 0 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,15), a). -> (0 1 1 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(13,16), a). -> (1 1 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), left.

%P(X | coor(14,1), a). -> (0 0 0 0 1 0 1 1)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,2), a). -> (1 0 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,3), a). -> (0 1 0 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,4), a). -> (1 1 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,5), a). -> (0 0 1 0 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,6), a). -> (1 0 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,7), a). -> (0 1 1 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,8), a). -> (1 1 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,9), a). -> (0 0 0 1 1 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,10), a). -> (1 0 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,11), a). -> (0 1 0 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,12), a). -> (1 1 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,13), a). -> (0 0 1 1 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,14), a). -> (1 0 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,15), a). -> (0 1 1 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.

%P(X | coor(14,16), a). -> (1 1 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), left.

%P(X | coor(15,1), a). -> (0 0 0 0 0 1 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,2), a). -> (1 0 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,3), a). -> (0 1 0 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,4), a). -> (1 1 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,5), a). -> (0 0 1 0 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,6), a). -> (1 0 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,7), a). -> (0 1 1 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,8), a). -> (1 1 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,9), a). -> (0 0 0 1 0 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,10), a). -> (1 0 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,11), a). -> (0 1 0 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,12), a). -> (1 1 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,13), a). -> (0 0 1 1 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,14), a). -> (1 0 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,15), a). -> (0 1 1 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.

%P(X | coor(15,16), a). -> (1 1 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), left.

%P(X | coor(16,1), a). -> (0 0 0 0 1 1 1 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,2), a). -> (1 0 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,3), a). -> (0 1 0 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,4), a). -> (1 1 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,5), a). -> (0 0 1 0 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,6), a). -> (1 0 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,7), a). -> (0 1 1 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,8), a). -> (1 1 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,9), a). -> (0 0 0 1 1 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,10), a). -> (1 0 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,11), a). -> (0 1 0 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,12), a). -> (1 1 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,13), a). -> (0 0 1 1 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,14), a). -> (1 0 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,15), a). -> (0 1 1 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.

%P(X | coor(16,16), a). -> (1 1 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), left.

% Transiciones de inercia

% coor(1,1) -> (0 0 0 0 0 0 0 0)
% up -> coor(1,1) [0 0 0 0 0 0 0 0]: No requiere reglas
% left -> coor(1,1) [0 0 0 0 0 0 0 0]: No requiere reglas
% stay -> coor(1,1) [0 0 0 0 0 0 0 0]: No requiere reglas

% coor(1,2) -> (1 0 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,3) -> (0 1 0 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,4) -> (1 1 0 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,5) -> (0 0 1 0 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,6) -> (1 0 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,7) -> (0 1 1 0 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,8) -> (1 1 1 0 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,9) -> (0 0 0 1 0 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,10) -> (1 0 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,11) -> (0 1 0 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,12) -> (1 1 0 1 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,13) -> (0 0 1 1 0 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,14) -> (1 0 1 1 0 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,15) -> (0 1 1 1 0 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(1,16) -> (1 1 1 1 0 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), up.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,1) -> (0 0 0 0 1 0 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,2) -> (1 0 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,3) -> (0 1 0 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,4) -> (1 1 0 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,5) -> (0 0 1 0 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,6) -> (1 0 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,7) -> (0 1 1 0 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,8) -> (1 1 1 0 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,9) -> (0 0 0 1 1 0 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,10) -> (1 0 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,11) -> (0 1 0 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,12) -> (1 1 0 1 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,13) -> (0 0 1 1 1 0 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,14) -> (1 0 1 1 1 0 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,15) -> (0 1 1 1 1 0 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(2,16) -> (1 1 1 1 1 0 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), not(b8(0)), stay.

% coor(3,1) -> (0 0 0 0 0 1 0 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,2) -> (1 0 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,3) -> (0 1 0 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,4) -> (1 1 0 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,5) -> (0 0 1 0 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,6) -> (1 0 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,7) -> (0 1 1 0 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,8) -> (1 1 1 0 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,9) -> (0 0 0 1 0 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,10) -> (1 0 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,11) -> (0 1 0 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,12) -> (1 1 0 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,13) -> (0 0 1 1 0 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,14) -> (1 0 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,15) -> (0 1 1 1 0 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(3,16) -> (1 1 1 1 0 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,1) -> (0 0 0 0 1 1 0 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,2) -> (1 0 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,3) -> (0 1 0 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,4) -> (1 1 0 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,5) -> (0 0 1 0 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,6) -> (1 0 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,7) -> (0 1 1 0 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,8) -> (1 1 1 0 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,9) -> (0 0 0 1 1 1 0 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,10) -> (1 0 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,11) -> (0 1 0 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,12) -> (1 1 0 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,13) -> (0 0 1 1 1 1 0 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,14) -> (1 0 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,15) -> (0 1 1 1 1 1 0 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(4,16) -> (1 1 1 1 1 1 0 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), not(b8(0)), stay.

% coor(5,1) -> (0 0 0 0 0 0 1 0)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,2) -> (1 0 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,3) -> (0 1 0 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,4) -> (1 1 0 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,5) -> (0 0 1 0 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,6) -> (1 0 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,7) -> (0 1 1 0 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,8) -> (1 1 1 0 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,9) -> (0 0 0 1 0 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,10) -> (1 0 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,11) -> (0 1 0 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,12) -> (1 1 0 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,13) -> (0 0 1 1 0 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,14) -> (1 0 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,15) -> (0 1 1 1 0 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(5,16) -> (1 1 1 1 0 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,1) -> (0 0 0 0 1 0 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,2) -> (1 0 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,3) -> (0 1 0 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,4) -> (1 1 0 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,5) -> (0 0 1 0 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,6) -> (1 0 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,7) -> (0 1 1 0 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,8) -> (1 1 1 0 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,9) -> (0 0 0 1 1 0 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,10) -> (1 0 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,11) -> (0 1 0 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,12) -> (1 1 0 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,13) -> (0 0 1 1 1 0 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,14) -> (1 0 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,15) -> (0 1 1 1 1 0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(6,16) -> (1 1 1 1 1 0 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), not(b8(0)), stay.

% coor(7,1) -> (0 0 0 0 0 1 1 0)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,2) -> (1 0 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,3) -> (0 1 0 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,4) -> (1 1 0 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,5) -> (0 0 1 0 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,6) -> (1 0 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,7) -> (0 1 1 0 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,8) -> (1 1 1 0 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,9) -> (0 0 0 1 0 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,10) -> (1 0 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,11) -> (0 1 0 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,12) -> (1 1 0 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,13) -> (0 0 1 1 0 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,14) -> (1 0 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,15) -> (0 1 1 1 0 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(7,16) -> (1 1 1 1 0 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), not(b8(0)), stay.

% coor(8,1) -> (0 0 0 0 1 1 1 0)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,2) -> (1 0 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,3) -> (0 1 0 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,4) -> (1 1 0 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,5) -> (0 0 1 0 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,6) -> (1 0 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,7) -> (0 1 1 0 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,8) -> (1 1 1 0 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,9) -> (0 0 0 1 1 1 1 0)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,10) -> (1 0 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,11) -> (0 1 0 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,12) -> (1 1 0 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,13) -> (0 0 1 1 1 1 1 0)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,14) -> (1 0 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,15) -> (0 1 1 1 1 1 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(8,16) -> (1 1 1 1 1 1 1 0)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), not(b8(0)), stay.

% coor(9,1) -> (0 0 0 0 0 0 0 1)
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,2) -> (1 0 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,3) -> (0 1 0 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,4) -> (1 1 0 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,5) -> (0 0 1 0 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,6) -> (1 0 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,7) -> (0 1 1 0 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,8) -> (1 1 1 0 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,9) -> (0 0 0 1 0 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,10) -> (1 0 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,11) -> (0 1 0 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,12) -> (1 1 0 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,13) -> (0 0 1 1 0 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,14) -> (1 0 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,15) -> (0 1 1 1 0 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(9,16) -> (1 1 1 1 0 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,1) -> (0 0 0 0 1 0 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,2) -> (1 0 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,3) -> (0 1 0 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,4) -> (1 1 0 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,5) -> (0 0 1 0 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,6) -> (1 0 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,7) -> (0 1 1 0 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,8) -> (1 1 1 0 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,9) -> (0 0 0 1 1 0 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,10) -> (1 0 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,11) -> (0 1 0 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,12) -> (1 1 0 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,13) -> (0 0 1 1 1 0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,14) -> (1 0 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,15) -> (0 1 1 1 1 0 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(10,16) -> (1 1 1 1 1 0 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), not(b7(0)), b8(0), stay.

% coor(11,1) -> (0 0 0 0 0 1 0 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,2) -> (1 0 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,3) -> (0 1 0 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,4) -> (1 1 0 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,5) -> (0 0 1 0 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,6) -> (1 0 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,7) -> (0 1 1 0 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,8) -> (1 1 1 0 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,9) -> (0 0 0 1 0 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,10) -> (1 0 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,11) -> (0 1 0 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,12) -> (1 1 0 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,13) -> (0 0 1 1 0 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,14) -> (1 0 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,15) -> (0 1 1 1 0 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(11,16) -> (1 1 1 1 0 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), not(b7(0)), b8(0), stay.

% coor(12,1) -> (0 0 0 0 1 1 0 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,2) -> (1 0 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,3) -> (0 1 0 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,4) -> (1 1 0 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,5) -> (0 0 1 0 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,6) -> (1 0 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,7) -> (0 1 1 0 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,8) -> (1 1 1 0 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,9) -> (0 0 0 1 1 1 0 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,10) -> (1 0 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,11) -> (0 1 0 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,12) -> (1 1 0 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,13) -> (0 0 1 1 1 1 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,14) -> (1 0 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,15) -> (0 1 1 1 1 1 0 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(12,16) -> (1 1 1 1 1 1 0 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), not(b7(0)), b8(0), stay.

% coor(13,1) -> (0 0 0 0 0 0 1 1)
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,2) -> (1 0 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,3) -> (0 1 0 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,4) -> (1 1 0 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,5) -> (0 0 1 0 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,6) -> (1 0 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,7) -> (0 1 1 0 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,8) -> (1 1 1 0 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,9) -> (0 0 0 1 0 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,10) -> (1 0 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,11) -> (0 1 0 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,12) -> (1 1 0 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,13) -> (0 0 1 1 0 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,14) -> (1 0 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,15) -> (0 1 1 1 0 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(13,16) -> (1 1 1 1 0 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), not(b6(0)), b7(0), b8(0), stay.

% coor(14,1) -> (0 0 0 0 1 0 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,2) -> (1 0 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,3) -> (0 1 0 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,4) -> (1 1 0 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,5) -> (0 0 1 0 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,6) -> (1 0 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,7) -> (0 1 1 0 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,8) -> (1 1 1 0 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,9) -> (0 0 0 1 1 0 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,10) -> (1 0 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,11) -> (0 1 0 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,12) -> (1 1 0 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,13) -> (0 0 1 1 1 0 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,14) -> (1 0 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,15) -> (0 1 1 1 1 0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(14,16) -> (1 1 1 1 1 0 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), not(b6(0)), b7(0), b8(0), stay.

% coor(15,1) -> (0 0 0 0 0 1 1 1)
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,2) -> (1 0 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,3) -> (0 1 0 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,4) -> (1 1 0 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,5) -> (0 0 1 0 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,6) -> (1 0 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,7) -> (0 1 1 0 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,8) -> (1 1 1 0 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,9) -> (0 0 0 1 0 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,10) -> (1 0 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,11) -> (0 1 0 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,12) -> (1 1 0 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,13) -> (0 0 1 1 0 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,14) -> (1 0 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,15) -> (0 1 1 1 0 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(15,16) -> (1 1 1 1 0 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), not(b5(0)), b6(0), b7(0), b8(0), stay.

% coor(16,1) -> (0 0 0 0 1 1 1 1)
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), left.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,2) -> (1 0 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,3) -> (0 1 0 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,4) -> (1 1 0 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,5) -> (0 0 1 0 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,6) -> (1 0 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,7) -> (0 1 1 0 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,8) -> (1 1 1 0 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), not(b4(0)), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,9) -> (0 0 0 1 1 1 1 1)
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,10) -> (1 0 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,11) -> (0 1 0 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,12) -> (1 1 0 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), not(b3(0)), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,13) -> (0 0 1 1 1 1 1 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,14) -> (1 0 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), not(b2(0)), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,15) -> (0 1 1 1 1 1 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- not(b1(0)), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

% coor(16,16) -> (1 1 1 1 1 1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b4(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b5(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b6(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b7(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.
1.0::b8(1) :- b1(0), b2(0), b3(0), b4(0), b5(0), b6(0), b7(0), b8(0), stay.

%Codificacion de estados 

% b1 b2 b3 b4 b5 b6 b7 b8  Coordenada
% 0  0  0  0  0  0  0  0   coor(1,1)
% 1  0  0  0  0  0  0  0   coor(1,2)
% 0  1  0  0  0  0  0  0   coor(1,3)
% 1  1  0  0  0  0  0  0   coor(1,4)
% 0  0  1  0  0  0  0  0   coor(1,5)
% 1  0  1  0  0  0  0  0   coor(1,6)
% 0  1  1  0  0  0  0  0   coor(1,7)
% 1  1  1  0  0  0  0  0   coor(1,8)
% 0  0  0  1  0  0  0  0   coor(1,9)
% 1  0  0  1  0  0  0  0   coor(1,10)
% 0  1  0  1  0  0  0  0   coor(1,11)
% 1  1  0  1  0  0  0  0   coor(1,12)
% 0  0  1  1  0  0  0  0   coor(1,13)
% 1  0  1  1  0  0  0  0   coor(1,14)
% 0  1  1  1  0  0  0  0   coor(1,15)
% 1  1  1  1  0  0  0  0   coor(1,16)

% 0  0  0  0  1  0  0  0   coor(2,1)
% 1  0  0  0  1  0  0  0   coor(2,2)
% 0  1  0  0  1  0  0  0   coor(2,3)
% 1  1  0  0  1  0  0  0   coor(2,4)
% 0  0  1  0  1  0  0  0   coor(2,5)
% 1  0  1  0  1  0  0  0   coor(2,6)
% 0  1  1  0  1  0  0  0   coor(2,7)
% 1  1  1  0  1  0  0  0   coor(2,8)
% 0  0  0  1  1  0  0  0   coor(2,9)
% 1  0  0  1  1  0  0  0   coor(2,10)
% 0  1  0  1  1  0  0  0   coor(2,11)
% 1  1  0  1  1  0  0  0   coor(2,12)
% 0  0  1  1  1  0  0  0   coor(2,13)
% 1  0  1  1  1  0  0  0   coor(2,14)
% 0  1  1  1  1  0  0  0   coor(2,15)
% 1  1  1  1  1  0  0  0   coor(2,16)

% 0  0  0  0  0  1  0  0   coor(3,1)
% 1  0  0  0  0  1  0  0   coor(3,2)
% 0  1  0  0  0  1  0  0   coor(3,3)
% 1  1  0  0  0  1  0  0   coor(3,4)
% 0  0  1  0  0  1  0  0   coor(3,5)
% 1  0  1  0  0  1  0  0   coor(3,6)
% 0  1  1  0  0  1  0  0   coor(3,7)
% 1  1  1  0  0  1  0  0   coor(3,8)
% 0  0  0  1  0  1  0  0   coor(3,9)
% 1  0  0  1  0  1  0  0   coor(3,10)
% 0  1  0  1  0  1  0  0   coor(3,11)
% 1  1  0  1  0  1  0  0   coor(3,12)
% 0  0  1  1  0  1  0  0   coor(3,13)
% 1  0  1  1  0  1  0  0   coor(3,14)
% 0  1  1  1  0  1  0  0   coor(3,15)
% 1  1  1  1  0  1  0  0   coor(3,16)

% 0  0  0  0  1  1  0  0   coor(4,1)
% 1  0  0  0  1  1  0  0   coor(4,2)
% 0  1  0  0  1  1  0  0   coor(4,3)
% 1  1  0  0  1  1  0  0   coor(4,4)
% 0  0  1  0  1  1  0  0   coor(4,5)
% 1  0  1  0  1  1  0  0   coor(4,6)
% 0  1  1  0  1  1  0  0   coor(4,7)
% 1  1  1  0  1  1  0  0   coor(4,8)
% 0  0  0  1  1  1  0  0   coor(4,9)
% 1  0  0  1  1  1  0  0   coor(4,10)
% 0  1  0  1  1  1  0  0   coor(4,11)
% 1  1  0  1  1  1  0  0   coor(4,12)
% 0  0  1  1  1  1  0  0   coor(4,13)
% 1  0  1  1  1  1  0  0   coor(4,14)
% 0  1  1  1  1  1  0  0   coor(4,15)
% 1  1  1  1  1  1  0  0   coor(4,16)

% 0  0  0  0  0  0  1  0   coor(5,1)
% 1  0  0  0  0  0  1  0   coor(5,2)
% 0  1  0  0  0  0  1  0   coor(5,3)
% 1  1  0  0  0  0  1  0   coor(5,4)
% 0  0  1  0  0  0  1  0   coor(5,5)
% 1  0  1  0  0  0  1  0   coor(5,6)
% 0  1  1  0  0  0  1  0   coor(5,7)
% 1  1  1  0  0  0  1  0   coor(5,8)
% 0  0  0  1  0  0  1  0   coor(5,9)
% 1  0  0  1  0  0  1  0   coor(5,10)
% 0  1  0  1  0  0  1  0   coor(5,11)
% 1  1  0  1  0  0  1  0   coor(5,12)
% 0  0  1  1  0  0  1  0   coor(5,13)
% 1  0  1  1  0  0  1  0   coor(5,14)
% 0  1  1  1  0  0  1  0   coor(5,15)
% 1  1  1  1  0  0  1  0   coor(5,16)

% 0  0  0  0  1  0  1  0   coor(6,1)
% 1  0  0  0  1  0  1  0   coor(6,2)
% 0  1  0  0  1  0  1  0   coor(6,3)
% 1  1  0  0  1  0  1  0   coor(6,4)
% 0  0  1  0  1  0  1  0   coor(6,5)
% 1  0  1  0  1  0  1  0   coor(6,6)
% 0  1  1  0  1  0  1  0   coor(6,7)
% 1  1  1  0  1  0  1  0   coor(6,8)
% 0  0  0  1  1  0  1  0   coor(6,9)
% 1  0  0  1  1  0  1  0   coor(6,10)
% 0  1  0  1  1  0  1  0   coor(6,11)
% 1  1  0  1  1  0  1  0   coor(6,12)
% 0  0  1  1  1  0  1  0   coor(6,13)
% 1  0  1  1  1  0  1  0   coor(6,14)
% 0  1  1  1  1  0  1  0   coor(6,15)
% 1  1  1  1  1  0  1  0   coor(6,16)

% 0  0  0  0  0  1  1  0   coor(7,1)
% 1  0  0  0  0  1  1  0   coor(7,2)
% 0  1  0  0  0  1  1  0   coor(7,3)
% 1  1  0  0  0  1  1  0   coor(7,4)
% 0  0  1  0  0  1  1  0   coor(7,5)
% 1  0  1  0  0  1  1  0   coor(7,6)
% 0  1  1  0  0  1  1  0   coor(7,7)
% 1  1  1  0  0  1  1  0   coor(7,8)
% 0  0  0  1  0  1  1  0   coor(7,9)
% 1  0  0  1  0  1  1  0   coor(7,10)
% 0  1  0  1  0  1  1  0   coor(7,11)
% 1  1  0  1  0  1  1  0   coor(7,12)
% 0  0  1  1  0  1  1  0   coor(7,13)
% 1  0  1  1  0  1  1  0   coor(7,14)
% 0  1  1  1  0  1  1  0   coor(7,15)
% 1  1  1  1  0  1  1  0   coor(7,16)

% 0  0  0  0  1  1  1  0   coor(8,1)
% 1  0  0  0  1  1  1  0   coor(8,2)
% 0  1  0  0  1  1  1  0   coor(8,3)
% 1  1  0  0  1  1  1  0   coor(8,4)
% 0  0  1  0  1  1  1  0   coor(8,5)
% 1  0  1  0  1  1  1  0   coor(8,6)
% 0  1  1  0  1  1  1  0   coor(8,7)
% 1  1  1  0  1  1  1  0   coor(8,8)
% 0  0  0  1  1  1  1  0   coor(8,9)
% 1  0  0  1  1  1  1  0   coor(8,10)
% 0  1  0  1  1  1  1  0   coor(8,11)
% 1  1  0  1  1  1  1  0   coor(8,12)
% 0  0  1  1  1  1  1  0   coor(8,13)
% 1  0  1  1  1  1  1  0   coor(8,14)
% 0  1  1  1  1  1  1  0   coor(8,15)
% 1  1  1  1  1  1  1  0   coor(8,16)

% 0  0  0  0  0  0  0  1   coor(9,1)
% 1  0  0  0  0  0  0  1   coor(9,2)
% 0  1  0  0  0  0  0  1   coor(9,3)
% 1  1  0  0  0  0  0  1   coor(9,4)
% 0  0  1  0  0  0  0  1   coor(9,5)
% 1  0  1  0  0  0  0  1   coor(9,6)
% 0  1  1  0  0  0  0  1   coor(9,7)
% 1  1  1  0  0  0  0  1   coor(9,8)
% 0  0  0  1  0  0  0  1   coor(9,9)
% 1  0  0  1  0  0  0  1   coor(9,10)
% 0  1  0  1  0  0  0  1   coor(9,11)
% 1  1  0  1  0  0  0  1   coor(9,12)
% 0  0  1  1  0  0  0  1   coor(9,13)
% 1  0  1  1  0  0  0  1   coor(9,14)
% 0  1  1  1  0  0  0  1   coor(9,15)
% 1  1  1  1  0  0  0  1   coor(9,16)

% 0  0  0  0  1  0  0  1   coor(10,1)
% 1  0  0  0  1  0  0  1   coor(10,2)
% 0  1  0  0  1  0  0  1   coor(10,3)
% 1  1  0  0  1  0  0  1   coor(10,4)
% 0  0  1  0  1  0  0  1   coor(10,5)
% 1  0  1  0  1  0  0  1   coor(10,6)
% 0  1  1  0  1  0  0  1   coor(10,7)
% 1  1  1  0  1  0  0  1   coor(10,8)
% 0  0  0  1  1  0  0  1   coor(10,9)
% 1  0  0  1  1  0  0  1   coor(10,10)
% 0  1  0  1  1  0  0  1   coor(10,11)
% 1  1  0  1  1  0  0  1   coor(10,12)
% 0  0  1  1  1  0  0  1   coor(10,13)
% 1  0  1  1  1  0  0  1   coor(10,14)
% 0  1  1  1  1  0  0  1   coor(10,15)
% 1  1  1  1  1  0  0  1   coor(10,16)

% 0  0  0  0  0  1  0  1   coor(11,1)
% 1  0  0  0  0  1  0  1   coor(11,2)
% 0  1  0  0  0  1  0  1   coor(11,3)
% 1  1  0  0  0  1  0  1   coor(11,4)
% 0  0  1  0  0  1  0  1   coor(11,5)
% 1  0  1  0  0  1  0  1   coor(11,6)
% 0  1  1  0  0  1  0  1   coor(11,7)
% 1  1  1  0  0  1  0  1   coor(11,8)
% 0  0  0  1  0  1  0  1   coor(11,9)
% 1  0  0  1  0  1  0  1   coor(11,10)
% 0  1  0  1  0  1  0  1   coor(11,11)
% 1  1  0  1  0  1  0  1   coor(11,12)
% 0  0  1  1  0  1  0  1   coor(11,13)
% 1  0  1  1  0  1  0  1   coor(11,14)
% 0  1  1  1  0  1  0  1   coor(11,15)
% 1  1  1  1  0  1  0  1   coor(11,16)

% 0  0  0  0  1  1  0  1   coor(12,1)
% 1  0  0  0  1  1  0  1   coor(12,2)
% 0  1  0  0  1  1  0  1   coor(12,3)
% 1  1  0  0  1  1  0  1   coor(12,4)
% 0  0  1  0  1  1  0  1   coor(12,5)
% 1  0  1  0  1  1  0  1   coor(12,6)
% 0  1  1  0  1  1  0  1   coor(12,7)
% 1  1  1  0  1  1  0  1   coor(12,8)
% 0  0  0  1  1  1  0  1   coor(12,9)
% 1  0  0  1  1  1  0  1   coor(12,10)
% 0  1  0  1  1  1  0  1   coor(12,11)
% 1  1  0  1  1  1  0  1   coor(12,12)
% 0  0  1  1  1  1  0  1   coor(12,13)
% 1  0  1  1  1  1  0  1   coor(12,14)
% 0  1  1  1  1  1  0  1   coor(12,15)
% 1  1  1  1  1  1  0  1   coor(12,16)

% 0  0  0  0  0  0  1  1   coor(13,1)
% 1  0  0  0  0  0  1  1   coor(13,2)
% 0  1  0  0  0  0  1  1   coor(13,3)
% 1  1  0  0  0  0  1  1   coor(13,4)
% 0  0  1  0  0  0  1  1   coor(13,5)
% 1  0  1  0  0  0  1  1   coor(13,6)
% 0  1  1  0  0  0  1  1   coor(13,7)
% 1  1  1  0  0  0  1  1   coor(13,8)
% 0  0  0  1  0  0  1  1   coor(13,9)
% 1  0  0  1  0  0  1  1   coor(13,10)
% 0  1  0  1  0  0  1  1   coor(13,11)
% 1  1  0  1  0  0  1  1   coor(13,12)
% 0  0  1  1  0  0  1  1   coor(13,13)
% 1  0  1  1  0  0  1  1   coor(13,14)
% 0  1  1  1  0  0  1  1   coor(13,15)
% 1  1  1  1  0  0  1  1   coor(13,16)

% 0  0  0  0  1  0  1  1   coor(14,1)
% 1  0  0  0  1  0  1  1   coor(14,2)
% 0  1  0  0  1  0  1  1   coor(14,3)
% 1  1  0  0  1  0  1  1   coor(14,4)
% 0  0  1  0  1  0  1  1   coor(14,5)
% 1  0  1  0  1  0  1  1   coor(14,6)
% 0  1  1  0  1  0  1  1   coor(14,7)
% 1  1  1  0  1  0  1  1   coor(14,8)
% 0  0  0  1  1  0  1  1   coor(14,9)
% 1  0  0  1  1  0  1  1   coor(14,10)
% 0  1  0  1  1  0  1  1   coor(14,11)
% 1  1  0  1  1  0  1  1   coor(14,12)
% 0  0  1  1  1  0  1  1   coor(14,13)
% 1  0  1  1  1  0  1  1   coor(14,14)
% 0  1  1  1  1  0  1  1   coor(14,15)
% 1  1  1  1  1  0  1  1   coor(14,16)

% 0  0  0  0  0  1  1  1   coor(15,1)
% 1  0  0  0  0  1  1  1   coor(15,2)
% 0  1  0  0  0  1  1  1   coor(15,3)
% 1  1  0  0  0  1  1  1   coor(15,4)
% 0  0  1  0  0  1  1  1   coor(15,5)
% 1  0  1  0  0  1  1  1   coor(15,6)
% 0  1  1  0  0  1  1  1   coor(15,7)
% 1  1  1  0  0  1  1  1   coor(15,8)
% 0  0  0  1  0  1  1  1   coor(15,9)
% 1  0  0  1  0  1  1  1   coor(15,10)
% 0  1  0  1  0  1  1  1   coor(15,11)
% 1  1  0  1  0  1  1  1   coor(15,12)
% 0  0  1  1  0  1  1  1   coor(15,13)
% 1  0  1  1  0  1  1  1   coor(15,14)
% 0  1  1  1  0  1  1  1   coor(15,15)
% 1  1  1  1  0  1  1  1   coor(15,16)

% 0  0  0  0  1  1  1  1   coor(16,1)
% 1  0  0  0  1  1  1  1   coor(16,2)
% 0  1  0  0  1  1  1  1   coor(16,3)
% 1  1  0  0  1  1  1  1   coor(16,4)
% 0  0  1  0  1  1  1  1   coor(16,5)
% 1  0  1  0  1  1  1  1   coor(16,6)
% 0  1  1  0  1  1  1  1   coor(16,7)
% 1  1  1  0  1  1  1  1   coor(16,8)
% 0  0  0  1  1  1  1  1   coor(16,9)
% 1  0  0  1  1  1  1  1   coor(16,10)
% 0  1  0  1  1  1  1  1   coor(16,11)
% 1  1  0  1  1  1  1  1   coor(16,12)
% 0  0  1  1  1  1  1  1   coor(16,13)
% 1  0  1  1  1  1  1  1   coor(16,14)
% 0  1  1  1  1  1  1  1   coor(16,15)
% 1  1  1  1  1  1  1  1   coor(16,16)