
numero_elementos([], 0).
numero_elementos([_|R], N):-
	numero_elementos(R, NR), N is 1+NR.

somatoria([], 0).
somatoria([X | R], S):-
	somatoria(R, SR), S is X+SR.

media(L, M):-
	numero_elementos(L, N), somatoria(L, S), N \= 0, M is S/N.
media(_,_):- writeln('Divisao por Zero!'), nl, nl.
