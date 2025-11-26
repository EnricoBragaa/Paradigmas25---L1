progenitor(urano, cronos).
progenitor(cronos, zeus).
progenitor(cronos, hades).
progenitor(cronos, poseidon).
progenitor(cronos, hera).
progenitor(cronos, demeter).
progenitor(cronos, hestia).
progenitor(rhea, zeus).
progenitor(rhea, hades).
progenitor(rhea, poseidon).
progenitor(rhea, hera).
progenitor(rhea, demeter).
progenitor(rhea, hestia).

ancestral(A, D) :-
    progenitor(A, D).
ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).