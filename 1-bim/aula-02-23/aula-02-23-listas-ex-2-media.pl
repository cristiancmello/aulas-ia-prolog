% Media
% Media = Soma de elementos / Num de elementos.
num_elems([], 0).
num_elems([_|R], N):- num_elems(R, N1), N is N1+1.

somatoria([], 0).
somatoria([X|R], S):- somatoria(R, S1), S is X+S1.

media(L, M):- somatoria(L, Somatoria),
              num_elems(L, Total),
              M is Somatoria / Total.
