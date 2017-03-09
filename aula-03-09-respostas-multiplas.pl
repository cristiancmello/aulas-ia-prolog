% findall
% findall(par(B,C), av�(B,C), Lista).
%
% setof: retorna uma lista ORDENADA
% setof(D, av�(D),L).
% Ex.: setof(A, av�(A), LR).
%
% bagof: mesma coisa que o findall
%
pai(urano,cronos).
pai(cronos,zeus).
pai(zeus,ares).
pai(ares,eros).
pai(zeus,apolo).
pai(apolo,ascl�pio).
av�(B,C) :- pai(B,D), pai(D,C).
av�(D) :- av�(D,L).

% Singleton variable => sugest�o para colocar _ no lugar da vari�vel
% (indica��o de que n�o � necess�rio)
