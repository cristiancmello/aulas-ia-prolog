/* 4.24 - ESQUEMAS DE REPETI��O

RECURSIVIDADE
   Def. recursiva:
      - declara��es classificadas como triviais e gerais;
      ...

ACUMULA��O
   - Esquema utilizado para melhorar a quest�o de efici�ncia
     do esquema recursivo.

   - Nada fica pendente -> OS C�LCULOS (VALORES) INTERMEDI�RIOS
     S�O PASSADOS PARA A PR�XIMA CHAMADA PELO PAR�METRO ACUMULADOR

   IMPORTANTE! SE N�O HOUVER PEND�NCIA, N�O � ACUMULA��O E SIM
   RECURSIVIDADE.

REPETI��O
   <a> :- <condicao_interrupcao>, !.
   <a> :- <b>, <c>, <d>, ..., <e>, <f>, <a>.

   Exemplo:
   exemplo(10) :- !, nl.
   exemplo(K) :-
	writeln('Isto � uma repeti��o!'),
	J is K+1, exemplo(J).

MAPEAMENTO


 */
%caso trivial: somat�ria de [ ] � 0.
somatoria_recursiva([ ], 0).

%caso geral: chamada recursiva para atingir o caso simplificado.
somatoria_recursiva([ X | Y ], S) :- somatoria_recursiva(Y, S1), S is X + S1.


somatoria_acumulativa([ ], Acumulador, Sa�da) :- Sa�da = Acumulador.
somatoria_acumulativa( [X|Y], ResParcial, Sa�da) :- Acumulador is X+ ResParcial,
somatoria_acumulativa(Y, Acumulador, Sa�da).




/* Os predicados que seguem realizam opera��es aritm�ticas. */
/* O resultado de uma opera��o � colocado no primeiro argumento*/
/* O segundo argumento cont�m a lista de operandos. */
soma(S,[X,Y]) :- S is X+Y.
produto(P,[X,Y]) :- P is X*Y.
unidade(1,_).
subtracao(Sub,[X,Y]):-Sub is X-Y.
quadrado(Q,X):- Q is X*X.

/* os predicados que fazem mapeamento s�o definidos a seguir: */
ziper([ ],[ ],[ ]) :- !.
ziper([X1|R1], [X2|R2],[[X1,X2]|R]):-ziper(R1,R2,R).

ap(Operac,[ ],[ ]) :- !.
ap(Operac,[X|Y],[OperacX|OperacY]) :-
   Predicado =.. [Operac,OperacX,X],
   call(Predicado), ap(Operac,Y,OperacY).

% EXERC�CIO:
% Deduzir o funcionamento a partir do predicado "reduz/3".



% Aplica uma opera��o (<Operac>) sobre uma lista. A opera��o
% deve ser definida na base.
% Ex. da chamada: ?- reduz(soma, [1, 2, 3], R).
reduz(Operac,[X,Y],Resultado) :- !,
    Predicado=.. [Operac,Resultado,[X,Y]], call(Predicado). % call � opcional

reduz(Operac,[X|Y],Resultado) :-
    reduz(Operac,Y,Y_reduzido),
    Predicado =.. [Operac,Resultado,[X,Y_reduzido]],
    call(Predicado).

% Insere um n�mero <N> ou � direita ou � esquerda em sublistas.
% ?- d_dir(2, [1, 2, 4], R).
% R = [[1, 2], [2, 2], [4, 2]].
d_dir(N,[ ],[ ]):- !.
d_dir(N,[X|R],[[X,N]|RN]) :- d_dir(N,R,RN).

d_esq(N,[ ],[ ]):- !.
d_esq(N,[X|R],[[N,X]|NR]) :- d_esq(N,R,NR).

% ?- varre(soma, [1, 2, 3], R).
varre(Op,[Y],[Y]):- !.
varre(Op,[X|Y],[AcX,AcY|Resto]):-
	varre(Op,Y,[AcY|Resto]),
	Predicado =.. [Op,AcX,[X,AcY]], call(Predicado).

%% C�lculo da m�dia usando mapeamento
m�dia(L,M):-
	reduz(soma,L,S),
	ap(unidade,L,ListaDeUns),
	reduz(soma,ListaDeUns,N�mDeElems),
	M is S/N�mDeElems.

%% C�lculo do Produto Escalar de duas listas
escalar(V1,V2,E):-
	ziper(V1,V2,V),
	ap(produto,V,ListaDeProdutos),
	reduz(soma,ListaDeProdutos,E).
