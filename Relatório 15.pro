disciplina(logica, computacao, 4).
disciplina(prolog, computacao, 4).
disciplina(ia, computacao, 6).
disciplina(calculo1, matematica, 6).
disciplina(algebra, matematica, 4).
disciplina(fisica1, fundamental, 4).
disciplina(quimica, fundamental, 4).
disciplina(estatistica, matematica, 4).

concluiu(joao, logica).
concluiu(joao, prolog).
concluiu(joao, ia).
concluiu(maria, calculo1).
concluiu(maria, algebra).
concluiu(maria, fisica1).
concluiu(carlos, logica).
concluiu(carlos, prolog).
concluiu(ana, fisica1).

prerequisito(logica, prolog).
prerequisito(prolog, ia).
prerequisito(calculo1, estatistica).
prerequisito(fisica1, calculo1).

% EXERCÍCIO 1
alto_impacto(D) :-
    disciplina(D, _, Creditos),
    Creditos > 5,
    findall(X, prerequisito(D, X), Lista),
    length(Lista, N),
    N >= 2.

% EXERCÍCIO 2
falta_concluir(Aluno, Disciplina) :-
    prerequisito(Disciplina, _),
    not(concluiu(Aluno, Disciplina)).

aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, Area, _),
    Area \= fundamental,
    not(falta_concluir(Aluno, Disciplina)).

% EXERCÍCIO 3
especialista_comp(Aluno) :-
    findall(D, (concluiu(Aluno, D), disciplina(D, computacao, _)), Lista),
    length(Lista, N),
    N >= 2.

deficiencia_mat(Aluno) :-
    not((concluiu(Aluno, D), disciplina(D, matematica, _))).

% EXERCÍCIO 4
disciplina_raiz(D) :-
    disciplina(D, _, _),
    not(prerequisito(_, D)).

disciplina_folha(D) :-
    disciplina(D, _, _),
    not(prerequisito(D, _)).

% QUERIES
% Exercício 1
?- alto_impacto(D).
?- disciplina(D, matematica, 4), not(prerequisito(D, _)).

% Exercício 2
?- falta_concluir(joao, D).
?- aluno_apto(joao, D).
?- aluno_apto(maria, ia).

% Exercício 3
?- especialista_comp(Aluno).
?- deficiencia_mat(Aluno).
?- especialista_comp(A), deficiencia_mat(A).

% Exercício 4
?- disciplina_raiz(D).
?- disciplina_folha(D).
?- disciplina_raiz(D), disciplina(D, Area, _), Area \= aplicacoes.