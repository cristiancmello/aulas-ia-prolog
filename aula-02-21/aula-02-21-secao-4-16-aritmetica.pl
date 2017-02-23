/* 4.16 ARITMÉTICA */
/*
   OBS.: X = 12 + 4 indica para o Prolog unificar X com a expressão
   '12 + 4'. Para poder efetuar cálculo, é preciso usar o operador
   infixo 'is'.
 */
/*
   ORDEM DE PRECEDÊNCIA) OPERADORES
   1) ^  : potenciação;
   2) mod: resto da divisão inteira;
   3) // : divisão inteira;
   4) /  : divisão
   5) *  : multiplicação
   6) +  : soma
   7) -  : substração

   PARÊNTESES: Definem precedência.
 */

% Exemplo: computar MDC (máximo divisor comum de 2 números). Dado 2
% inteiros positivos X e Y, seu máximo divisor comum D pode ser
% encontrado segundo três casos distintos.
/*
   1) Se X e Y são iguais, D é igual a X;
   2) Se X < Y, D é igual ao mdc entre X e a diferença X - Y;
   3) Se X > Y, cai-se em (2), com X substituído por Y e vice-versa.

 */
mdc(X, X, X).   % (1)
mdc(X, Y, D):-  % (2)
    X < Y,
    Y1 is Y - X,
    mdc(X, Y1, D).
mdc(X, Y, D):-  % (3)
    X > Y,
    mdc(Y, X, D).

% Exemplos de consulta:
% ?- mdc(133, 323, D).
% D = 19.

/*
  IMPORTANTE! Variáveis de expressão devem estar instanciadas, mas a
  variável do lado esquerdo NÃO PODE ser previamente instanciada.

  IMPORTANTE! NÃO EXISTE ESCOPO GLOBAL EM PROLOG. O âmbito das variáveis
  é apenas uma cláusula.

    Ex.: ?- A is 2, D is C+A+2.
         ERROR: Arguments are not sufficiently instantiated.
 */
