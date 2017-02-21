/* 4.13 USANDO A DISJUNÇÃO 'OU' */

/* data => estrutura contendo 3 argumentos */
aniversario(nadia, data(3, marco, 1986)).
aniversario(jose, data(19, abril, 1986)).

/* Uma pessoa é de aquário se nasceu entre o dia 20 de Jan e 18 de Fev.
   Não interessa o ano em que nasceu, por isso usamos o '_' */
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

/* Declarações Infixas */
% X > 5: X é maior do que 5
% X < 5: X é menor do que 5
% X =< 5: X é menor ou igual a 5
% X = ana: X é igual a ana
% X \= Y: X não pode representar o mesmo objeto que Y

/* Verificação de signo usando-se a Disjunção */
/* Pessoa é do signo de áries se essa pessoa fizer
   aniversário no dia D do mês M de qualquer ano,
   com M sendo o mês de Março e D a partir do dia 21 ou
   M sendo o mês de Abril nos dias anteriores ao dia 19.
*/
signo(Pessoa, aries):-
    aniversario(Pessoa, data(D, M, _)),
    ((M=marco, D >= 21); (M=abril, D =< 19)).
