homem(joao).
homem(jose).
homem(joaquim).

mulher(maria).
mulher(josefina).
mulher(rosario).

pais_de(joao, jose).
pais_de(jose, joaquim).
pais_de(maria, jose).
pais_de(maria, josefina).
pais_de(joaquim, rosario).

% a) Regra pai_de
pai_de(X, Y):-
    homem(X), pais_de(X, Y).
    
% b) Regra filha_de
filha_de(X, Y):-
    mulher(X), pais_de(Y, X).

% c) Regra Ancestral
ancestral_de(X, Y):-
    pais_de(X, Y).
    
ancestral_de(X, Y):-
    pais_de(X, Z), ancestral_de(Z, Y).