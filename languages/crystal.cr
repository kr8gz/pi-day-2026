def gauss_legendre(iterations) : Float64
    a : Float64 = 1
    b : Float64 = 1 / Math.sqrt(2.0)
    p : Float64 = 1
    t : Float64 = 0.25

    i = 1
    while i <= iterations
        an = a
        bn = b
        pn = p
        tn = t

        a = (an + bn) / 2
        b = Math.sqrt(an * bn)
        t = tn - pn * (an - a) ** 2
        p = 2 * pn
        
        i += 1
    end

    (a + b) ** 2 / (4 * t)
end

puts gauss_legendre(10)