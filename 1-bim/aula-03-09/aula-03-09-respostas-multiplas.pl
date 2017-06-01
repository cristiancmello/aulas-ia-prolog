% RESPOSTAS MULTIPLAS
%
% findall: obter todas as respostas.
% findall(par(B,C), avo(B,C), Lista).
%
%     IMPORTANTE! findall ADMITE REPETIÇÃO DE ELEMENTOS
%
% setof: retorna uma lista ORDENADA E SEM REPETICAO
% setof(D, avo(D),L).
% Ex.: setof(A, avo(A), LR).
%
% bagof: mesma coisa que o findall. No entanto, ordena a lista.
%
pai(urano,cronos).
pai(cronos,zeus).
pai(zeus,ares).
pai(ares,eros).
pai(zeus,apolo).
pai(apolo,asclepio).

avo(B,C) :- pai(B,D), pai(D,C).
avo(D) :- avo(D,_).

% Singleton variable => sugestao para colocar _ no lugar da variavel
% (indicacao de que nao eh necessario)
