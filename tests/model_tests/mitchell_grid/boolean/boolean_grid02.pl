% GRID boolean base test case 02
% N FLUENTES DE ESTADO:  3
% N DE ESTADOS:  8
% N DE ACCIONES: 5
% N REGLAS DE TRANSICION: 60

% state fluents 
state_fluent(b3).
state_fluent(b2).
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
goal :- b1(1), b2(1), not(b3(1)), not(terminal).

terminal :- b1(0), b2(0), not(b3(0)).

% Transiciones

%P(X | coor(1,1), a). -> (0 0 0)
1.0::b1(1) :- not(b1(0)), not(b2(0)), not(b3(0)), right.   % -> coor(1,2) [1 0 0]
1.0::b3(1) :- not(b1(0)), not(b2(0)), not(b3(0)), down.    % -> coor(2,1) [0 0 1]

%P(X | coor(1,2), a). -> (1 0 0)
% left -> coor(1,1) [0 0 0]: No requiere reglas 
1.0::b2(1) :- b1(0), not(b2(0)), not(b3(0)), right.        % -> coor(1,3) [0 1 0]
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), down.         % -> coor(2,2) [1 0 1]
1.0::b3(1) :- b1(0), not(b2(0)), not(b3(0)), down.         

%P(X | coor(1,3), a). -> (0 1 0)
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), left.         % -> coor(1,2) [1 0 0]
1.0::b1(1) :- not(b1(0)), b2(0), not(b3(0)), right.        % -> coor(1,4) [1 1 0]
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), right.        
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), down.         % -> coor(2,3) [0 1 1]
1.0::b3(1) :- not(b1(0)), b2(0), not(b3(0)), down.         

%P(X | coor(1,4), a). -> (1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), stay.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), stay.             % -> ESTADO FINAL/META           

%P(X | coor(2,1), a). -> (0 0 1)
% up -> coor(1,1) [0 0 0]: No requiere reglas 
1.0::b1(1) :- not(b1(0)), not(b2(0)), b3(0), right.        % -> coor(2,2) [1 0 1]
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), right.        

%P(X | coor(2,2), a). -> (1 0 1)
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), left.              % -> coor(2,1) [0 0 1]
1.0::b2(1) :- b1(0), not(b2(0)), b3(0), right.             % -> coor(2,3) [0 1 1]
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), right.             
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), up.                % -> coor(1,2) [1 0 0]

%P(X | coor(2,3), a). -> (0 1 1)
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), left.              % -> coor(2,2) [1 0 1]
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), left.              
1.0::b1(1) :- not(b1(0)), b2(0), b3(0), right.             % -> coor(2,4) [1 1 1]
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), right.             
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), right.             
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), up.                % -> coor(1,3) [0 1 0]

%P(X | coor(2,4), a). -> (1 1 1)
1.0::b2(1) :- b1(0), b2(0), b3(0), left.                   % -> coor(2,3) [0 1 1]
1.0::b3(1) :- b1(0), b2(0), b3(0), left.                   
1.0::b1(1) :- b1(0), b2(0), b3(0), up.                     % -> coor(1,4) [1 1 0]
1.0::b2(1) :- b1(0), b2(0), b3(0), up.                     

% Transiciones de inercia 

% coor(1,1) -> (0 0 0) 
% Al rebotar (left, up, stay) va a (0 0 0): No requiere reglas 

% coor(1,2) -> (1 0 0)
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), up.
1.0::b1(1) :- b1(0), not(b2(0)), not(b3(0)), stay.

% coor(1,3) -> (0 1 0)
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), up.
1.0::b2(1) :- not(b1(0)), b2(0), not(b3(0)), stay.

% coor(1,4) -> (1 1 0)
1.0::b1(1) :- b1(0), b2(0), not(b3(0)), left.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), left.

1.0::b1(1) :- b1(0), b2(0), not(b3(0)), right.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), right.

1.0::b1(1) :- b1(0), b2(0), not(b3(0)), up.
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), up.

1.0::b1(1) :- b1(0), b2(0), not(b3(0)), down.             
1.0::b2(1) :- b1(0), b2(0), not(b3(0)), down.              

% coor(2,1) -> (0 0 1)
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), left.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), down.
1.0::b3(1) :- not(b1(0)), not(b2(0)), b3(0), stay.

% coor(2,2) -> (1 0 1)
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), down.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), down.
1.0::b1(1) :- b1(0), not(b2(0)), b3(0), stay.
1.0::b3(1) :- b1(0), not(b2(0)), b3(0), stay.

% coor(2,3) -> (0 1 1)
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), down.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), down.
1.0::b2(1) :- not(b1(0)), b2(0), b3(0), stay.
1.0::b3(1) :- not(b1(0)), b2(0), b3(0), stay.

% coor(2,4) -> (1 1 1)
1.0::b1(1) :- b1(0), b2(0), b3(0), right.
1.0::b2(1) :- b1(0), b2(0), b3(0), right.
1.0::b3(1) :- b1(0), b2(0), b3(0), right.
1.0::b1(1) :- b1(0), b2(0), b3(0), down.
1.0::b2(1) :- b1(0), b2(0), b3(0), down.
1.0::b3(1) :- b1(0), b2(0), b3(0), down.
1.0::b1(1) :- b1(0), b2(0), b3(0), stay.
1.0::b2(1) :- b1(0), b2(0), b3(0), stay.
1.0::b3(1) :- b1(0), b2(0), b3(0), stay.

%Codificacion de estados 

% b1 b2 b3
% 0  0  0  coor(1,1)
% 1  0  0  coor(1,2)
% 0  1  0  coor(1,3)
% 1  1  0  coor(1,4)

% 0  0  1  coor(2,1)
% 1  0  1  coor(2,2)
% 0  1  1  coor(2,3)
% 1  1  1  coor(2,4)