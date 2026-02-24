state_fluent(pos(X), ads) :- grid(X).

%actions
action(up).
action(down).
action(left).
action(right).
action(stay).

%utilities
utility(goal, 1).
utility(cost, -1).

%reward model
goal :- pos(d, 0), stay.
cost :- pos(g, 0), right.
cost :- pos(l, 0), up.
cost :- pos(d, 0), down.

% Para evitar partir de un estado bloqueado
blocked :- pos(a, 0).
blocked :- pos(o, 0).

%Transitions
%to state a
0.99::pos(a,1); 0.01::pos(b,1) :- pos(b, 0), left, not(blocked). %b
0.99::pos(a,1); 0.01::pos(e,1) :- pos(e, 0), up, not(blocked). %e

%to state b
0.99::pos(b,1); 0.01::pos(a,1) :- pos(a, 0), right, not(blocked). %a
0.99::pos(b,1); 0.01::pos(c,1) :- pos(c, 0), left, not(blocked). %c
0.99::pos(b,1); 0.01::pos(d,1) :- pos(d, 0), up, not(blocked). %d

%to state c

0.99::pos(c,1); 0.01::pos(b,1) :- pos(b, 0), right, not(blocked). %b
0.99::pos(c,1); 0.01::pos(d,1) :- pos(d, 0), left, not(blocked). %d
0.99::pos(c,1); 0.01::pos(g,1) :- pos(g, 0), up, not(blocked). %g

%to state d
0.99::pos(d,1); 0.01::pos(c,1) :- pos(c, 0), right, not(blocked). %c
0.99::pos(d,1); 0.01::pos(h,1) :- pos(h, 0), up, not(blocked). %h

%to state e

0.99::pos(e,1); 0.01::pos(a,1) :- pos(a, 0), down, not(blocked). %a
0.99::pos(e,1); 0.01::pos(f,1) :- pos(f, 0), left, not(blocked). %f
0.99::pos(e,1); 0.01::pos(i,1) :- pos(i, 0), up, not(blocked). %i

%to state f

0.99::pos(f,1); 0.01::pos(b,1) :- pos(b, 0), down, not(blocked). %b
0.99::pos(f,1); 0.01::pos(e,1) :- pos(e, 0), right, not(blocked). %e
0.99::pos(f,1); 0.01::pos(g,1) :- pos(g, 0), left, not(blocked). %g
0.99::pos(f,1); 0.01::pos(j,1) :- pos(j, 0), up, not(blocked). %j

%to state g

0.99::pos(g,1); 0.01::pos(c,1) :- pos(c, 0), down, not(blocked). %c
0.99::pos(g,1); 0.01::pos(f,1) :- pos(f, 0), right, not(blocked). %f
0.99::pos(g,1); 0.01::pos(h,1) :- pos(h, 0), left, not(blocked). %h
0.99::pos(g,1); 0.01::pos(k,1) :- pos(k, 0), up, not(blocked). %k

%to state h

0.99::pos(h,1); 0.01::pos(d,1) :- pos(d, 0), down, not(blocked). %d
0.99::pos(h,1); 0.01::pos(g,1) :- pos(g, 0), right, not(blocked). %g
0.99::pos(h,1); 0.01::pos(l,1) :- pos(l, 0), up, not(blocked).    %l

%to state i

0.99::pos(i,1); 0.01::pos(e,1) :- pos(e, 0), down, not(blocked). %e
0.99::pos(i,1); 0.01::pos(j,1) :- pos(j, 0), left, not(blocked). %j
0.99::pos(i,1); 0.01::pos(m,1) :- pos(m, 0), up, not(blocked).   %m

%to state j

0.99::pos(j,1); 0.01::pos(f,1) :- pos(f, 0), down, not(blocked). %f
0.99::pos(j,1); 0.01::pos(i,1) :- pos(i, 0), right, not(blocked). %i
0.99::pos(j,1); 0.01::pos(n,1) :- pos(n, 0), up, not(blocked).   %n
0.99::pos(j,1); 0.01::pos(k,1) :- pos(k, 0), left, not(blocked). %k

%to state k

0.99::pos(k,1); 0.01::pos(g,1) :- pos(g, 0), down, not(blocked). %g
0.99::pos(k,1); 0.01::pos(j,1) :- pos(j, 0), right, not(blocked). %j
0.99::pos(k,1); 0.01::pos(o,1) :- pos(o, 0), up, not(blocked).   %o
0.99::pos(k,1); 0.01::pos(l,1) :- pos(l, 0), left, not(blocked). %l

%to state l

0.99::pos(l,1); 0.01::pos(h,1) :- pos(h, 0), down, not(blocked). %h
0.99::pos(l,1); 0.01::pos(k,1) :- pos(k, 0), right, not(blocked). %k
0.99::pos(l,1); 0.01::pos(p,1) :- pos(p, 0), up, not(blocked).   %p

%to state m
0.99::pos(m,1); 0.01::pos(i,1) :- pos(i, 0), down, not(blocked). %i
0.99::pos(m,1); 0.01::pos(n,1) :- pos(n, 0), left, not(blocked). %n

%to state n

0.99::pos(n,1); 0.01::pos(j,1) :- pos(j, 0), down, not(blocked). %j
0.99::pos(n,1); 0.01::pos(m,1) :- pos(m, 0), right, not(blocked). %m
0.99::pos(n,1); 0.01::pos(o,1) :- pos(o, 0), left, not(blocked). %o

%to state o

0.99::pos(o,1); 0.01::pos(k,1) :- pos(k, 0), down, not(blocked). %k
0.99::pos(o,1); 0.01::pos(n,1) :- pos(n, 0), right, not(blocked). %n
0.99::pos(o,1); 0.01::pos(p,1) :- pos(p, 0), left, not(blocked).   %p

%to state p

0.99::pos(p,1); 0.01::pos(l,1) :- pos(l, 0), down, not(blocked).   %l
0.99::pos(p,1); 0.01::pos(o,1) :- pos(o, 0), right, not(blocked). %o

%Background knowledge
grid(a).
grid(b).
grid(c).
grid(d).

grid(e).
grid(f).
grid(g).
grid(h).

grid(i).
grid(j).
grid(k).
grid(l).

grid(m).
grid(n).
grid(o).
grid(p).



