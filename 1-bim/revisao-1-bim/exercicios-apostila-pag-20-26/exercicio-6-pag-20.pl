% Base de conhecimento
come(urso,peixe).
come(peixe,peixinho).
come(peixinho,alga).
come(quati,peixe).
come(urso,quati).
come(urso,raposa).
come(raposa,coelho).
come(coelho,mato).
come(urso,veado).
come(veado,mato).
come(gato_selvagem,veado).

animal(urso).
animal(peixe).
animal(peixinho).
animal(quati).
animal(raposa).
animal(coelho).
animal(veado).
animal(gato_selvagem).

planta(mato).
planta(alga).

% Consultas
/*
    1) ?- animal(Coelho).
    2) ?- come(gato_selvagem, mato).
    3) ?- come(urso, peixinho).
    4) ?- come(raposa, coelho).
    5) ?- come(Quem, peixe).
    6) ?- come(Quem, mato).
    7) ?- come(Quem, Planta), planta(Planta).
    8) ?- come(Quem, coelho), come(urso, Quem).
 */

% Regra da presa: presa é um animal que é comido
presa(X):- animal(X), come(_, X).

% Regra do predador: predador é um animal que come outro
predador(X):- animal(X), animal(Y), come(X, Y).

% Regra do Herbívoro: um animal que come planta
herbivoro(X):- animal(X), planta(P), come(X, P).

% Regra da Cadeia Alimentar (estratégia da Busca em Profundidade)
na_cadeia_alimentar(X, Y):- come(X, Y), !.
na_cadeia_alimentar(X, Y):- come(X, Z), na_cadeia_alimentar(Z, Y).