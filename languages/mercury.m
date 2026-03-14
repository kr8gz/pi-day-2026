:- module pi.
:- interface.
:- import_module io.

:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module math, float.

:- pred pi(int::in, int::in, float::in, float::in, float::in, float::in, float::out) is det.

pi(Iterations, Iterations, A, B, T, _P) :- !
    Pi = ((A + B) * (A + B)) / (4.0 * T).
pi(I, Iterations, A, B, T, P, Pi) :-
    I < Iterations,
    A1 = (A + B) / 2.0,
    B1 = sqrt(A * B),
    T1 = T - P * ((A1 - A) * (A1 - A)),
    P1 = 2.0 * P,
    I1 = I + 1,
    pi(I1, Iterations, A1, B1, T1, P1, Pi).

:- pred gauss_legendre(float::in, int::out) is det.

gauss_legendre(N, Pi) :-
    A = 1.0,
    B = 1.0 / sqrt(2.0),
    T = 0.25,
    P = 1.0,
    pi(0, N, A, B, T, P, Pi).

main(!IO) :-
    gauss_legendre(10, Result),
    io.format("%.15f~n", [f(Result)], !IO).