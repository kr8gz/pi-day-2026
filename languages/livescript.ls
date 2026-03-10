gaussLegendre = (iterations) ->
    a = 1
    b = 1 / Math.sqrt(2)
    p = 1
    t = 0.25

    for i from 1 to iterations
        an = a

        a = (a + b) / 2
        b = Math.sqrt(an * b)
        t = t - p * (an - a) ** 2
        p *= 2
    
    return (a + b) ** 2 / (4 * t)

console.log gaussLegendre 10