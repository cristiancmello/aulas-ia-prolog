% Faça um programa que permita descobrir se um dado ano tem 365 ou 366 dias. 
% Pode-se dizer que, em geral, os anos têm 365 dias. Os anos que são 
% divisíveis por 4 e que não são divisíveis por 100 constituem exceção 
% e têm 366 dias.
dias_no_ano(Ano, 366):-
    0 is Ano mod 4,
    not(0 is Ano mod 100), !.
    
dias_no_ano(Ano, 365).