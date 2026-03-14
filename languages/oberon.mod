MODULE Pi;

IMPORT Math, Out;

PROCEDURE GaussLegendre (iterations : INTEGER) : REAL;
VAR a, b, p, t, an : REAL;
    i : Integer;
BEGIN
    a := 1.0;
    b := 1.0 / Math.sqrt(2.0);
    p := 1.0;
    t := 0.25;

    FOR i := 1 TO iterations DO
        an := a;

        a := (a + b) / 2.0;
        b := Math.sqrt(an * b);
        t := t - p * (an - a) * (an - a);
        p := 2.0 * p;
    END;

    RETURN (a + b) * (a + b) / (4.0 * t);
END GaussLegendre;

BEGIN
    Out.Real(GaussLegendre(10), 15);
    Out.Ln;
END Pi.