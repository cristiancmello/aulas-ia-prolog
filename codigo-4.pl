/*

IMPORTANTE! Ordem da soma pode alterar o comportamento devido à forma de
como a 1ª ou 2ª lista são consumidas até chegar na lista vazia.

Base : Lista + [] == Lista
Geral: [C|R1] + L == [C|R2] com R2=R1+L.


  1ª       2ª
[C|R1] + Lista
[C|R2], onde R2 = R1 + L

*/

% conc([a, b], [c, d], L).
conc([], L, L).
conc([X | L1], L2, [X | L3]) :-
	conc(L1, L2, L3).

% remover(5, [3, 4, 5], L).
remover(X,[X|R],R).
remover(X,[C|R],[C|R1]):-
	remover(X,R,R1).

% inserir(5, [2, 3, 4], L).
inserir(X,L,L1):-
	remover(X,L1,L).

% inverter([a, b, c], L).
inverter([], []).
inverter([X | Y], Z) :-
	inverter(Y, Y1),
	conc(Y1, [X], Z).

% sublista([a, b], [d, b, a, b]).
sublista(S, L) :-
	conc(L1, L2, L),
	conc(S, L3, L2).

permutar([], []).
permutar([X | L], P) :-
	permutar(L, L1),
	inserir(X, L1, P).

% produto([1, 2, 3], P).
produto([], 0).
produto([X], X).
produto(L, P) :-
	prod(L, P).

prod([], 1).
prod([X | Y], P) :-
	prod(Y, Q),
	P is Q*X.
