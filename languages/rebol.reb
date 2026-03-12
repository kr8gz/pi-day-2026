REBOL [
    Title: "Gauss-Legendre Algorithm for Pi"
    Version: 1.0.0
    Author: "ggod"
]

gauss_legendre: func [iterations [integer!]] [
    a: 1.0
    b: 1.0 / (square-root 2.0)
    p: 1.0
    t: 0.25

    loop iterations [
        an: a

        a: (a + b) / 2.0
        b: square-root (an * b)
        t: t - (p * ((an - a) * (an - a)))
        p: 2.0 * p
    ]

    (a + b) * (a + b) / (4.0 * t)
]

print gauss_legendre 10