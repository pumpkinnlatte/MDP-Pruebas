% state fluents
state_fluent(s(X), ads) :- v_s(X).

%actions
action(study).
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
study_class1 :- s(class1, 0), study.
study_class2 :- s(class2, 0), study.
study_class3 :- s(class3, 0), study.

class1_relax :- s(class1, 0), relax.
class2_sleep :- s(class2, 0), sleep.
class3_pub :- s(class3, 0), pub.

tv_relax :- s(tv, 0), relax.
tv_quit :- s(tv, 0), quit.

%Transitions

% P(X | s(class1), a)
1.0::s(class2, 1) :- s(class1, 0), study.
1.0::s(tv, 1) :- s(class1, 0), relax.

% P(X | s(class2), a)
1.0::s(class3, 1) :- s(class2, 0), study.
1.0::s(sleep, 1) :- s(class2, 0), sleep.

% P(X | s(class3), a)
1.0::s(sleep, 1) :- s(class3, 0), study.

0.2::s(class1, 1);
0.4::s(class2, 1);
0.4::s(class3, 1) :- s(class3, 0), pub.

% P(X | s(tv), a)
1.0::s(tv, 1):- s(tv, 0), relax.
1.0::s(class1, 1):- s(tv, 0), quit.

% P(X | s(tv), a)
1.0::s(sleep, 1) :- s(sleep, 0), study.
1.0::s(sleep, 1) :- s(sleep, 0), quit.
1.0::s(sleep, 1) :- s(sleep, 0), relax.
1.0::s(sleep, 1) :- s(sleep, 0), sleep.
1.0::s(sleep, 1) :- s(sleep, 0), pub.

%Background knowledge
1/5::v_s(class1);
1/5::v_s(class2);
1/5::v_s(class3);
1/5::v_s(tv);
1/5::v_s(sleep).