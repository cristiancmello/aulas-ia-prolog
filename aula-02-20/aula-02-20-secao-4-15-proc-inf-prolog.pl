cura(Pessoa,Doença) :-
	médico(Pessoa),
	especialista(Pessoa, Doença).

médico(M) :- toxologista(M).
médico(M) :- traumatologista(M).

toxologista(sorus).
toxologista(morbus).
toxologista(vitus).

traumatologista(pugnus).

especialista(morbus,envenenamento).
especialista(sorus, unhada_de_dragão).
especialista(pugnus,ferimentos).
especialista(vitus,dentada_de_hidra).
