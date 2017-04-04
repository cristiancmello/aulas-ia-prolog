:-op(34,xfx,vence).
/* PREDICADOS DE USO M�LTIPLO */

append([], L, L).
append([C|R1], L, [C|R2]):- append(R1, L, R2).

Lance vence Posi��o :-
	append(Esquerda,[Escolha | Direita], Posi��o),
	append([ Alguns | Palitos], Sobra, Escolha),
	append(Esquerda,[Sobra | Direita],Lance),
	not(OutroLance vence Lance).

/* ?- Lance vence [[i, i], [i], [i, i]].
      Lance = [[i, i], [], [i, i]].
 */
