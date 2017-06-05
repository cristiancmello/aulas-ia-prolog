% a)
objeto(a).
objeto(b).
objeto(mesa).

sobre(a, mesa).
sobre(b, a).
sobre(c, b).
sobre(d, c).

% b) Regra acima_de
acima_de(X, Y):- sobre(X, Y).
acima_de(X, Y):- sobre(X, Z), acima_de(Z, Y).

% c) ?- acima_de(b, mesa)
