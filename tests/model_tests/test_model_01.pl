% Independent state state_fluent
state_fluent(free_N).

% Multivalued state state_fluent
state_fluent(traffic_light(X)) :- tl_values(X).

% traffic light values as ads
0.333333::tl_values(green);
0.333333::tl_values(yellow);
0.333333::tl_values(red).
