/* 4.14 UNIFICA��O */
/* H� os seguintes crit�rios:
 *  IGUALDADE:
 *    a) constantes s�o iguais => escritas do mesmo jeito. Ex.: n�dia e
 *    n�dia s�o iguais
 *
 *    b) 2 n�meros s�o iguais => representam o mesmo valor. Ex.: 34 � igual a 34
 *
 *    c) vari�vel comparada com outro objeto => ela se torna igual a
 *    este objeto. Dizemos que a vari�vel est� representando o objeto.
 *        Vari�veis livres: s�o aquelas que n�o est�o representando
 *        objeto algum.
 *
 *    d) 2 estruturas s�o iguais => devem possui mesmo funtor e mesma
 *    aridade. Argumentos devem ser iguais entre ambas as partes.
 *
 *  UNIFICA��O:
 *    � basicamente uma compara��o na qual as vari�veis podem se tornar
 *    iguais a qualquer objeto.
 *
 *    IMPORTANTE! Uma vez que a vari�vel tornou-se igual a um objeto,
 *    ela n�o pode mais ser igual a outro diferente do primeiro.
 */

% Predicado unifica os 2 argumentos.
% A estrutura da esquerda � UNIFICADA com a da direita.
% ama(X, hadar) = ama(nadia, hadar).
% X = nadia.

/* COMPARA��O DE DOIS OBJETOS */
/* O predicado da compara��o considera que ambos os lados representam o mesmo objeto.
 *  Ex.:  L�-se -> 'X � equivalente a Y'
 *  ?- X == Y.
 *  false. => A resposta foi falsa porque X n�o representa coisa alguma.
 *  No entanto, se X = Y, a resposta ser� 'true', pois X se tornar� igual a Y
 *
 *  Ex. 1: X passou a representar 'hadar' na primeira unifica��o e como
 *  'hadar' � diferente de 'silvestre', a segunda unifica��o falha
 *
 *  ?- X=hadar, X=silvestre
 *  false.
 */

/* COMPARA��O DE CONSTANTES */
/*
 * IMPORTANTE!
 * ?- hadar=hadar, hadar==hadar.
 * true. => Quando se compara constantes, '=' e '==' S�O EQUIVALENTES.
 */

/* COMPARA��O ENTRE VARI�VEIS */
/*
 * ?- R=piter, S=piter, S==R, S=R.
 * R=S, S=piter.
 */

