/* 4.14 UNIFICAÇÃO */
/* Há os seguintes critérios:
 *  IGUALDADE:
 *    a) constantes são iguais => escritas do mesmo jeito. Ex.: nádia e
 *    nádia são iguais
 *
 *    b) 2 números são iguais => representam o mesmo valor. Ex.: 34 é igual a 34
 *
 *    c) variável comparada com outro objeto => ela se torna igual a
 *    este objeto. Dizemos que a variável está representando o objeto.
 *        Variáveis livres: são aquelas que não estão representando
 *        objeto algum.
 *
 *    d) 2 estruturas são iguais => devem possui mesmo funtor e mesma
 *    aridade. Argumentos devem ser iguais entre ambas as partes.
 *
 *  UNIFICAÇÃO:
 *    É basicamente uma comparação na qual as variáveis podem se tornar
 *    iguais a qualquer objeto.
 *
 *    IMPORTANTE! Uma vez que a variável tornou-se igual a um objeto,
 *    ela não pode mais ser igual a outro diferente do primeiro.
 */

% Predicado unifica os 2 argumentos.
% A estrutura da esquerda é UNIFICADA com a da direita.
% ama(X, hadar) = ama(nadia, hadar).
% X = nadia.

/* COMPARAÇÃO DE DOIS OBJETOS */
/* O predicado da comparação considera que ambos os lados representam o mesmo objeto.
 *  Ex.:  Lê-se -> 'X é equivalente a Y'
 *  ?- X == Y.
 *  false. => A resposta foi falsa porque X não representa coisa alguma.
 *  No entanto, se X = Y, a resposta será 'true', pois X se tornará igual a Y
 *
 *  Ex. 1: X passou a representar 'hadar' na primeira unificação e como
 *  'hadar' é diferente de 'silvestre', a segunda unificação falha
 *
 *  ?- X=hadar, X=silvestre
 *  false.
 */

/* COMPARAÇÃO DE CONSTANTES */
/*
 * IMPORTANTE!
 * ?- hadar=hadar, hadar==hadar.
 * true. => Quando se compara constantes, '=' e '==' SÃO EQUIVALENTES.
 */

/* COMPARAÇÃO ENTRE VARIÁVEIS */
/*
 * ?- R=piter, S=piter, S==R, S=R.
 * R=S, S=piter.
 */

