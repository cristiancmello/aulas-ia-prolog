sx(S):- repeat,
	writeln('Qual é o seu sexo?'),
	writeln('Aperte f para responder feminino'),
	writeln('ou m para masculino: '),
	get0(Tecla),
	sexo(Tecla, S), !.

sexo(102, feminino):-!.
sexo(109, masculino).

sabe_programar(E):-
	repeat,nl,
	write('Você sabe PROLOG? '),nl,
	write('Aperte s para responder sim.'),nl,
	write('Aperte n para responder não.'),nl,
	get0(Tecla),sn(Tecla,E).

sn(115,sim):- !.
sn(110,não).




