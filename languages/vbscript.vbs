Function GaussLegendre(iterations)
    Dim a, b, p, t, n, an, bn, pn, tn
    a = 1
    b = 1 / Sqr(2)
    p = 1
    t = 0.25

    For i = 1 To iterations
        an = a
        bn = b
        pn = p
        tn = t
        
        a = (an + bn) / 2
        b = Sqr(an * bn)
        t = tn - pn * (an - a) ^ 2
        p = 2 * pn
    Next

    GaussLegendre = (a + b) ^ 2 / (4 * t)
End Function

WScript.Echo GaussLegendre(10)