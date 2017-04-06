/* BUSCA EM PROFUNDIDADE */
/*
                     a
		    / \
		   /   \
                  /     \
		 /       \
	        b         c
	       / \       / \
	      d   e     f   g
	     /	 / \   /
	    h   i   j k
*/
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

% X é o elemento da lista ?
pertence(X,[X|_]):-!.
pertence(X,[_|R]):- pertence(X,R).

% concatena as listas A e B
concatena([ ],L,L):-!.
concatena([X|Y],L,[X|Lista]):-
	concatena(Y,L,Lista).

% inverte os elementos da lista
inverte([X],[X]).
inverte([X|Y],Lista):- inverte(Y,Lista1),
	concatena(Lista1,[X],Lista).

resolva_prof(No_inicial,No_meta,Solucao):-
	profundidade([ ],No_inicial,No_meta,Sol_inv),
	inverte(Sol_inv,Solucao).

% Aqui foi implementada a Pilha.
%
profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho]).
profundidade(Caminho,No,No_meta,Sol):-
	aresta(No,No1),
	not(pertence(No1,Caminho)), % Previne Ciclo
	profundidade([No|Caminho],No1,No_meta,Sol).
