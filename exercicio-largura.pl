aresta(a,b).
aresta(a,c).
aresta(b,d).
aresta(b,e).
aresta(c,f).
aresta(c,g).
aresta(d,h).
aresta(e,i).
aresta(e,j).
aresta(f,k).

% ache todos X, onde uma condição Y é satisfeita e retorne uma lista Z com todos os X.
ache_todos(X,Y,Z) :-
	bagof(X,Y,Z),!.
ache_todos(_,_,[]).

% concatena as listas A e B
concatena([ ],L,L):-!.
concatena([X|Y],L,[X|Lista]):- concatena(Y,L,Lista).

% inverte os elementos da lista
inverte([X],[X]).

inverte([X|Y],Lista):-
	inverte(Y,Lista1),
concatena(Lista1,[X],Lista).

% estende a fila até um filho N1 de N, verificando se N1 não pertence a fila
estende_ate_filho([N|Trajetoria], [N1,N|Trajetoria]) :-
	aresta(N,N1),
	not(member(N1,Trajetoria)).

% encontra o caminho Solucao entre No_inicial e No_Meta
resolve_largura(No_Inicial,No_Meta, Solucao):-
	busca_em_largura([[No_Inicial]],No_Meta,Sol1),
	inverte(Sol1,Solucao).

	% realiza a busca em largura
busca_em_largura([[No_Meta|T]|T1],No_Meta,[No_Meta|T]).
busca_em_largura([T|Fila],No_Meta,Solucao):-
	ache_todos(Filho,estende_ate_filho(T,Filho),Lista),
	concatena(Fila,Lista,FilaExtendida),
	busca_em_largura(FilaExtendida,No_Meta,Solucao).
