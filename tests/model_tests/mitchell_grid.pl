%state fluents
state_fluent(pos(X), ads) :- grid(X).

%actions
action(left).
action(right).
action(up).
action(down).
action(stay).

%utilities
utility(goal, 100).

%reward model
goal :- pos(b, 0), right.
goal :- pos(f, 0), up.

%Transitions

% pos(a)
1.00::pos(b,1):- pos(a, 0), right.
1.00::pos(d,1):- pos(a, 0), down.

% pos(b)
1.00::pos(c,1):- pos(b, 0), right.
1.00::pos(a,1):- pos(b, 0), left.
1.00::pos(e,1):- pos(b, 0), down.

% pos(c)
1.00::pos(c,1):- pos(c, 0), stay.

% pos(d)
1.00::pos(a,1):- pos(d, 0), up.
1.00::pos(e,1):- pos(d, 0), right.

% pos(e)
1.00::pos(b,1):- pos(e, 0), up.
1.00::pos(d,1):- pos(e, 0), left.
1.00::pos(f,1):- pos(e, 0), right.

% pos(f)
1.00::pos(c,1):- pos(f, 0), up.
1.00::pos(e,1):- pos(f, 0), left.

%Background knowledge
grid(a).
grid(b).
grid(c).
grid(d).
grid(e).
grid(f).