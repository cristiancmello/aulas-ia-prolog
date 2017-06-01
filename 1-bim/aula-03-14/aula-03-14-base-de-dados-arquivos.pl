/*
 BASE DE DADOS: Trabalhando com Arquivos em Prolog
 Sinopse:
    - consult: faz leitura de um arquivo, carregando o conte�do para a
    mem�ria de trabalho


    - make: reconsulta todos os arquivos carregados que foram
    modificados

    - assertz e asserta:
       * assertz(F): coloca-se uma frase F no fim da def. correspondente
                     a ela


    - dynamic
    - retract
    - abolish
    - univ ::= <variavel-livre> =.. <lista>
    - functor
    - arg
    - see, seen e seeing
    - tell, told e telling

    Ler: see: direcionar
	 seen: finalizar

    Gravar/Escrever: tell direcionar a escrita para arquivo
		     told: volta a escrita para a tela
 */

liste(Arquivo):- see(Arquivo), % Olhando Arquivo
 nl,read(Frase), % L� uma Frase do Arquivo
 escreva(Frase), % Vai escrever a frase.
 seen.

escreva(Frase) :- write(Frase), nl,
 Frase = end_of_file, !. /* P�ra leitura quando
 end_of_file � encontrado. */

escreva(_) :-
 read(Outra_Frase), % L� Outra_Frase
 escreva(Outra_Frase).
