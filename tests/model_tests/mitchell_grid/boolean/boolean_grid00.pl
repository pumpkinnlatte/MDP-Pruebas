% GRID boolean base test case 00

% N FLUENTES DE ESTADO:  1
% N DE ESTADOS:  2
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 6

% State fluents 
state_fluent(b1).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- b1(1), not(terminal).

terminal :- b1(0).

%Transitions

%P(X | coor(1,1), a).
1.0::b1(1) :- not(b1(0)), right.                  %coor(1,1) to coor(1,2)

%P(X | coor(1,2), a).
1.0::b1(1) :- b1(0), stay.              %ESTADO FINAL/META
1.0::b1(1) :- b1(0), left.

% Transiciones de inercia 

% coor(1,1): No requiere reglas de inercia

% coor(1,2)
1.0::b1(1) :- b1(0), up.
1.0::b1(1) :- b1(0), down.
1.0::b1(1) :- b1(0), right.

%Codificacion de estados 

% b1  
% 0  coor(1,1)
% 1  coor(1,2)
