def gaussLegendre(iterations as int):
    a = 1.0
    b = 1.0 / System.Math.Sqrt(2)
    p = 1.0
    t = 0.25

    for i in range(iterations):
        an = a

        a = (a + b) / 2
        b = System.Math.Sqrt(an * b)
        t = t - p * (an - a) ** 2
        p = 2 * p
    
    return (a + b) ** 2 / (4 * t)

print(gaussLegendre(10))