:-op(34,xfx,vence).
/* PREDICADOS DE USO MÚLTIPLO */

append([], L, L).
append([C|R1], L, [C|R2]):- append(R1, L, R2).

Lance vence Posição :-
	append(Esquerda,[Escolha | Direita], Posição),
	append([ Alguns | Palitos], Sobra, Escolha),
	append(Esquerda,[Sobra | Direita],Lance),
	not(OutroLance vence Lance).

/* ?- Lance vence [[i, i], [i], [i, i]].
      Lance = [[i, i], [], [i, i]].
 */
