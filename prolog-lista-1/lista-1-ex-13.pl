calculo_seculo(Ano, Seculo):-
    AnoInf is truncate((Ano / 100)) * 100,
    AnoSup is AnoInf + 100,
    (
       (Ano > AnoInf, Ano =< AnoSup, Seculo is AnoSup / 100);
       (Ano is AnoInf, NovoAnoSup is Ano, Seculo is NovoAnoSup / 100)
    ).
