seleciona(Fornecedor):-
	write(fornecedor(Fornecedor)), writeln('.'), read(Item),
	escreve_item(Item, Fornecedor).

escreve_item(Item, _):-
	Item=end_of_file, !, write(Item), writeln('.').

escreve_item(Item, Fornecedor):-
	Item=item(N, M, P, Fornecedor), !, write(item(N, M, P)),
	writeln('.'), read(ProxItem), escreve_item(ProxItem, Fornecedor).

escreve_item(_, Fornecedor):-
	read(ProxItem), escreve_item(ProxItem, Fornecedor).
