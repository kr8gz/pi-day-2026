program main;
uses math;

function gauss_legendre(iterations: integer): double;
var
    a, b, p, t, an, bn, pn, tn: double;
    n: integer;

begin
    a := 1;
    b := 1 / sqrt(2);
    p := 1;
    t := 0.25;

    for i := 1 to iterations do
    begin
        an := a;
        bn := b;
        pn := p;
        tn := t;

        a := (an + bn) / 2;
        b := sqrt(an * bn);
        t := tn - pn * Power(an - a, 2);
        p := 2 * pn;
    end;

    gauss_legendre := Power(a + b, 2) / (4 * t);
end;

begin
    writeln( gauss_legendre(10) );
end.