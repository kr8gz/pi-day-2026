MODULE GaussLegendre;

FROM Math IMPORT sqrt, entier;
FROM RealMath IMPORT sqrt;
FROM IO IMPORT WriteString, WriteReal, Writeln;

VAR
    result: REAL;

PROCEDURE gaussLegendre(iterations: INTEGER): REAL;
VAR
    a, b, p, t, an: REAL;
    i: INTEGER;
BEGIN
    a := 1.0;
    b := 1.0 / sqrt(2.0);
    p := 1.0;
    t := 0.25;

    FOR i := 1 TO iterations DO
        an := a;

        a := (a + b) / 2.0;
        b := sqrt(an * b);
        t := t - p * (an - a) * (an - a);
        p := 2.0 * p;
    END;

    RETURN (a + b) * (a + b) / (4.0 * t);
END gaussLegendre;

BEGIN
    result := gaussLegendre(10);
    WriteReal(result, 15);
    WriteLn;
END GaussLegendre.