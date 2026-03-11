func gauss_legendre iterations {
    a = 1.0
    b = 1.0 / sqrt(2.0)
    p = 1.0
    t = 0.25

    for i = 1 to iterations {
        an = a
        
        a = (a + b) / 2
        b = sqrt(an * b)
        t = t - p * (an - a) ** 2
        p = 2 * p
    }

    return (a + b) ** 2 / (4 * t)
}

see gauss_legendre(10)