/*
 BASE DE DADOS: Trabalhando com Arquivos em Prolog
 Sinopse:
    - consult
    - make
    - assertz e asserta
    - dynamic
    - retract
    - abolish
    - univ ::= <variavel-livre> =.. <lista>
    - functor
    - arg
    - see, seen	e seeing
    - tell, told e telling

    Ler: see: direcionar
	 seen: finalizar

    Gravar/Escrever: tell direcionar a escrita para arquivo
		     told: volta a escrita para a tela
 */

liste(Arquivo):- see(Arquivo), % Olhando Arquivo
 nl,read(Frase), % Lê uma Frase do Arquivo
 escreva(Frase), % Vai escrever a frase.
 seen.

escreva(Frase) :- write(Frase), nl,
 Frase = end_of_file, !. /* Pára leitura quando
 end_of_file é encontrado. */

escreva(_) :-
 read(Outra_Frase), % Lê Outra_Frase
 escreva(Outra_Frase).
