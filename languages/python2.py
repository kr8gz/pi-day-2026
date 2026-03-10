import math

def gauss_legendre(iterations):
    a = 1
    b = 1 / math.sqrt(2)
    p = 1
    t = 0.25

    for _ in xrange(1, iterations + 1):
        an = a
        bn = b
        pn = p
        tn = t

        a = (an + bn) / 2
        b = math.sqrt(an * bn)
        t = tn - pn * (an - a) ** 2
        p = 2 * pn
    
    return (a + b) ** 2 / (4 * t)

print gauss_legendre(10)