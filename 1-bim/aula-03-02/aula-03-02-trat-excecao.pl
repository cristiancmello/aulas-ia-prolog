/* TRATAMENTO DE EXCE��ES

 * O Corte � frequentemente usado para tratar exce��es;

*/

robo(piter).

% Caso P seja true, prossegue-se at� o lado direito ap�s o corte.
% Nota-se, da defini��o do Corte, que negacao(P) s� ser� verdadeira com
% P sendo verdadeiro, obrigando os predicados ap�s o corte serem
% verdadeiros. No entanto, o lado direito ap�s o corte � fail (for�a
% false), o que falsifica o predicado negacao/1.
negacao(P):- P, !, fail. % caso P seja false, v� para outro predicado. Caso P seja true, ser� preciso que o lado direito ap�s o corte seja true tamb�m. Entretanto, o lado direito tem a instru��o fail, o que falsifica a meta negacao(P).
negacao(P).

% Ex: mostrar se o ano � bissexto (366 dias) ou normal (365)
%
n�mero_de_dias(Ano,366) :- % Exce��o
    0 is Ano mod 4,
    not(0 is Ano mod 100), !. % se retirar o corte, com ambos os predicados verdadeiros, o Prolog simplesmente afirmaria algo absurdo na frase abaixo.

n�mero_de_dias(Ano,365).
