som(J,Fim,Soma,Soma) :- J > Fim,!.
som(J,Fim,Acumulado,Soma) :-
	K is J+1,
	AcumulaMais is Acumulado+J,
	som(K,Fim,AcumulaMais,Soma).

somar(Inicio,Fim,Soma) :- som(Inicio,Fim,0,Soma).

rec_soma(J,Fim,0):- J > Fim,!.
rec_soma(J,Fim,Soma):-
	K is J+1,
	rec_soma(K,Fim,SomaParcial),
	Soma is J+SomaParcial.

/*
   somar(1, 1000000, S).   => ACUMULATIVO
   rec_soma(1, 1000000, S). => RECURSIVO
 */


