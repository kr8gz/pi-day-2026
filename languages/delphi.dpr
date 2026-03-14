program GaussLegendre;

uses System.Math;

function GaussLegendre(iterations: Integer): Double;
var
    a, b, p, t, an: Double;
    i: Integer;
begin
    a := 1;
    b := 1 / Sqrt(2);
    p := 1;
    t := 0.25;

    for i := 1 to iterations do
    begin
        an := a;

        a := (a + b) / 2;
        b := Sqrt(an * b);
        t := t - p * Sqr(an - a);
        p := 2 * p;
    end;

    Result := Sqr(a + b) / (4 * t);
end;

begin
    Writeln(GaussLegendre(10):0:15);
end.