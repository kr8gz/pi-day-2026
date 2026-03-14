FUNCTION GaussLegendre(iterations)
    LOCAL a, b, p, t, an, i

    a := 1.0
    b := 1.0 / Sqrt(2.0)
    p := 1.0
    t := 0.25

    FOR i := 1 TO iterations
        an := a
        
        a := (a + b) / 2.0
        b := Sqrt(an * b)
        t := t - p * (an - a) * (an - a)
        p := 2.0 * p
    NEXT

    RETURN (a + b) * (a + b) / (4.0 * t)

PROCEDURE Main()
    ? Str(GaussLegendre(10))

    RETURN