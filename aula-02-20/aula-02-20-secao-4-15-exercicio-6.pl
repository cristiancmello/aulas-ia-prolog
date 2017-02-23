come(urso,peixe).
come(peixe,peixinho).
come(peixinho,alga).
come(quati,peixe).
come(urso,quati).
come(urso,raposa).
come(raposa,coelho).
come(coelho,mato).
come(urso,veado).
come(veado,mato).
come(gato_selvagem,veado).

animal(urso).
animal(peixe).
animal(peixinho).
animal(quati).
animal(raposa).
animal(coelho).
animal(veado).
animal(gato_selvagem).

planta(mato).
planta(alga).

/*  1) ?- animal(coelho).
 *  2) ?- come(gato_selvagem, mato).
 *  3) ?- come(urso, peixinho).
 *  4) ?- come(raposa, coelho).
 *  5) ?- come(Quem, peixe).
 *  6) ?- come(Quem, mato).
 *  7) ?- come(Quem, X), planta(X).
 *  8) ?- come(Quem, coelho), come(urso, Quem).
 */

% 9) Definição de presa: presa é um animal que é comido por outro
% (qualquer um).
presa(P):-
    animal(P),
    come(_, P). % Qualquer animal come Presa

% 10) Quem é presa mas não é comido pela raposa?
% presa(Quem), come(X, Quem), X \= raposa.
% X \= presa significa que X NÃO SERÁ UNIFICADO COM raposa.

% 11) Definição de predador: animal quer come qualquer outro.
predador(X):-
    animal(X),
    presa(Y),
    come(X, Y).

% Outra def.:
predador_other(X):-
    animal(X),
    animal(Y),
    come(X, Y).

% 12) Definição de herbívoro: animal que come planta
herbivoro(A):-
    animal(A),
    planta(Y),
    come(A, Y).

% 13) Relação recursiva da cadeia alimentar.
%     1) X come Y diretamente
%     2) X come Z e Y está na cadeia alimentar de Z
%
/* Definição do caso base */
na_cadeia_alimentar(X, Y):- come(X, Y).
/* Definição da recursão */
na_cadeia_alimentar(X, Y):- come(X, Z), na_cadeia_alimentar(Z, Y).
