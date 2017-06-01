/* Predicados de entrada e saída: read e write
 */
saudacao:-
    write('Hello, World!').

inserir_nome(Nome):-
    write('Insira seu nome: '),
    read(Nome).

boas_vindas(Nome):-
    write('Olá, '), write(Nome), write('!'), nl.

programa:-
    inserir_nome(Nome),
    boas_vindas(Nome),
    write(usuario(Nome)),  % stdout => usuario(cristian), e.g.
    write('Para sair, digite end: '),
    read(Input),
    not(Input = end),  % condicao de saída
    programa. % caso digite algo diferente de end, repita o programa.
