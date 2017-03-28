p(X):- r(X).
q(X):- s(X).
q(X):- t(X).
r(0).
r(1).
s(2).
s(3).
t(4).
t(5).

/* 8. Quantas e quais são as instâncias encontradas para ?- p(X). ? */
% Há 2 instâncias encontradas, nas quais são: X=0, onde r(0) e X=1,
% onde r(1);
