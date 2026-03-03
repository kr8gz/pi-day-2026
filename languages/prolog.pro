pi(Iterations, Iterations, A, B, T, _P, Pi) :-
    Pi is ((A + B) ^ 2) / (4 * T).

pi(I, Iterations, A, B, T, P, Pi) :-
    I < Iterations,
    A1 is (A + B) / 2,
    B1 is sqrt(A * B),
    T1 is T - P * (A1 - A) ^ 2,
    P1 is 2 * P,
    I1 is I + 1,
    pi(I1, Iterations, A1, B1, T1, P1, Pi).

gauss_legendre(Pi, N) :-
    A is 1.0,
    B is 1.0 / sqrt(2.0),
    T is 0.25,
    P is 1.0,
    pi(0, N, A, B, T, P, Pi).

:- initialization(main).
main :- 
    gauss_legendre(Pi, 10),
    write(Pi),
    nl.