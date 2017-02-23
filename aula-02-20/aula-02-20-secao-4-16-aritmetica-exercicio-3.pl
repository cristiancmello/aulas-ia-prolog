bhaskara(A, B, C):-
    X1 is ((-1) * B + sqrt(B^2 - (4*A*C))) / 2 * A,
    X2 is ((-1) * B - sqrt(B^2 - (4*A*C))) / 2 * A,
    write('X1='),write(X1),nl,
    write('X2='),write(X2).
