program main;

function gauss_legendre(iterations: integer): double;
var
    a := 1.0;
    b := 1.0 / sqrt(2);
    p := 1.0;
    t := 0.25;

begin
    for var i := 1 to iterations do
    begin
        var an := a;
        var bn := b;
        var pn := p;
        var tn := t;

        a := (an + bn) / 2;
        b := sqrt(an * bn);
        t := tn - pn * (an - a) ** 2;
        p := 2 * pn;
    end;

    result := (a + b) ** 2 / (4 * t);
end;

begin
    writeln(gauss_legendre(10));
end.