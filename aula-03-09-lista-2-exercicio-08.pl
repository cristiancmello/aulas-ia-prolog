/*
 * Fatorial
 * Base: 0! = 1
 * Recursao:
 * 4! = 4 * 3! = 4 * 3 * 2! = 4 * 3 * 2 * 1! = 4 * 3 * 2 * 1 * 0! = 24
 */

% fat(0, 1):- !.
% fat(N, F):-
%	N1 is N-1,
%	fat(N1, F1),
%	F is F1*N.

% fatorial(LS, LS, [LF]):- !, fat(LS, LF).
% fatorial(LI, LS, LF):-
%	fat(LI, FLI),
%	LI2 is LI+1,
%	fatorial(LI2, LS, LF2),
%	LF = [FLI | LF2].

fatorial(0, 1):- !.
fatorial(N, F):-
	N1 is N-1,
	fatorial(N1, F1),
	F is F1*N.


lista_fat(N, N, [FN]):- !, fatorial(N, FN).

lista_fat(NI, NF, [FC|FR]):-
	fatorial(NI, FC),
	PNI is NI+1,
	lista_fat(PN1, NF, FR).









