cura(Pessoa,Doen�a) :-
	m�dico(Pessoa),
	especialista(Pessoa, Doen�a).

m�dico(M) :- toxologista(M).
m�dico(M) :- traumatologista(M).

toxologista(sorus).
toxologista(morbus).
toxologista(vitus).

traumatologista(pugnus).

especialista(morbus,envenenamento).
especialista(sorus, unhada_de_drag�o).
especialista(pugnus,ferimentos).
especialista(vitus,dentada_de_hidra).
