
% Relação de irmão
pai(joao, maria).
pai(joao, pedro).
mae(carla, carla1).
mae(carla, carla2).

% tiosangue
pai(joao, carla).

avo(X, Z):- pai(X, Y), pai(Y, Z).
bisavo(X, W):- avo(X, Y), pai(Y, W).
irmao(X, Y):- (pai(W, X), pai(W, Y)); (mae(W, Y), mae(W, Y)).
tiosangue(X, W):- irmao(X, Y), (pai(Y, W); mae(Y, W)).
cunhado(X, W):- casado(X, Y), irmao(Y, W).
tiosangue1(X, W):- casado(X, Y), irmao(Y, Z), (pai(Z, W); mae(Z, W)).
tiosangue2(X, W):- cunhado(X, Z), (pai(Z, W); mae(Z, W)).
tiosangue3(X, W):- casado(X, Y), tiosangue(Y, W).
tioavo(X, W):- tiosangue(X, Z), (pai(Z, W); mae(Z, W)).
tataravo(X, W):- bisavo(X, Y), pai(Y, W).


