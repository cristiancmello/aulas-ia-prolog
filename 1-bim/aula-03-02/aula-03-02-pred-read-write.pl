/* Predicados de entrada e sa�da: read e write
 */
saudacao:-
    write('Hello, World!').

inserir_nome(Nome):-
    write('Insira seu nome: '),
    read(Nome).

boas_vindas(Nome):-
    write('Ol�, '), write(Nome), write('!'), nl.

programa:-
    inserir_nome(Nome),
    boas_vindas(Nome),
    write(usuario(Nome)),  % stdout => usuario(cristian), e.g.
    write('Para sair, digite end: '),
    read(Input),
    not(Input = end),  % condicao de sa�da
    programa. % caso digite algo diferente de end, repita o programa.
