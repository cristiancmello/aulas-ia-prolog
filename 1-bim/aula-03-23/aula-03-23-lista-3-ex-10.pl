
% i)
/* % A lista abaixo se aplica até o exercicio iv)
aresta(a, b, 2).
aresta(a, c, 5).
aresta(b, d, 3).
aresta(b, e, 4).
aresta(c, f, 1).
aresta(d, g, 7).*/


% ii)
% VI = Vértice Inicial
% VF = Vértice Final
% VInterm = Vértice Intermediário
%
% Base:	      caminho(VI, VF):- aresta(VI, VF), !.
% Caso Geral: caminho(VI, VF):- aresta(VI, VInterm), caminho(Vinterm,
% VF).
%
caminho(VI, VF):- aresta(VI, VF), !.  % caminho de comprimento 1 (menor caminho)
caminho(VI, VF):- aresta(VI, VInterm), caminho(Vinterm, VF).

% ?- caminho(a, e).
% true.
%
% ?- caminho(c, d).
% false.

% iii)
% LV = Lista de Vértices
lista_caminho(VI, VF, [VI, VF]):- aresta(VI, VF, _), !.
lista_caminho(VI, VF, [VI|LV]):- aresta(VI, VInterm, _), lista_caminho(VInterm, VF, LV).

% iv)
custo_cam(VI, VF, Custo):-
	aresta(VI, VF, Custo), !.

custo_cam(VI, VF, Custo):-
	aresta(VI, VInterm, Peso1),
	custo_cam(VInterm, VF, Peso2),
	Custo is Peso1 + Peso2.

% v)
% Custo Mínimo:
%    ?- custo_min(a, e, Cmin).
%    Cmin = 9.
%    true.
%
%    Dica: usar o setof

aresta(a, b, 2).
aresta(a, c, 6).
aresta(b, d, 3).
aresta(b, e, 1).
aresta(d, h, 7).
aresta(d, i, 4).
aresta(e, i, 8).
aresta(e, j, 9).
aresta(c, f, 2).
aresta(c, g, 7).
aresta(f, k, 7).

% Não funciona!!!
custo_min(VI, VF, CCm):-
	setof(C, custo_caminho(VI, VF, C), [CCm | _]).
