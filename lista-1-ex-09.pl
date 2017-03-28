passaro(piupiu).
peixe(lala).
minhoca(juju).
gato(gato).
amigo(eu, gato).


gosta(X, Y):-
    passaro(X),
    minhoca(Y).

gosta(X, Y):-
    gato(X), (peixe(Y); passaro(Y)).

gosta(X, Y):-
    amigo(X, Y); amigo(Y, X).

come(gato, Y):-
    gosta(gato, Y), Y \= eu.
