:- op(30, fx, inversao).
:- op(25, fx, escreve). % prioridade mal-definida intencionalmente
:- op(40, xfx, pertence).

inversao(P):- P, !, fail.
inversao(P).

escreve(X):-
    write(X).
    
pertence(Elemento, [Elemento|_]):- !.
pertence(Elemento, [_|R]):-
    pertence(Elemento, R).
    
% Nota-se que a expressão ?- escreve inversao 4=4. irá avaliar
% primeiramente o termo "escreve" para depois julgar "inversao 4=4".
% Isso irá gerar um erro de colisão de prioridade de operador.
% Para forçar, podes-se fazer ?- escreve(inversao 4=4). Assim,
% há a priorização da operação "inversao 4=4".

% Uso do operador pertence (sem associatividade)
% Ex.: ?- a pertence [a, b, c].
%      true.