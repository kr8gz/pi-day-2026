gaussLegendre = (iterations) ->
    a = 1
    b = 1 / Math.sqrt(2)
    p = 1
    t = 0.25

    for i in [1..iterations]
        an = a
        bn = b
        pn = p
        tn = t

        a = (an + bn) / 2
        b = Math.sqrt(an * bn)
        t = tn - pn * (an - a) ** 2
        p = 2 * pn
    

    return (a + b) ** 2 / (4 * t)


console.log gaussLegendre 10