% Fatos
robô(piter).
homem(silvestre).
homem(hadar).
homem(asrat).
mulher(nádia).
pai(silvestre, nádia).
construiu(silvestre, piter).
ama(nádia, hadar).

% Primeira Lei da Robótica
proibido_fazer(R, B) :- robô(R),
    capaz_de_fazer(R, B),
    machuca(B, H),
    humano(H).

obrigado_a_fazer(R, B) :- robô(R),
    capaz_de_fazer(R, B),
    oferece_perigo(C, H),
    humano(H),
    afasta(B, C).

% Segunda Lei da Robótica
deve_fazer(R, Ato) :- robô(R),
    capaz_de_fazer(R, Ato),
    mandou_fazer(H, R, Ato),
    humano(H),
    not(proibido_fazer(R, Ato)).

animal(H) :- humano(H).
objeto_físico(Coisa) :- animal(Coisa).
humano(X) :- homem(X).
humano(X) :- mulher(X).

/* Ato de derrubar H machuca H se H for animal */
machuca(derrubar(H), H) :- animal(H).

/* Lista de ações que o robô será capaz de fazer */
capaz_de_fazer(R, beijar(Alguém)) :-
    robô(R),
    mulher(Alguém).

capaz_de_fazer(R, derrubar(Algo)) :-
    robô(R),
    objeto_físico(Algo).

capaz_de_fazer(R, proteger(Algo)) :-
    robô(R).

/* Para verificar a Segunda Lei da Robótica */
oferece_perigo(monstro_verde, H) :-
    humano(H),
    ataca(monstro_verde, H).

ataca(monstro_verde, nádia).
animal(monstro_verde).

afasta(derrubar(monstro_verde), monstro_verde).
