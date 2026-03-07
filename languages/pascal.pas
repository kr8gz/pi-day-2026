program main;
uses math;

function gauss_legendre(iterations: integer): double;
var
    a, b, p, t, an, bn, pn, tn: double;
    i: integer;

begin
    a := 1;
    b := 1 / Sqrt(2);
    p := 1;
    t := 0.25;

    for i := 1 to iterations do
    begin
        an := a;
        bn := b;
        pn := p;
        tn := t;

        a := (an + bn) / 2;
        b := Sqrt(an * bn);
        t := tn - pn * Sqr(an - a);
        p := 2 * pn;
    end;

    gauss_legendre := Sqr(a + b) / (4 * t);
end;

begin
    writeln( gauss_legendre(10) );
end.