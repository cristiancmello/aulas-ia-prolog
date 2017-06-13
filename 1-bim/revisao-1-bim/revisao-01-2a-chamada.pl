% ÁTOMOS
% Valores simbólicos minúsculos. Ex.: carro, homem, robô.

% VARIÁVEIS
% Qualquer sequência de caracteres, de dígitos e de sublinhados que se
% inicia em maiúscula. Ex.: X, Y, Elemento.

% VARIÁVEL UNIFICADA: vinculação de um valor e tipo, ocorrendo somente
% no processo de resolução;

% VARIÁVEL NÃO-UNIFICADA: sem vinculação

% 4.7 PREDICADO: <ÁTOMO>(<OBJETOS>). Ex.: homem(silvestre).
%            OU: <FUNTOR>(<ARGUMENTOS>)

% 4.8 ESTRUTURAS
% Ex.: machuca(derrubar(H), H):- animal(H). Significa que o ato de derrubar H
% machuca, consequentemente, um H se H for um animal.

% 4.9 FRASES AFIRMATIVAS E INTERROGATIVAS
% FRASES SIMPLES: predicado. Ex.: robô(piter).
% FRASES INTERROGATIVAS: Ex.: ?- ama(nadia, piter).

% 4.10 VARIÁVEIS EXISTENCIAIS
% Ex.: Pronomes: Quem, Qual. Utiliza-se VARIÁVEIS.
% Ex.: ?- construiu(Quem, piter).

% 4.11 CONECTIVOS SE, OU e E
% Se <=> :-
% OU <=> ;
% E  <=> ,

% 4.12 USANDO CONECTIVOS SE e E
/*

capaz_de_fazer(R,beijar(Alguém)) :-
    robô(R),
    mulher(Alguém).
    
capaz_de_fazer(R,derrubar(Algo)) :-
    objeto_físico(Algo),
    robô(R).
    
capaz_de_fazer(R,proteger(Algo)) :-
    robô(R).

 */

% 4.13 USANDO A DISJUNÇÃO OU
/*

signo(Pessoa,áries) :- 
    aniversário(Pessoa,data(D,M,_)),
    ((M=março, D >= 21); (M=abril, D =< 19)).

 */
/*
    DECLARAÇÕES INFIXAS (colocadas entre os objetos).
    Ex.: X > 5, X < 5, X =< 5, X >= 5, X = jojoba, X \= Y.
 */

% 4.14 UNIFICAÇÃO
/*
    a) CONSTANTES IGUAIS: são escritas da mesma forma. Ex.: nádia <=> nádia
    b) NÚMEROS IGUAIS: representam o mesmo valor. Ex.: 42 <=> 42
    c) VARIÁVEIS LIVRES: não representam objeto algum;
    d) VARIÁVEIS LIGADAS: quando se tornam igual ao objeto da comparação.
    e) ESTRUTURAS IGUAIS: 
        possuem MESMO FUNTOR e MESMA ARIDADE => CRITÉRIO DA UNIFICAÇÃO
        
        Ex.: ?- ama(X, hadar) = ama(nadia, hadar).
             X = nadia. % X unificou-se com "nádia"
 */

% COMPARAÇÃO
% Podemos comparar 2 variáveis para saber se estão representando o mesmo objeto.
/* Ex.: ?- X==Y.
        false. % X e Y não foram unificados.
        
        ?- X=Y.
        X = Y. % X passou a representar Y.
        
        ?- X=hadar, X=silvestre.
        false. % X passou a ser "hadar" na 1ª unif. X=silvestre <=> 
               % hadar=silvestre, que dará false.
               
        ?- hadar=hadar, hadar==hadar.
        true.  % = e == são equivalentes.
        
        ?- R=piter, S=piter, S==R, S=R.
        true.  % Quando variáveis representam o mesmo objeto, se comparadas
               % com = ou ==, terão o mesmo comportamento.
 */

% 4.15 O PROCESSO DE INFERÊNCIA DO PROLOG
% Apresenta-se aqui o processo de anotações e induções. O prof. passou
% uma tabela de anotações na aula de introdução (ver no caderno).

% EXERCÍCIOS 6, 9, 11 e 12 feitos (pasta exercicios-apostila-pag-20-26)

% 4.16 ARITMÉTICA
% Operador is: executa operação aritmética
% Operadores
/*
    ^   [potenciação]
    mod [resto da divisao inteira]
    //  [divisao inteira]
    /   [divisao]
    *   [multiplicacao]
    +   [adicao]
    -   [subtração]
 */
mdc(X, X, X).   % se X e Y são iguais, D = X.
mdc(X, Y, D):-
    X < Y,
    T1 is Y-X,  % Variável da expressão devem ser instanciadas. Variável do lado esquero NÃO DEVE ESTAR INSTANCIADA.
    mdc(X, T1, D).
    
