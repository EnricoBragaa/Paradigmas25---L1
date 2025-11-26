pai(cronos, zeus).
mae(rhea, zeus).
pai(cronos, hades).
mae(rhea, hades).
pai(cronos, poseidon).
mae(rhea, poseidon).
pai(cronos, hera).
mae(rhea, hera).
pai(cronos, demeter).
mae(rhea, demeter).
pai(cronos, hestia).
mae(rhea, hestia).

irmaos_germanos(A, B) :-
    pai(P, A), pai(P, B),
    mae(M, A), mae(M, B),
    A \= B.
