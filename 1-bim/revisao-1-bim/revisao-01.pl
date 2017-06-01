min(X, Y, X):- X < Y, !.
min(X, Y, Y).

% [3, 1, 5, 0]
% 3 [1, 5, 0]
% 1 [5, 0]
% 5 [0]
% 0

lista_min([X], X).
lista_min([X|Y], Min):-
    lista_min(Y, Min1),
    min(X, Min1, Min).


concat([], L, L):- !.
concat([X|R1], L, [X|R2]):-
    concat(R1, L, R2).

% Inserir na lista
% lista_inserir([1, 2], 3, L).
% L = [1, 2, 3].
%
%   [1, 2]
% 1 [2]     [1, 2, 3]
% 2 []      [2, 3]
%           [3]

lista_inserir([], X, [X]):- !.
lista_inserir([X1|Y1], X, L):-
    lista_inserir(Y1, X, [X1|L1]).

% Inverter lista
% [4, 3, 2, 1]
% 4 [3, 2, 1]   [1, 2, 3, 4]
% 3 [2, 1]      [1, 2, 3]
% 2 [1]         [1, 2]
% 1 []          [1]
% []
lista_inverter([], []).
lista_inverter([X|Y], L):-
    lista_inverter(Y, L1),
    concat(L1, [X], L).

% Definir uma relação que dado um número N diga se é um número primo ou
% não.
%
% Número N é primo: se N for divisível somente por 1 ou por ele mesmo.
%
%
divisivel(X, Y):- 0 is X mod Y, !.
divisivel(X, Y):- X > Y+1, divisivel(X, Y+1).

primo(2):- !.
primo(X):- X < 2, !, fail.
primo(X):- not(divisivel(X, 2)).

% Fibonacci
fib(N, N):- N < 2, !.
fib(N, R):-
    N1 is N-1,
    N2 is N-2,
    fib(N1, R1),
    fib(N2, R2),
    R is R1+R2.

% Defina uma relação que calcule a div inteira de dois numeros através
% de subtrações sucessivas.
%
% Ex.: divisao(5, 2, Q).
%      Q = 2.
%
%      5 / 2 = 2 (resta 1)
%      5 / (5-4) = 5 (resta 0)
%      5 / (5-3) = 2 (
%
%      6 / 2 = 3 resta 0


% Esquema de repeticao
% i = 0;
% while(i < 10){
%    print("ola\n");
%    i++;
% }
while(I, I):- !.
while(I, K):-
    write('ola '),
    write('i='), writeln(I),
    J is I+1,
    while(J, K).
