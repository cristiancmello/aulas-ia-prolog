% findall
% findall(par(B,C), avô(B,C), Lista).
%
% setof: retorna uma lista ORDENADA
% setof(D, avô(D),L).
% Ex.: setof(A, avô(A), LR).
%
% bagof: mesma coisa que o findall
%
pai(urano,cronos).
pai(cronos,zeus).
pai(zeus,ares).
pai(ares,eros).
pai(zeus,apolo).
pai(apolo,asclépio).
avô(B,C) :- pai(B,D), pai(D,C).
avô(D) :- avô(D,L).

% Singleton variable => sugestão para colocar _ no lugar da variável
% (indicação de que não é necessário)
