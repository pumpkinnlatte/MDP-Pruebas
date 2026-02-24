% State fluents (3 bits para codificar 6 celdas)
state_fluent(b1).
state_fluent(b2).
state_fluent(b3).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).
utility(stay, 0).

% Evitamos evaluar el estado bloqueado
blocked :- b1(0), b2(0), b3(0).

%reward model
goal :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).
goal :- not(b1(0)), b2(0), b3(0), up, not(blocked).


%Transitions

%P(X | coor(1,1), a).
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), right, not(blocked).                 %coor(1,1) to coor(1,2)

1.0::b3(1) :- b1(0), not(b2(0)), not(b3(0)), down, not(blocked).                   %coor(1,1) to coor(2,1)

%P(X | coor(1,2), a).
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), left, not(blocked).        %coor(1,2) to coor(1,1)

1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), right, not(blocked).        %coor(1,2) to coor(1,3)

1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), down, not(blocked).
1.0::b3(1) :- not(b1(0)), b2(0), not(b3(0)), down, not(blocked).         %coor(1,2) to coor(2,2)

%P(X | coor(1,3), a).
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), stay, not(blocked).              %ESTADO FINAL/META
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), stay, not(blocked).             %ESTADO FINAL/META

%P(X | coor(2,1), a).
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), right, not(blocked).         
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), right, not(blocked).       %coor(2,1) to coor(2,2) 
 
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), up, not(blocked).          %coor(2,1) to coor(1,1) 

%P(X | coor(2,2), a).
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), up, not(blocked).              %coor(2,2) to coor(1,2)

1.0::b3(1) :- b1(0), not(b2(0)), b3(0), left, not(blocked).             %coor(2,2) to coor(2,1)

1.0::b2(1) :- b1(0), not(b2(0)), b3(0), right, not(blocked).
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), right, not(blocked).             %coor(2,2) to coor(2,3)

%P(X | coor(2,3), a).
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), left, not(blocked).
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), left, not(blocked).             %coor(2,3) to coor(2,2)

1.0::b1(1) :- not(b1(0)), b2(0), b3(0), up, not(blocked).        
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), up, not(blocked).              %coor(2,3) to coor(1,3)

% not(b1), not(b2), not(b3).

% b1, not(b2), not(b3).
% not(b1), b2, not(b3).
% b1, b2, not(b3).
% not(b1), not(b2), b3.
% b1, not(b2), b3.
% not(b1), b2, b3.

% b1, b2, b3.

%Codificacion de estados 

% b1  b2  b3    Estado / Coordenada
% 0   0   0     invalido
% 1   0   0     coor(1,1)
% 0   1   0     coor(1,2) 
% 1   1   0     coor(1,3)
% 0   0   1     coor(2,1)
% 1   0   1     coor(2,2)
% 0   1   1     coor(2,3) 
% 1   1   1     invalido