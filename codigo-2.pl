somatoria([], 0).
somatoria([X | R], S):-
	somatoria(R, SR), S is X+SR.
