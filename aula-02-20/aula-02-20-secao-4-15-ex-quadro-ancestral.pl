ancestral(A, Alguem):-
	pai(A, Alguem).

ancestral(A, Alguem):-
	pai(A, OutroAlguem),
	ancestral(OutroAlguem, Alguem).

pai(jose, pedro).
pai(pedro, antonio).
pai(antonio, felipe).

