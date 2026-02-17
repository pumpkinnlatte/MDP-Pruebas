%fluente de estado
state_fluent(dado(X)) :- d_values(X).

1/6::d_values(1);
1/6::d_values(2);
1/6::d_values(3);
1/6::d_values(4);
1/6::d_values(5);
1/6::d_values(6).

%acciones
action(tirar).

%Transiciones
1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(1, 0), tirar.

1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(2, 0), tirar.

1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(3, 0), tirar.

1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(4, 0), tirar.

1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(5, 0), tirar.


1/6::dado(1, 1);
1/6::dado(2, 1);
1/6::dado(3, 1);
1/6::dado(4, 1); 
1/6::dado(5, 1); 
1/6::dado(6, 1) :- dado(6, 0), tirar.
