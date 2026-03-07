namespace qsharp {
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    function GaussLegendre(iterations : Int) : Double {
        mutable a = 1.0;
        mutable b = 1.0 / Sqrt(2.0);
        mutable p = 1.0;
        mutable t = 0.25;

        for (i in 1 .. iterations) {
            let an = a;

            set a = (a + b) / 2.0;
            set b = Sqrt(an * b);
            set t = t - p * (an - a) * (an - a);
            set p = 2.0 * p;
        }

        return (a + b) * (a + b) / (4.0 * t);
    }

    operation PiMain() : Unit {
        let pi = GaussLegendre(10);
        Message($"{pi}");
    }
}