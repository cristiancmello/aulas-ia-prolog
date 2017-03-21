/* 4.24 - ESQUEMAS DE REPETIÇÃO

RECURSIVIDADE
   Def. recursiva:
      - declarações classificadas como triviais e gerais;
      ...

ACUMULAÇÃO
   - Esquema utilizado para melhorar a questão de eficiência
     do esquema recursivo.

   - Nada fica pendente -> OS CÁLCULOS (VALORES) INTERMEDIÁRIOS
     SÃO PASSADOS PARA A PRÓXIMA CHAMADA PELO PARÂMETRO ACUMULADOR

   IMPORTANTE! SE NÃO HOUVER PENDÊNCIA, NÃO É ACUMULAÇÃO E SIM
   RECURSIVIDADE.

REPETIÇÃO
   <a> :- <condicao_interrupcao>, !.
   <a> :- <b>, <c>, <d>, ..., <e>, <f>, <a>.

   Exemplo:
   exemplo(10) :- !, nl.
   exemplo(K) :-
	writeln('Isto é uma repetição!'),
	J is K+1, exemplo(J).

MAPEAMENTO


 */
%caso trivial: somatória de [ ] é 0.
somatoria_recursiva([ ], 0).

%caso geral: chamada recursiva para atingir o caso simplificado.
somatoria_recursiva([ X | Y ], S) :- somatoria_recursiva(Y, S1), S is X + S1.


somatoria_acumulativa([ ], Acumulador, Saída) :- Saída = Acumulador.
somatoria_acumulativa( [X|Y], ResParcial, Saída) :- Acumulador is X+ ResParcial,
somatoria_acumulativa(Y, Acumulador, Saída).




/* Os predicados que seguem realizam operações aritméticas. */
/* O resultado de uma operação é colocado no primeiro argumento*/
/* O segundo argumento contém a lista de operandos. */
soma(S,[X,Y]) :- S is X+Y.
produto(P,[X,Y]) :- P is X*Y.
unidade(1,_).
subtracao(Sub,[X,Y]):-Sub is X-Y.
quadrado(Q,X):- Q is X*X.

/* os predicados que fazem mapeamento são definidos a seguir: */
ziper([ ],[ ],[ ]) :- !.
ziper([X1|R1], [X2|R2],[[X1,X2]|R]):-ziper(R1,R2,R).

ap(Operac,[ ],[ ]) :- !.
ap(Operac,[X|Y],[OperacX|OperacY]) :-
   Predicado =.. [Operac,OperacX,X],
   call(Predicado), ap(Operac,Y,OperacY).

% EXERCÍCIO:
% Deduzir o funcionamento a partir do predicado "reduz/3".



% Aplica uma operação (<Operac>) sobre uma lista. A operação
% deve ser definida na base.
% Ex. da chamada: ?- reduz(soma, [1, 2, 3], R).
reduz(Operac,[X,Y],Resultado) :- !,
    Predicado=.. [Operac,Resultado,[X,Y]], call(Predicado). % call é opcional

reduz(Operac,[X|Y],Resultado) :-
    reduz(Operac,Y,Y_reduzido),
    Predicado =.. [Operac,Resultado,[X,Y_reduzido]],
    call(Predicado).

% Insere um número <N> ou à direita ou à esquerda em sublistas.
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

%% Cálculo da média usando mapeamento
média(L,M):-
	reduz(soma,L,S),
	ap(unidade,L,ListaDeUns),
	reduz(soma,ListaDeUns,NúmDeElems),
	M is S/NúmDeElems.

%% Cálculo do Produto Escalar de duas listas
escalar(V1,V2,E):-
	ziper(V1,V2,V),
	ap(produto,V,ListaDeProdutos),
	reduz(soma,ListaDeProdutos,E).
