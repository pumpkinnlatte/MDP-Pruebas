% Fluentes de estado
state_fluent(clima(X)) :- c_values(X).

1/3::c_values(soleado);
1/3::c_values(nublado);
1/3::c_values(lluvioso).

state_fluent(viento).

% Acciones
action(esperar).
action(moverse).

%utility
utility(esperar, -1).
utility(clima(soleado, 1), 5).

% Modelo de transicion

% SOLEADO
% P(Soleado | Soleado, Sin Viento, esperar), P(Numbado | Soleado, Sin Viento, esperar), P(Lluvioso | Soleado, Sin Viento, esperar)
0.8::clima(soleado, 1); 0.15::clima(nublado, 1); 0.05::clima(lluvioso, 1) :-
    clima(soleado, 0), not(viento(0)), action(esperar).

% P(Soleado | Soleado, Con Viento, esperar), P(Numbado | Soleado, Con Viento, esperar), P(Lluvioso | Soleado, Con Viento, esperar)
0.6::clima(soleado, 1); 0.3::clima(nublado, 1); 0.1::clima(lluvioso, 1) :-
    clima(soleado, 0), viento(0), action(esperar).
    
% NUBLADO
% P(Soleado | Nublado, Sin Viento, esperar), P(Nublado | Nublado, Sin Viento, esperar), P(Lluvioso | Nublado, Sin Viento, esperar)
0.3::clima(soleado, 1); 0.4::clima(nublado, 1); 0.3::clima(lluvioso, 1) :-
    clima(nublado, 0), not(viento(0)), action(esperar).

% P(Soleado | Nublado, Con Viento, esperar), P(Numbado | Nublado, Con Viento, esperar), P(Lluvioso | Nublado, Con Viento, esperar)
0.5::clima(soleado, 1); 0.2::clima(nublado, 1); 0.3::clima(lluvioso, 1) :-
    clima(nublado, 0), viento(0), action(esperar).

% LLUVIOSO
% P(Soleado | Lluvioso, Sin Viento, esperar), P(Nublado | Lluvioso, Sin Viento, esperar), P(Lluvioso | Lluvioso, Sin Viento, esperar)
0.1::clima(soleado, 1); 0.2::clima(nublado, 1); 0.7::clima(lluvioso, 1) :-
    clima(lluvioso, 0), not(viento(0)), action(esperar).

% P(Soleado | Lluvioso, Con Viento, esperar), P(Nublado | Lluvioso, Con Viento, esperar), P(Lluvioso | Lluvioso, Con Viento, esperar)
0.2::clima(soleado, 1); 0.4::clima(nublado, 1); 0.4::clima(lluvioso, 1) :-
    clima(lluvioso, 0), viento(0), action(esperar).


% Viento
% P(Viento | Viento, esperar)
0.7::viento(1) :- viento(0), action(esperar).

% P(Viento | Sin Viento, esperar)
0.2::viento(1) :- not(viento(0)), action(esperar). 