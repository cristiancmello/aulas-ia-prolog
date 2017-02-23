pertence(X, [X|_]).
pertence(X, [_|R]):-
	pertence(X, R).

numero_elementos([], 0).
numero_elementos([_|R], N):-
	numero_elementos(R, NR), N is 1+NR.
