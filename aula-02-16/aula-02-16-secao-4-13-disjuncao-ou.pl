/* 4.13 USANDO A DISJUN��O 'OU' */

/* data => estrutura contendo 3 argumentos */
aniversario(nadia, data(3, marco, 1986)).
aniversario(jose, data(19, abril, 1986)).

/* Uma pessoa � de aqu�rio se nasceu entre o dia 20 de Jan e 18 de Fev.
   N�o interessa o ano em que nasceu, por isso usamos o '_' */
signo(Pessoa, aquario) :-
    aniversario(Pessoa, data(Dia, janeiro, _)),
    Dia >= 20.

signo(Pessoa, aquario) :-
    aniversario(Pessoa, data(Dia, fevereiro, _)),
    Dia =< 18.

signo(Pessoa, peixes) :-
    aniversario(Pessoa, data(Dia, fevereiro, _)),
    Dia >= 21.

signo(Pessoa, peixes) :-
    aniversario(Pessoa, data(Dia, marco, _)),
    Dia =< 20.

/* Declara��es Infixas */
% X > 5: X � maior do que 5
% X < 5: X � menor do que 5
% X =< 5: X � menor ou igual a 5
% X = ana: X � igual a ana
% X \= Y: X n�o pode representar o mesmo objeto que Y

/* Verifica��o de signo usando-se a Disjun��o */
/* Pessoa � do signo de �ries se essa pessoa fizer
   anivers�rio no dia D do m�s M de qualquer ano,
   com M sendo o m�s de Mar�o e D a partir do dia 21 ou
   M sendo o m�s de Abril nos dias anteriores ao dia 19.
*/
signo(Pessoa, aries):-
    aniversario(Pessoa, data(D, M, _)),
    ((M=marco, D >= 21); (M=abril, D =< 19)).
