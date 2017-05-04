:-op(300,xfx,para).
:-op(300,xfx,==>).
:- op(35,xf,e_a_meta).
:- op(35,xf,atinge_a_meta).
:- op(35,xfx,transforma).
:- op(30,xfx,a).
:- op(30,xfx,em).
:- op(35,xfx,nao_produz_circulos_em).

oper(X para Y) transforma X em Y :- X ==> Y.

a ==> b. b ==> m. m ==> f. f ==> q. q ==> p.
p ==> n. p ==> s.
b ==> c.
c ==> d.
d ==> q. d ==> n. d ==> g.
n ==> h. n ==> s. h ==> g.

coord(a,2,4) :- !. coord(b,5,6):-!.
coord(c,4,2) :-!. coord(d,7,4) :-!.
coord(f,7,8) :-!. coord(g,8,2) :-!.
coord(h, 10,1) :-!. coord(m,9,6) :-!.
coord(n,11,3) :-!. coord(p,12,6) :-!.
coord(q,11,7) :-!. coord(s,13,2).

ap([],X,X) :- !.
ap([X|Y],Z,[X|W]) :- ap(Y,Z,W).

membro(X,[X|_]):- !.
membro(X,[_|Y]):- membro(X,Y).

% ache todos X, onde uma condição Y é satisfeita e retorne uma lista Z com
% todos os X.
ache_todos(X,Y,Z) :- bagof(X,Y,Z),!.
ache_todos(_,_,[]).

/* O programa abaixo serve para imprimir uma trajetória dada na seguinte
forma:
t(f([4]),g([4]), [r([4],g),r([1],c),r(raiz,b)]). */

imprima(t(FN,GN,T)):- imprima_trajet(T).

imprima_trajet([r(raiz,Raiz)]):- !,
 write('Estado Inicial: '), write(Raiz),write('.').

imprima_trajet( [r(Ramo, Nodo)|R]) :-
	imprima_trajet(R), nl, write(Ramo), write(' e, portanto, temos: '),nl,
	write(Nodo),write(’.’).

resolva :-
	estado_inicial(E),
	calcule_hn(E,HN),
	busca([t(HN,0, [r(raiz,E)])],Solucao),
	imprima(Solucao),nl.

busca([T|_],Solucao) :- T atinge_a_meta, !, Solucao=T.
busca([T|Fila], Solucao) :-
	ache_todos( ExtensaoAteUmFilho,
	     estende_ate_filho(T, ExtensaoAteUmFilho), Extensoes),
	     ap(Fila, Extensoes, FilaEstendida),
	     sort(FilaEstendida, FilaComMelhorNaFrente),
	     busca(FilaComMelhorNaFrente, Solucao).

estende_ate_filho(t(F,G, [r(Ramo,Nodo) |Trajetoria]),
t(F1,G1,[r(Op,NodoFilho),r(Ramo,Nodo)|Trajetoria])) :-
	oper(Op) transforma Nodo em NodoFilho,
	NodoFilho nao_produz_circulos_em Trajetoria,
	calcule_hn(NodoFilho, HNFilho), calcule_custo(Nodo, NodoFilho, Custo),
	G1 is G+Custo, F1 is G1+HNFilho.

Estado nao_produz_circulos_em Trajetoria :-
	not(membro(r(Operacao,Estado),Trajetoria)).

t(_,_, [r(Ramo,M)|_]) atinge_a_meta :- M e_a_meta.

calcule_custo(Nodulo, NoduloFilho, Custo) :-
	coord(Nodulo, XN,YN),
	coord(NoduloFilho, XF, YF),
	Custo is sqrt((XN-XF) * (XN-XF) + (YN-YF) * (YN-YF)).

calcule_hn(N,HN):-
	S e_a_meta, coord(S,XS,YS),
	coord(N, XN, YN),
	HN is sqrt((XN-XS) * (XN-XS) + (YN-YS) * (YN-YS)).

estado_inicial(a).
e_a_meta(s).
