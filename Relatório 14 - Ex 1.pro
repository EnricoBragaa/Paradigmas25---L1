pai(cronos, zeus).
mae(rhea, zeus).
pai(cronos, hades).
mae(rhea, hades).
pai(cronos, poseidon).
mae(rhea, poseidon).

filho(X,Y) :- pai(Y,X).
filho(X,Y) :- mae(Y,X).

dominio(zeus, ceu).
dominio(zeus, trovoes).
dominio(poseidon, mar).
dominio(hades, submundo).

divindade_olimpica(D) :-
    filho(D, cronos),
    (dominio(D, ceu) ; dominio(D, mar) ; dominio(D, submundo)).
