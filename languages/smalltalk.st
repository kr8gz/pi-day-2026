gaussLegendre: iterations
    | a b p t an |
    a := 1.0.
    b := 1.0 / (2.0 sqrt).
    p := 1.0.
    t := 0.25.

    iterations timesRepeat: [
        an := a.

        a := (a + b) / 2.0.
        b := (an * b) sqrt.
        t := t - (p * ((an - a) * (an - a))).
        p := 2.0 * p.
    ].

    ^ ((a + b) * (a + b)) / (4.0 * t)

Transcript show: ((self gaussLegendre: 10) asString); cr.