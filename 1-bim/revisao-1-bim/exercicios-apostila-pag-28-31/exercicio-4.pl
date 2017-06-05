% maior(X, Y, X):- X > Y, !.
% maior(X, Y, Y).
maior(X, Y, Z):-
    X > Y, Z is X.

maior(X, Y, Z):-
    Y > X, Z is Y.