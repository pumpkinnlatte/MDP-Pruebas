% GRID boolean base test case 01
% N FLUENTES DE ESTADO:  2
% N DE ESTADOS:  4
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 20

% State fluents 
state_fluent(b1).
state_fluent(b2).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- b1(1), not(b2(1)), not(terminal).

terminal :- b1(0), not(b2(0)).

%Transitions

%P(X | coor(1,1), a).
1.0::b1(1) :- not(b1(0)), not(b2(0)), right.   %coor(1,1) to coor(1,2)
1.0::b2(1) :- not(b1(0)), not(b2(0)), down.    %coor(1,1) to coor(2,1)

%P(X | coor(1,2), a).
1.0::b1(1) :- b1(0), not(b2(0)), stay.         %ESTADO FINAL/META

%P(X | coor(2,1), a).
1.0::b1(1) :- not(b1(0)), b2(0), right.       
1.0::b2(1) :- not(b1(0)), b2(0), right.        %coor(2,1) to coor(2,2)

                                               %coor(2,1) to coor(1,1) no hay transicion directa   

%P(X | coor(2,2), a).
1.0::b2(1) :- b1(0), b2(0), left.               %coor(2,2) to coor(2,1)  
1.0::b1(1) :- b1(0), b2(0), up.                 %coor(2,2) to coor(1,2)  

% Transiciones de inercia 

% coor(1,2)
1.0::b1(1) :- b1(0), not(b2(0)), left.
1.0::b1(1) :- b1(0), not(b2(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), down.
1.0::b1(1) :- b1(0), not(b2(0)), right.

% coor(2,1)
1.0::b2(1) :- not(b1(0)), b2(0), left.
1.0::b2(1) :- not(b1(0)), b2(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), stay.

% coor(2,2)
1.0::b1(1) :- b1(0), b2(0), down.
1.0::b2(1) :- b1(0), b2(0), down.

1.0::b1(1) :- b1(0), b2(0), right.
1.0::b2(1) :- b1(0), b2(0), right.

1.0::b1(1) :- b1(0), b2(0), stay.
1.0::b2(1) :- b1(0), b2(0), stay.

%Codificacion de estados 

% b1 b2
% 0  0  coor(1,1)
% 1  0  coor(1,2)
% 0  1  coor(2,1)
% 1  1  coor(2,2)
