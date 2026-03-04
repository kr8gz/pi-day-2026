function gauss_legendre(iterations) {
    a = 1.0
    b = 1.0 / sqrt(2.0)
    p = 1.0
    t = 0.25

    for (i = 1; i <= iterations; i++) {
        an = a
        a = (a + b) / 2
        b = sqrt(an * b)
        t = t - p * (a - an) ^ 2
        p *= 2
    }

    return (a + b) ^ 2 / (4 * t)
}

BEGIN {
    print gauss_legendre(10)
}