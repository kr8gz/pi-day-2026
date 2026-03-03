-module(pi).

gauss_legendre(0, Iterations) -> 
    {1.0, 1.0 / math:sqrt(2.0), 0.25, 1.0};

gauss_legendre(I, Iterations) when I == Iterations ->
    {A, B, T, _P} = gauss_legendre(I - 1, Iterations),
    math:pow(A + B, 2) / (4.0 * T);

gauss_legendre(I, Iterations) ->
    {A, B, T, P} = gauss_legendre(I - 1, Iterations),
    A1 = (A + B) / 2.0,
    {A1, math:sqrt(A * B), T - P * math:pow(A1 - A, 2), 2.0 * P}.

main(_) -> 
    io:fwrite("~f~n", [gauss_legendre(10, 10)]).