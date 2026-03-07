include std/math.e

global function gauss_legendre( integer iterations )
    atom a = 1
    atom b = 1 / sqrt(2)
    atom p = 1
    atom t = 0.25

    for i = 1 to iterations do
        atom an = a
        atom bn = b
        atom pn = p
        atom tn = t

        a = (an + bn) / 2
        b = sqrt(an * bn)
        t = tn - pn * power(an - a, 2)
        p = 2 * pn
    end for

    return power(a + b, 2) / (4 * t)
end function

printf(1, "%f\n", gauss_legendre(10))