% Independent state state_fluent
state_fluent(free_N).

% Multivalued state state_fluent
state_fluent(traffic_light(X)) :- tl_values(X).

% traffic light values as ads
0.333333::tl_values(green);
0.333333::tl_values(yellow);
0.333333::tl_values(red).

% Actions
action(move).
action(stop).

% Utility
utility(adequate_action, 10).
utility(crash, -50).      % Penalización por cruzar en rojo
utility(move, -1).        
utility(stop, -1).        

% Reward model
0.99::adequate_action :- traffic_light(green, 0), move.
0.50::adequate_action :- traffic_light(yellow, 0), move.
0.99::adequate_action :- traffic_light(red, 0), stop.
0.99::crash :- traffic_light(red, 0), move.

% Transition model

0.99:traffic_light(green, 1) :- traffic_light(yellow, 0).
0.50::traffic_light(yellow, 1) :- traffic_light(green, 0).
0.50::traffic_light(yellow, 1) :- traffic_light(red, 0).
0.99::traffic_light(red, 1) :- traffic_light(yellow, 0).

% Conditional probabilities p(x i = 1 | obs(Pa(x i )), move)
0.5::free_N(1) :- free_N(0), not(traffic_light(red, 0)), move.
0.2::free_N(1) :- not(free_N(0)), not(traffic_light(red, 0)), move.

% Conditional probabilities p(x i = 1 | obs(Pa(x i )), stop)
0.9::free_N(1) :- free_N(0), not(traffic_light(red, 0)), stop.
0.2::free_N(1) :- not(free_N(0)), not(traffic_light(red, 0)), stop.