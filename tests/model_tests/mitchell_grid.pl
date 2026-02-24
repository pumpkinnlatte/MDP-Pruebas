%state fluents
state_fluent(pos(coor(X,Y)), ads) :- row(X), col(Y).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- pos((coor(1,2)), 0), right.
goal :- pos((coor(2,3)), 0), up.

%Transitions

% pos((coor(1,1)))
1.00::pos((coor(1,2)),1):- pos((coor(1,1)), 0), right.
1.00::pos((coor(2,1)),1):- pos((coor(1,1)), 0), down.

% pos((coor(1,2)))
1.00::pos((coor(1,3)),1):- pos((coor(1,2)), 0), right.
1.00::pos((coor(1,1)),1):- pos((coor(1,2)), 0), left.
1.00::pos((coor(2,2)),1):- pos((coor(1,2)), 0), down.

% pos((coor(1,3)))
1.00::pos((coor(1,3)),1):- pos((coor(1,3)), 0), stay.

% pos((coor(2,1)))
1.00::pos((coor(1,1)),1):- pos((coor(2,1)), 0), up.
1.00::pos((coor(2,2)),1):- pos((coor(2,1)), 0), right.

% pos((coor(2,2)))
1.00::pos((coor(1,2)),1):- pos((coor(2,2)), 0), up.
1.00::pos((coor(2,1)),1):- pos((coor(2,2)), 0), left.
1.00::pos((coor(2,3)),1):- pos((coor(2,2)), 0), right.

% pos((coor(2,3)))
1.00::pos((coor(1,3)),1):- pos((coor(2,3)), 0), up.
1.00::pos((coor(2,2)),1):- pos((coor(2,3)), 0), left.

%Background knowledge
row(1).
row(2).

col(1).
col(2).
col(3).