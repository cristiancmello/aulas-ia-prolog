% item(<num_item>, <desc>, <preco>, <fornecedor>).
/*
    ?- see('cameras.pl'), tell('fuji.pl'), seleciona(fuji), seen, told. 
*/
seleciona(Fornecedor):-
    read(Frase),
    escreva(Frase, Fornecedor),
    registrarFornecedorEItens(Fornecedor).

escreva(Frase, _):-
    assertz(Frase),
    Frase = end_of_file, !.

escreva(_, _):-
    read(Frase),
    escreva(Frase, _).

registrarFornecedorEItens(Fornecedor):-
    write(fornecedor(Fornecedor)), write('.'),nl,
    setof(item(NumItem, Desc, Preco, Fornecedor), item(NumItem, Desc, Preco, Fornecedor), L),
    imprimirLista(L).

imprimirLista([], _).
imprimirLista([X|R]):-
    write(X), write('.'), nl,
    imprimirLista(R).