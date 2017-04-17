% Ex. 1: remover um elemento de uma lista
% ?- remover(a, [d, f, g, a, j, k, l], Saida).
%    Saida = [d, f, g, j, k, l],
%    true.
list_concat([], L, L).
list_concat([X|Y], L, [X|Z]):- list_concat(Y, L, Z).

list_invert([], []).
list_invert([X|R], L):-
    list_invert(R, L1),
    list_concat(L1, [X], L).

% remover (iterativo)
/*
 remover(e, l, output){
    i = 0;
    while(l[i] != e && i < size(l)){
      output[i] = l[i];
      i++;
    }
 }
 */
remover(_, [], []):- !.
remover(X, [X|R], R):- !.
remover(X, [X1|R], S):-
    remover(X, R, S1),
    list_concat([X1], S1, S).


% Ex. 2: consecutivos
% ?- consecutivos(a, j, [d, f, g, a, j, k, l]).
%    true.
consecutivos(X, Y, [X, Y|_]):- !.
consecutivos(X, Y, [_|R]):-
    consecutivos(X, Y, R).

% Ex. 3: maior_da_lista/2
% ?- maior_da_lista([2, 5, 1, 69, 9], M).
%    M = 69,
%    true.
max(X, Y, X):- X > Y, !.
max(_, Y, Y).

min(X, Y, X):- X < Y, !.
min(_, Y, Y).

maior_da_lista([X], X):- !.
maior_da_lista([X, Y|R], M):-
    max(X, Y, M2),
    maior_da_lista([M2|R], M).

menor_da_lista([X], X):- !.
menor_da_lista([X, Y|R], M):-
    min(X, Y, M1),
    menor_da_lista([M1|R], M).

% Ex. 4: Defina uma rela��o que dado um n�mero forne�a uma lista com
% todos os seus divisores
% Ex: N=12, L=[1, 2, 3, 4, 6, 12]
divisor_int(X, Y):-
    R is mod(X, Y),
    R = 0.


/* Ex. 5: */
lista_divisores_1(_, 0, _):- !, fail.
lista_divisores_1(N, I, I):-
    divisor_int(N, I).

lista_divisores_1(N, I, M):-
    X is I-1,
    lista_divisores_1(N, X, M).

lista_divisores(N, L):-
    findall(I, lista_divisores_1(N, N, I), L1),
    list_invert(L1, L).
