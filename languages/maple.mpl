GaussLegendre := proc(iterations)
    local a, b, p, t, an, i;
    a := 1;
    b := 1 / sqrt(2);
    p := 1;
    t := 0.25;

    for i from 1 to iterations do
        an := a;

        a := (a + b) / 2;
        b := sqrt(an * b);
        t := t - p * (an - a) ^ 2;
        p := 2 * p;
    end do;

    (a + b) ^ 2 / (4 * t)
end proc;

print(GaussLegendre(10));