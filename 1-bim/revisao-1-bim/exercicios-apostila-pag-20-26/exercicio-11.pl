
% a)
parte_de(estrutura,fogao).
parte_de(cordao_eletrico,fogao).
parte_de(resistencia,estrutura).
parte_de(painel,estrutura).
parte_de(botao,painel).
parte_de(fio,cordao_eletrico).
parte_de(isolador,cordao_eletrico).

feito_em(resistencia,metal).
feito_em(botao,plastico).
feito_em(fio,metal).
feito_em(isolador,plastico).

% b)
% Objetos de metal: feito_em(X, metal).
% Objetos que não são de plastico: feito_em(X, Y), Y \= plastico.

% c)
parte_fogao(X):- parte_de(X, fogao).
parte_fogao(X):- parte_de(X, Y), parte_fogao(Y).