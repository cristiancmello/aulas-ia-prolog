% Uso de Exceção para que se permita descobrir se um animal voa.
% Sabe-se que um animal voa se for um pássaro que não seja ema, pinguim
% ou avestruz.
voa(passaro(pinguim)):- fail.
voa(passaro(ema)):- fail.
voa(passaro(avestruz)):- fail.
voa(passaro(X)).

% Os três primeiros predicados rejeitam que um animal que voa seja
% o especificado. Para rejeitar, provoca-se uma EXCEÇÃO.
% Caso o animal seja diferente dos listas, deduz-se que o animal seja
% um passaro que voa.

% Faça a pergunta
% ?- voa(passaro(ema)).
% false.

% Se não tivesse um ! (corte) antes do fail, o computador começaria
% escolhendo a segunda frase para responder a "?- voa(passaro(ema))".
% Chegaria a resposta false, mas desistiria dela e apelaria para a
% 4ª frase, CONCLUINDO ERRADAMENTE QUE EMAS VOAM.

% ?- voa(passaro(pombo)).
% true.