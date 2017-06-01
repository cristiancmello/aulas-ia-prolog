:- dynamic(homem/1).

% assertz (dica: z => fim)
% Insercao de dados ao fim da definicao
% ?- assertz(homem(hadar)).
% ?- assertz(homem(asrat)).
% ?- assertz(homem(piter)).
% ?- findall(X, homem(X), L).
% L = [hadar, asrat, piter].


% asserta(dica: a => início)
% Insercao de dados ao início da definicao (pilha)
% ?- assertz(homem(hadar)).
% ?- assertz(homem(asrat)).
% ?- assertz(homem(piter)).
% ?- findall(X, homem(X), L).
% L = [piter, asrat, hadar].

% retract
% Remocao do argumento da base de dados.
% ?- assertz(homem(hadar)).
% ?- assertz(homem(asrat)).
% ?- assertz(homem(piter)).
%
% ?- retract(homem(asrat)).
% ?- findall(X, homem(X), L).
% L = [piter, hadar].

% abolish
% Remove todos os predicados.
%
% Ex. 1: ?- abolish(fatorial/2). % retira todas as def de fat da mem.
% Ex. 2: ?- abolish(homem/1). % retira todas as definicoes

% univ
% Predicado para montar/desmontar estruturas.
%
% Montar:
%    ?- P =.. [ama, hadar, nadia].
%    P = ama(hadar, nadia).
%
%    % Carregar em memoria com assertz
%    ?- P =.. [ama, hadar, nadia], assertz(P).
%    ?- ama(X, hadar).
%    ?- X = nadia.
%
% Desmontar:
%    ?- ama(hadar, nadia) =.. [Funtor | Args].
%    Funtor = ama,
%    Args = [hadar, nadia].
%

% arg
% Obter um argumento segundo uma posição no predicado.
% arg(2, ama(nadia, hadar), X).

% Lendo e escrevendo na tela um arquivo .pl
% see e seen
liste(Arquivo):- see(Arquivo), % Olhando Arquivo
    nl,read(Frase), % Lê uma Frase do Arquivo
    escreva(Frase), % Vai escrever a frase.
    seen.

escreva(Frase) :- write(Frase), nl,
    Frase = end_of_file, !. /* Pára leitura quando end_of_file é encontrado. */

escreva(_) :-
    read(Outra_Frase), % Lê Outra_Frase
    escreva(Outra_Frase).

copia(D,C) :-
    see(D),
    tell(C),
    read(Frase),
    faz_cópia_de(Frase),
    seen, told.   % told => termina a leitura

faz_cópia_de(Frase):-
    write(Frase),
    write('.'), nl,
    Frase = end_of_file,!.

faz_cópia_de(Frase) :-
    read(Outra_Frase),
    faz_cópia_de(Outra_Frase).

