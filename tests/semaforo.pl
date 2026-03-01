

state_fluent(semaforo(X)) :- colores(X).

1/3::colores(rojo);
1/3::colores(verde);
1/3::colores(amarillo).