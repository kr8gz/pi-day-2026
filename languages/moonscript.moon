gauss_legendre = (iterations) ->
    a = 1
    b = 1 / math.sqrt(2)
    p = 1
    t = 0.25

    for i = 1, iterations
        an = a

        a = (a + b) / 2
        b = math.sqrt(an * b)
        t = t - p * (an - a) ^ 2
        p *= 2
    
    return (a + b) ^ 2 / (4 * t)

print gauss_legendre(10)