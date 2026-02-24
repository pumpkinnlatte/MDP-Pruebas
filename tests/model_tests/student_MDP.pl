% state fluents
state_fluent(s(X), ads) :- states(X).

%actions
action(study).
action(exercise).
action(sleep).
action(relax).
action(quit).
action(pub).

%utilities
utility(study_class1, -2).
utility(study_class2, -2).
utility(study_class3, 10).

utility(class3_pub, 1).
utility(class1_relax, -1).

utility(tv_relax, -1).

utility(class2_sleep, 0).

%reward model
study_class1 :- s(class, 0), study.
study_class2 :- s(football, 0), study.
study_class3 :- s(music, 0), study.

class1_relax :- s(class, 0), relax.
class2_sleep :- s(football, 0), sleep.
class3_pub :- s(music, 0), pub.

tv_relax :- s(tv, 0), relax.
tv_quit :- s(tv, 0), quit.

%Transitions

% P(X | s(class), a)
1.0::s(football, 1) :- s(class, 0), exercise.
1.0::s(tv, 1) :- s(class, 0), relax.

% P(X | s(football), a)
1.0::s(music, 1) :- s(football, 0), study.
1.0::s(sleep, 1) :- s(football, 0), sleep.

% P(X | s(music), a)
1.0::s(sleep, 1) :- s(music, 0), study.

0.2::s(class, 1);
0.4::s(football, 1);
0.4::s(music, 1) :- s(music, 0), pub.

% P(X | s(tv), a)
1.0::s(tv, 1):- s(tv, 0), relax.
1.0::s(class, 1):- s(tv, 0), quit.

% P(X | s(tv), a)
1.0::s(sleep, 1) :- s(sleep, 0), study.
1.0::s(sleep, 1) :- s(sleep, 0), exercise.
1.0::s(sleep, 1) :- s(sleep, 0), quit.
1.0::s(sleep, 1) :- s(sleep, 0), relax.
1.0::s(sleep, 1) :- s(sleep, 0), sleep.
1.0::s(sleep, 1) :- s(sleep, 0), pub.

%Background knowledge
states(class).
states(football).
states(music).
states(tv).
states(sleep).