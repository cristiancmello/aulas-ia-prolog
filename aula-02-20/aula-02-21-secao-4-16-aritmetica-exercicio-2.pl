% cliente(nome, credito).
cliente(cristian, 120).
cliente(ana, 2000).
cliente(jose, 1500).

% item_estoque(Item, Valor, Qtd).
item_estoque(biscoito, 2.4, 120).
item_estoque(sabao_em_po, 8.69, 53).
item_estoque(sabonete, 2.10, 100).

valida_compra(Cliente, Item, Qtd):-
    cliente(Cliente, TaxaDeCredito),
    item_estoque(Item, ValorItem, QtdItem),
    ValorCompra is ValorItem * Qtd,
    TaxaDeCredito >= ValorCompra,
    Qtd =< QtdItem.
