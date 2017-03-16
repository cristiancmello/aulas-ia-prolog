% potencia(X, N, P) => P=X^N
% Base: X^0 = 1
% Positivo: potencia(2, 2, R) => 2^2 = (2*(2^1)) = 2*(2*(2^0)) = 4

potencia(_, 0, 1):- !. % potencia de qualquer coisa dá 1
potencia(B, E, RN):-
	E > 0, !,
	E1 is E-1,
	potencia(B, E1, RN1),
	RN is B*RN1.

potencia(B, E, RN):-
	E1 is E+1,
	potencia(B, E1, RN1),
	RN is (1/B)*RN1.
