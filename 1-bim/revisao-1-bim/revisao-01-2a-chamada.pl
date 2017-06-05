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

