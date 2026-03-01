%state fluents
state_fluent(coor(X,Y), enum) :- row(X), col(Y).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- not(coor(1,3, 0)), coor(1,3, 1).

%Transitions
%P(X | coor(1,1), a).
1.00::coor(1,2, 1):- coor(1,1, 0), right.
1.00::coor(2,1, 1):- coor(1,1, 0), down.

%P(X | coor(1,2), a).
1.00::coor(1,3, 1):- coor(1,2, 0), right.
1.00::coor(1,1, 1):- coor(1,2, 0), left.
1.00::coor(2,2, 1):- coor(1,2, 0), down.

%P(X | coor(1,3), a).
1.00::coor(1,3, 1):- coor(1,3, 0), stay.
1.00::coor(1,3, 1):- coor(1,3, 0), left.
1.00::coor(1,3, 1):- coor(1,3, 0), right.
1.00::coor(1,3, 1):- coor(1,3, 0), up.
1.00::coor(1,3, 1):- coor(1,3, 0), down.
 
%P(X | coor(2,1), a).
1.00::coor(1,1, 1):- coor(2,1, 0), up.
1.00::coor(2,2, 1):- coor(2,1, 0), right.

%P(X | coor(2,2), a).
1.00::coor(1,2, 1):- coor(2,2, 0), up.
1.00::coor(2,1, 1):- coor(2,2, 0), left.
1.00::coor(2,3, 1):- coor(2,2, 0), right.

%P(X | coor(2,3), a).

1.00::coor(1,3, 1):- coor(2,3, 0), up.
1.00::coor(2,2, 1):- coor(2,3, 0), left.

%Background knowledge
row(1).
row(2).

1/3::col(1);
1/3::col(2);
1/3::col(3). 