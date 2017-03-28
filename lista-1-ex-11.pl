dia_atual(data(2017, 3, 5)).

calculo_idade(data_nascimento(AnoAniv, MesAniv, DiaAniv), Idade, Meses):-
    dia_atual(data(AnoAtual, MesAtual, DiaAtual)),
    MesDif is MesAtual-MesAniv,
    DiaDif is DiaAtual-DiaAniv,
    AnoDif is AnoAtual-AnoAniv,
    (
       (
          MesDif >= 0,
          (
            (DiaDif < 0, Idade is AnoAtual-AnoAniv-1);
            (DiaDif >= 0, Idade is AnoAtual-AnoAniv)
          )
       );
       (MesDif < 0, Idade is AnoAtual-AnoAniv-1)
    ).

signo(Pessoa, aries):-
    aniversario(Pessoa, data(D, M, _)),
    ((M=marco, D >= 21); (M=abril, D =< 19)).
