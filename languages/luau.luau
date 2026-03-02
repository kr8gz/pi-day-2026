function gauss_legendre(iterations: number): number
    local a = 1
    local b = 1 / math.sqrt(2)
    local p = 1
    local t = 0.25

    for i = 1, iterations, 1 do
        local an = a
        local bn = b
        local pn = p
        local tn = t

        a = (an + bn) / 2
        b = math.sqrt(an * bn)
        t = tn - pn * (an - a) ^ 2
        p = 2 * pn
    end

    return (a + b) ^ 2 / (4 * t)
end

print(gauss_legendre(10))