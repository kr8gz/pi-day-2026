gaussLegendre: iterations = (
    |   a <- 1.0.
        b <- 1.0 / sqrt(2).
        p <- 1.0.
        t <- 0.25.
        an
    |
    1 to: iterations Do: [||
        an: a.
        a: (a + b) / 2.0.
        b: (b * an) sqrt.
        t: t - (p * ((an - a) * (an - a))).
        p: p * 2.0.
    ]
    ((a + b) * (a + b)) / (4.0 * t)
).

(gaussLegendre: 10) printLine.