mdc(X, Y, D):-
    X > Y,
    mdc(Y, X, D).

% 4.17 LISTAS (pagina 32 do leitor de pdf)
/*
    - São sequências de elementos.
    - Em geral, são usados como OBJETOS DE PREDICADOS.
    
    FORMATO: [<elem1>, <elem2>, ..., <elemn>]
         OU: [<cabeça> | <cauda>]
 */

pertence(X, [X|_]).
pertence(X, [_|R]):-
    pertence(X, R).
    
num_elems([], 0).
num_elems([_|R], N):-
    num_elems(R, C),
    N is C+1.
    
% Somar elementos de uma lista
somatoria([], 0).
somatoria([X|R], S):-
    somatoria(R, S1),
    S is X+S1.
    
% Média de Elementos de uma lista
media(Lista, Media):-
    somatoria(Lista, S),
    num_elems(Lista, Total),
    Total > 0, !, Media is S/Total.
    
media(_, _):-
    write('Não é possível calcular média de Lista Vazia.'), fail.
    
% Concatenação de 2 Listas [IMPORTANTE]
% list_concat(<list1>, <list2>, <list_result>)
% Base: list1 = [], list2 <=> list_result
% Passo: 
%       Seja elemento X1 primeiro elemento de list1
%       Seja elemento L2 a list2
%       Suponha que X1 seja o primeiro elemento de list_result
%           Consuma list1 até que seja uma lista vazia E
%               list2 <=> list_result
%       Após fim do consumo de list1, a lista L3 passa a ser
%           list2, mas agora recebe o elemento X1 empilhado.

list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]):-
    list_concat(L1, L2, L3).
    
% Remover um elemento da lista [IMPORTANTE]
list_elem_del(X, [X|R], R).
list_elem_del(X, [C|R], [C|R1]):-
    list_elem_del(X, R, R1).
    
% Adicionar elemento na lista [IMPORTANTE]
list_elem_add(X, L1, LR):-
    list_elem_del(X, LR, L1).
    
% Inverter listas [IMPORTANTE]
list_reverse([], []).
list_reverse([X|R], LR):-
    list_reverse(R, L1),
    list_concat(L1, [X], LR).
    
% Obter maior elemento de uma lista numérica
% Perceba que o código abaixo possui formato simular ao max(X, Y, Max)
% Max de lista com 1 elemento é ele mesmo.
list_elem_max([X], X).

% Pegue os 2 primeiros elementos (X, Y) de uma lista e compare.
% Caso X >= Y, repita o processo para uma lista sem o 2º elem (Y)
%   até que M seja igual ao elemento X numa lista de 1 elemento.
list_elem_max([X, Y|R], M):-
    X >= Y, !,
    list_elem_max([X|R], M).

% Caso X < Y, faça processo comparativo com o 2º elemento (Y)
list_elem_max([_, Y|R], M):-
    list_elem_max([Y|R], M).

% Código equivalente (mais sintético) [IMPORTANTE]
list_elem_max2([X], X).
list_elem_max2([X, Y|R], M):-
    (X >= Y, list_elem_max2([X|R], M)); 
    (X < Y , list_elem_max2([Y|R], M)).
    
% Obter menor elemento de uma lista numérica [IMPORTANTE]
list_elem_min([X], X).
list_elem_min([X, Y|R], M):-
    (X < Y , list_elem_min([X|R], M)); 
    (X >= Y, list_elem_min([Y|R], M)).
    
% Dividir lista num. em 2 sublistas que contenham os elementos
% menores ou iguais e maiores que um dado elemento [IMPORTANTE]

% Duplicar os elementos de uma lista [IMPORTANTE]
% Inserir elemento na Primeira Posição da lista [IMPORTANTE]
% Obter último elemento da lista [IMPORTANTE]
% Último elemento de uma lista [IMPORTANTE]
% N-ésimo elemento de uma lista
% Sublistas [IMPORTANTE]
% Permutação [IMPORTANTE]
% Produto [IMPORTANTE]


% 4.18 CORTE
% OBJETIVO: impedir com que o computador volte atrás em uma
%           decisão tomada. (EVITA BACKTRACKING DESNECESSÁRIO)

% No exemplo abaixo, não faz sentido tentar procurar outras alternativas
% caso haja a primeira falha.
f(X, 0):- X < 3, !.
f(X, 2):- 3 =< X, X < 6, !.  % X >= 3 ^ X < 6
f(X, 4):- 6 =< X.         % X >= 6

% Exemplo clássico do CUT
max(X, Y, X):- X > Y, !.
max(X, Y, Y).

