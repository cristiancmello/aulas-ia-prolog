% LISTAS
% S�o sequ�ncias de elementos.
%
% Ex.: [rosa, cravo, violeta]
%      [[1, 2], [4, 5]]
%
%      Parte de um objeto de predicados:
%      partes(manipulador, [braco, punho, efetuador])
%
%      [rosa, cravo | X]
%      1� elem: rosa
%      2� elem: cravo
%      Resto: X (que � uma outra lista)
%
lista_nomes([ana]).

% ?- lista_nomes([X | Y]).
% X = ana,
% Y = [].

pertence(X, [X | _]). % X pertence a uma lista generica [X|_]
pertence(X, [_ | R]):- pertence(X, R).

% Calcular o n�mero de elementos (mesmo princ�pio do pertence)
num_elems([], 0). % num de elems de [] � 0
num_elems([_|R], N):- num_elems(R, N1), N is N1+1.
