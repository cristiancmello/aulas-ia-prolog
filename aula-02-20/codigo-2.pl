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

na_cadeia_alimentar(X, Y):- come(X, Y).
na_cadeia_alimentar(X, Y):- come(X, Z), na_cadeia_alimentar(Z, Y).
