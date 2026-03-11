load('math.star', 'math')

def gauss_legendre(iterations):
    a = 1.0
    b = 1.0 / math.sqrt(2)
    p = 1.0
    t = 0.25

    for i in range(0, 10):
        an = a

        a = (a + b) / 2
        b = math.sqrt(an * b)
        t = t - p * (an - a) * (an - a)
        p = 2 * p
    
    return (a + b) * (a + b) / (4 * t)

print(gauss_legendre(10))