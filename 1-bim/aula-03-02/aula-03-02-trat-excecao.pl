/* TRATAMENTO DE EXCEÇÕES

 * O Corte é frequentemente usado para tratar exceções;

*/

robo(piter).

% Caso P seja true, prossegue-se até o lado direito após o corte.
% Nota-se, da definição do Corte, que negacao(P) só será verdadeira com
% P sendo verdadeiro, obrigando os predicados após o corte serem
% verdadeiros. No entanto, o lado direito após o corte é fail (força
% false), o que falsifica o predicado negacao/1.
negacao(P):- P, !, fail. % caso P seja false, vá para outro predicado. Caso P seja true, será preciso que o lado direito após o corte seja true também. Entretanto, o lado direito tem a instrução fail, o que falsifica a meta negacao(P).
negacao(P).

% Ex: mostrar se o ano é bissexto (366 dias) ou normal (365)
%
número_de_dias(Ano,366) :- % Exceção
    0 is Ano mod 4,
    not(0 is Ano mod 100), !. % se retirar o corte, com ambos os predicados verdadeiros, o Prolog simplesmente afirmaria algo absurdo na frase abaixo.

número_de_dias(Ano,365).