% Refazer exercicio do teste (caiu conceitos de CORTE)
% Fazer exercício de fatorial

% 4.19 TRATAMENTO DE EXCEÇÕES
% É frequente o uso do CORTE e FAIL
op_not(P):- P, !, fail.
op_not(P).

% not equal <=> operador \=
op_not_equal(X, Y):- X = Y, !, fail.
op_not_equal(_, _).

% Exercicios 17 e 18 (feitos em "exercicios-apostila-pag-45-46/")

% 4.20 PREDICADOS DE ENTRADA E SAÍDA: READ/WRITE
saudacao(Pessoa):-
    write(ola(Pessoa)), nl,
    write('Olá, '), write(Pessoa), nl,
    write([ola, mundo]), nl.
    
dialogo:-
    write('Qual o seu nome?'), nl,
    read(Nome), nl,
    write('Bom dia, '), write(Nome), nl.
    
calc:-
    write('Input: '), nl,
    read(Input), nl,
    not(Input = 'end'),
    Resultado is Input,
    write('> '), write(Resultado), nl,
    calc.

calc:-
    write('Voce saiu...'), nl.


% 4.21 OPERADORES
% Definição: :- op(<prioridade>, <def_operador>, <simbolo_operador>).

% xfx => SEM ASSOCIATIVIDADE
% xfy => LADO DIREITO TEM MAIOR PRIORIDADE
% fx  => OPERADOR SEGUIDO DE OPERANDO

% 4.22 RESPOSTAS MÚLTIPLAS
% findall(<var_ou_estrutura>, <lista_predicados>, <lista_output>)
% LISTA ORDENADA COM REPETIÇÃO
% Ex.: findall(Filho, pai(_, Filho), Lista)

% setof(<var_ou_estrutura>, <lista_predicados>, <lista_output>)
% LISTA ORDENADA SEM REPETIÇÃO

% bagof(<var_ou_estrutura>, <lista_predicados>, <lista_output>)
% MESMO COMPORTAMENTO QUE findall
pai(joao, carlos).
pai(carlos, bizancio).
pai(carlos, pedro).

pais(ListaPais):-
    findall(Pai, pai(Pai, _), ListaPais).
    

% 4.23 BASE DE DADOS: TRABALHANDO COM ARQUIVOS EM PROLOG
% (1) "consult": fazer o interpretador "memorizar" o conteúdo de um arquivo
% Ex.: ?- consult('file1.pl').

% (2) "make": reconsulta todos os arquivos carregados modificados.

% (3) "dynamic": configura um "contrato" para um predicado, definindo-se a aridade.
% Ex.: :- dynamic(homem/1).
%         homem(hadar).

% (4) "assertz": coloca-se um predicado ao FINAL da base de dados
% Ex.: ?- assertz(homem(hadar)).

% (5) "asserta": coloca-se um predicado no INÍCIO da base de dados

% (6) "retract": remoção de um predicado da base de dados
% Ex.: ?- retract(homem(hadar))

% (7) "abolish": remoção de TODOS OS PREDICADOS
% Ex.: ?- abolish(homem/1). => Todos os predicados do tipo homem(X) serão removidos.

% [IMPORTANTE]
% (8) "univ": operação para montar ou desmontar estruturas.
% Montar: ?- P =.. [ama, hadar, nadia].
% Montar e armazenar: ?- P =.. [ama, hadar, nadia], assertz(P).
% Desmontar: Depois de montar P, faça: ?- ama(hadar, nadia) =.. [Funtor|Args].
%                                      Funtor = ama,
%                                      Args = [hadar, nadia].

% (9) "arg": obter um argumento de acordo coma posição num predicado.
% Ex.: ?- arg(2, ama(hadar, nadia), X).
%      X = nadia. => 2 parâmetro <=> nadia

% (10) "see"/"seen": leitura de um <arquivo>.pl
% "see": iniciar leitura do arquivo
% "seen": finalizar a leitura do arquivo
liste(Arquivo):- see(Arquivo), % Olhando Arquivo
    nl,read(Frase), % Le uma Frase do Arquivo
    escreva(Frase), % Vai escrever a frase.
    seen.           % Termina leitura do Arquivo

escreva(Frase) :- 
    write(Frase), nl,
    Frase = end_of_file, !. /* Pára leitura quando end_of_file � encontrado. */

escreva(_) :-
    read(Outra_Frase), % Le Outra_Frase
    escreva(Outra_Frase).
    
% (11) "seeing": mostra de que arquivo/equipamento o interpretador está fazendo
% a leitura.

% (12) "tell"/"told": escrita para um arquivo
% "tell": inicia um arquivo para escrita
% "told": finaliza a escrita de um arquivo.
