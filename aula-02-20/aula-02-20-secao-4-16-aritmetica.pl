/* 4.16 ARITM�TICA */
/*
   OBS.: X = 12 + 4 indica para o Prolog unificar X com a express�o
   '12 + 4'. Para poder efetuar c�lculo, � preciso usar o operador
   infixo 'is'.
 */
/*
   ORDEM DE PRECED�NCIA) OPERADORES
   1) ^  : potencia��o;
   2) mod: resto da divis�o inteira;
   3) // : divis�o inteira;
   4) /  : divis�o
   5) *  : multiplica��o
   6) +  : soma
   7) -  : substra��o

   PAR�NTESES: Definem preced�ncia.
 */

% Exemplo: computar MDC (m�ximo divisor comum de 2 n�meros). Dado 2
% inteiros positivos X e Y, seu m�ximo divisor comum D pode ser
% encontrado segundo tr�s casos distintos.
/*
   1) Se X e Y s�o iguais, D � igual a X;
   2) Se X < Y, D � igual ao mdc entre X e a diferen�a X - Y;
   3) Se X > Y, cai-se em (2), com X substitu�do por Y e vice-versa.

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
  IMPORTANTE! Vari�veis de express�o devem estar instanciadas, mas a
  vari�vel do lado esquerdo N�O PODE ser previamente instanciada.

  IMPORTANTE! N�O EXISTE ESCOPO GLOBAL EM PROLOG. O �mbito das vari�veis
  � apenas uma cl�usula.

    Ex.: ?- A is 2, D is C+A+2.
         ERROR: Arguments are not sufficiently instantiated.
 */
