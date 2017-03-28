/* CORTE
1ª frase => <a> :- <b>, ..., <c>, !, <d>, <f>, ...
2ª frase => <a> :- <g>, <h>, <i>, ...

  * O Corte impede que o computador volte atrás em uma decisão;
  * Se a 1ª frase for verdadeira até o predicado <c>, o corte impedirá
    tentativa para a 2ª frase além de eliminar qualquer anotação feita
    a respeito de <b>, ..., <c>. Tem-se, como efeito colateral, que os
    predicados à esquerda da corte NÃO PODERÃO MAIS SER SATISFEITOS
    PELO BACKTRACKING.

  * Corte faz lembrar o tratamento de exceção,

*/

% Ex. 1 (feito por mim)
usuario(cristian).
usuario(ana).
usuario(rebeca).

moeda(dolar_us).
moeda(real).
moeda(euro).


transacao(Valor, Moeda, Usuario):-
    moeda(Moeda), usuario(Usuario), !, usuario(Usuario),
    write('Valor = '), write(Valor).

transacao(_, _, _):- write('Falha na transacao'), fail.

% Ex. 2: numero maximo
% max(X, Y, Max).

max(X, Y, X):- X >= Y, !.
max(X, Y, Y).

% Ex. 3: Fatorial
% a) fatorial de 0 é 1
% b) fatorial de N = produto dos inteiros entre 1 e N
%
% fat(4) = 4 * fat(3) = 4 * 3 * fat(2) = 4 * 3 * 2 * fat(1) = 4 * 3 * 2
% * 1 * fat(0) = 4 * 3 * 2 * 1 * 1 = 24

fat(0, 1):- !.
fat(N, R):- N1 is N-1, fat(N1, R1), R is R1*N.
