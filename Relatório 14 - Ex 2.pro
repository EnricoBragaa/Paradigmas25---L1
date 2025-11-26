dominio(zeus, ceu).
dominio(zeus, trovoes).
dominio(poseidon, mar).
dominio(hades, submundo).
dominio(hera, casamento).
dominio(demeter, agricultura).

habita(zeus, olimpo).
habita(hera, olimpo).
habita(poseidon, olimpo).

deus_maior(D) :-
    habita(D, olimpo),
    findall(X, dominio(D, X), L),
    length(L, N),
    N >= 2.
