programa_imc :-
    write("Insira seu peso: "),
    read(Peso),
    write("Insira sua altura: "),
    read(Altura),
    calculo_imc(Peso, Altura, Imc),
    write('IMC = '), write(Imc),nl,
    classif_imc(Imc).

calculo_imc(Peso, Altura, Imc):-
    Imc is Peso / Altura^2.

classif_imc(Imc):-
    (Imc >= 20, Imc =< 24.9, write("Peso normal"));
    (Imc >= 25, Imc =< 29.9, write("Obesidade grau 1"));
    (Imc >= 30, Imc =< 39.9, write("Obesidade grau 2"));
    (Imc >= 40, write("Obesidade grau 3")).
