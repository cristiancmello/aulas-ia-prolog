p(X):- r(X).
q(X):- s(X).
q(X):- t(X).
r(0).
r(1).
s(2).
s(3).
t(4).
t(5).

/* 8. Quantas e quais s�o as inst�ncias encontradas para ?- p(X). ? */
% H� 2 inst�ncias encontradas, nas quais s�o: X=0, onde r(0) e X=1,
% onde r(1);
