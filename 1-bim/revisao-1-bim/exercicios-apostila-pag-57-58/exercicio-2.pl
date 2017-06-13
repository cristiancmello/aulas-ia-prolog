% cliente(<nome>, <endereco>, <telefone>).
relatorio:-
    see('clientes.pl'),
    tell('relatorio-ex1.txt'),
    read(Linha),
    selecionaClientes(Linha),
    imprimirClientes,
    seen,
    told.
    
selecionaClientes(Linha):-
    assertz(Linha),
    Linha = end_of_file, !.
    
selecionaClientes(_):-
    read(Linha),
    selecionaClientes(Linha).
    
imprimirClientes:-
    setof(cliente(Nome, Endereco, Telefone), cliente(Nome, Endereco, Telefone), L),
    imprimirLista(L).
    
imprimirCliente(Contagem, cliente(Nome, Endereco, Telefone)):-
    write('CLIENTE '), write(Contagem), write(': '), writeln(Nome), 
    tab(4), write('ENDEREÇO: '), writeln(Endereco),
    tab(4), write('TELEFONE: '), writeln(Telefone).
    
imprimir_lista([], _).
imprimir_lista([X|R], Contagem):-
    NContagem is Contagem+1,
    imprimirCliente(NContagem, X),
    imprimir_lista(R, NContagem).
    
imprimirLista(Lista):-
    imprimir_lista(Lista, 0).