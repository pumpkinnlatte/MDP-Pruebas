%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).

%state fluents
state_fluent(x(X), multivalued) :- row(X).
state_fluent(y(Y), multivalued) :- col(Y).

%actions
action(left).
action(right). 
action(up). 
action(down). 
action(stay).

% utilities
utility(goal, 100).

% reward model
goal :- x(1, 0), y(2, 0), right.
goal :- x(2, 0), y(3, 0), up.

% transitons primera fila 
% state (1, 1)
1.0::x(1, 1):- x(1, 0), y(1, 0), left. % x
1.0::y(1, 1):- x(1, 0), y(1, 0), left. % y

1.0::x(1, 1):- x(1, 0), y(1, 0), right.
1.0::y(2, 1):- x(1, 0), y(1, 0), right.

1.0::x(1, 1):- x(1, 0), y(1, 0), up.   
1.0::y(1, 1):- x(1, 0), y(1, 0), up.   

1.0::x(2, 1):- x(1, 0), y(1, 0), down.                             
1.0::y(1, 1):- x(1, 0), y(1, 0), down.           

1.0::x(1, 1):- x(1, 0), y(1, 0), stay. 
1.0::y(1, 1):- x(1, 0), y(1, 0), stay. 

% state (1, 2) 
1.0::x(1, 1):- x(1, 0), y(2, 0), left. % x
1.0::y(1, 1):- x(1, 0), y(2, 0), left. % y

1.0::x(1, 1):- x(1, 0), y(2, 0), right.
1.0::y(3, 1):- x(1, 0), y(2, 0), right.

1.0::x(1, 1):- x(1, 0), y(2, 0), up.
1.0::y(2, 1):- x(1, 0), y(2, 0), up.

1.0::x(2, 1):- x(1, 0), y(2, 0), down.
1.0::y(2, 1):- x(1, 0), y(2, 0), down.

1.0::x(1, 1):- x(1, 0), y(2, 0), stay. 
1.0::y(1, 1):- x(1, 0), y(2, 0), stay.

% state (1, 3) - goal state
1.0::x(1, 1):- x(1, 0), y(3, 0), stay. 
1.0::y(3, 1):- x(1, 0), y(3, 0), stay. 

% transitons segunda fila 
% state (2, 1) 
1.0::x(2, 1):- x(2, 0), y(1, 0), left. % x
1.0::y(1, 1):- x(2, 0), y(1, 0), left. % y 

1.0::x(2, 1):- x(2, 0), y(1, 0), right.
1.0::y(2, 1):- x(2, 0), y(1, 0), right.

1.0::x(1, 1):- x(2, 0), y(1, 0), up.
1.0::y(1, 1):- x(2, 0), y(1, 0), up.

1.0::x(2, 1):- x(2, 0), y(1, 0), down.
1.0::y(1, 1):- x(2, 0), y(1, 0), down.

1.0::x(2, 1):- x(2, 0), y(1, 0), stay.
1.0::y(1, 1):- x(2, 0), y(1, 0), stay.

%state (2, 2)
1.0::x(2, 1):- x(2, 0), y(2, 0), left. % x
1.0::y(1, 1):- x(2, 0), y(2, 0), left. % y

1.0::x(2, 1):- x(2, 0), y(2, 0), right.
1.0::y(3, 1):- x(2, 0), y(2, 0), right.

1.0::x(1, 1):- x(2, 0), y(2, 0), up.
1.0::y(2, 1):- x(2, 0), y(2, 0), up.

1.0::x(2, 1):- x(2, 0), y(2, 0), down.
1.0::y(2, 1):- x(2, 0), y(2, 0), down.

1.0::x(2, 1):- x(2, 0), y(2, 0), stay.
1.0::y(2, 1):- x(2, 0), y(2, 0), stay.

%state (2, 3)
1.0::x(2, 1):- x(2, 0), y(3, 0), left. % x
1.0::y(2, 1):- x(2, 0), y(3, 0), left. % y

1.0::x(2, 1):- x(2, 0), y(3, 0), right.
1.0::y(3, 1):- x(2, 0), y(3, 0), right.

1.0::x(1, 1):- x(2, 0), y(3, 0), up.
1.0::y(3, 1):- x(2, 0), y(3, 0), up.

1.0::x(2, 1):- x(2, 0), y(3, 0), down.
1.0::y(3, 1):- x(2, 0), y(3, 0), down.

1.0::x(2, 1):- x(2, 0), y(3, 0), stay.
1.0::y(3, 1):- x(2, 0), y(3, 0), stay.