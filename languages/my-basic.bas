def gauss_legendre(iterations)
    a = 1
    b = 1 / sqr(2)
    p = 1
    t = 0.25

    for i = 1 to iterations
        an = a

        a = (a + b) / 2
        b = sqr(an * b)
        t = t - p * (an - a) * (an - a)
        p = 2 * P
    next

    return (a + b) * (a + b) / (4 * t)
enddef

print gauss_legendre(10)