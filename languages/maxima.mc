gauss_legendre(iterations) := block(
    [a: 1.0, b: 1.0/sqrt(2.0), t: 0.25, p: 1.0, a1],

    for i: 1 thru iterations do (
        a1: (a + b) / 2.0,
        b: sqrt(a * b),
        t: t - p * (a1 - a)^2,
        p: 2.0 * p,
        a: a1
    ),

    (a + b)^2 / (4.0 * t)
);

print(gauss_legendre(10));