gaussLegendre := method(iterations,
    a := 1.0
    b := 1.0 / 2 sqrt
    p := 1.0
    t := 0.25

    iterations repeat(
        an := a
        bn := b
        pn := p
        tn := t

        a = (an + bn) / 2
        b = (an * bn) sqrt
        t = tn - pn * (an - a) pow(2)
        p = 2 * pn
    )

    return (a + b) pow(2) / (4 * t)
)

gaussLegendre(10) println