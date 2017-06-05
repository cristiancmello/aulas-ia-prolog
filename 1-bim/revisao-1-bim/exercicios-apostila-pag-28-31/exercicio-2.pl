% valida_compra(<cliente>, <item>, <qtd>)
% cliente(<nome>, <taxa_de_credito>)
cliente(ana, 120).
cliente(jose, 32).
cliente(maria, 14).

% item(<nome>, <estoque>, <preco>)
item(biscoito, 10, 1.40).
item(macarrao, 12, 4.00).
item(feijao, 30, 8.45).

valida_compra(Cliente, Item, Quantidade):-
    cliente(Cliente, TaxaDeCredito),
    item(Item, QtdItemEstoque, PrecoItem),
    Quantidade =< QtdItemEstoque,
    TaxaDeCredito >= (Quantidade * PrecoItem).