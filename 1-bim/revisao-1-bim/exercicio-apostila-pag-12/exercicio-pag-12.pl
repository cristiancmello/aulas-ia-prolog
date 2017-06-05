% ÁRVORE GENEALÓGICA
pai(joao, carlos).
pai(joao, joaquim).
pai(carlos, miguel).
pai(miguel, benedito).
pai(miguel, daniel).
mae(maria, carlos).
mae(rosa, miguel).
mae(rosario, benedito).

avo(X, Z):- pai(X, Y), pai(Y, Z).
bisavo(X, Z):- avo(X, Y), pai(Y, Z). % avô do meu pai

irmao(X, Y):- (pai(Z, X), pai(Z, Y)); (mae(Z, X), mae(Z, Y)).

