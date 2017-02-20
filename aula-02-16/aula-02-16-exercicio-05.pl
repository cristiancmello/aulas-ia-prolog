% Fatos
rob�(piter).
homem(silvestre).
homem(hadar).
homem(asrat).
mulher(n�dia).
pai(silvestre, n�dia).
construiu(silvestre, piter).
ama(n�dia, hadar).

% Primeira Lei da Rob�tica
proibido_fazer(R, B) :- rob�(R),
    capaz_de_fazer(R, B),
    machuca(B, H),
    humano(H).

obrigado_a_fazer(R, B) :- rob�(R),
    capaz_de_fazer(R, B),
    oferece_perigo(C, H),
    humano(H),
    afasta(B, C).

% Segunda Lei da Rob�tica
deve_fazer(R, Ato) :- rob�(R),
    capaz_de_fazer(R, Ato),
    mandou_fazer(H, R, Ato),
    humano(H),
    not(proibido_fazer(R, Ato)).

animal(H) :- humano(H).
objeto_f�sico(Coisa) :- animal(Coisa).
humano(X) :- homem(X).
humano(X) :- mulher(X).

/* Ato de derrubar H machuca H se H for animal */
machuca(derrubar(H), H) :- animal(H).

/* Lista de a��es que o rob� ser� capaz de fazer */
capaz_de_fazer(R, beijar(Algu�m)) :-
    rob�(R),
    mulher(Algu�m).

capaz_de_fazer(R, derrubar(Algo)) :-
    rob�(R),
    objeto_f�sico(Algo).

capaz_de_fazer(R, proteger(Algo)) :-
    rob�(R).

/* Para verificar a Segunda Lei da Rob�tica */
oferece_perigo(monstro_verde, H) :-
    humano(H),
    ataca(monstro_verde, H).

ataca(monstro_verde, n�dia).
animal(monstro_verde).

afasta(derrubar(monstro_verde), monstro_verde).
