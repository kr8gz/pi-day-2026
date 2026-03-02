def gaussLegendre(iterations) {
    double a = 1d;
    double b = 1d / Math.sqrt(2d);
    double p = 1d;
    double t = 0.25d;

    for (int i = 1; i < iterations; i++) {
        def an = a;
        def bn = b;
        def pn = p;
        def tn = t;

        a = (an + bn) / 2;
        b = Math.sqrt(an * bn);
        t = tn - pn * Math.pow(an - a, 2);
        p = 2 * pn;
    }

    return Math.pow(a + b, 2) / (4 * t);
}

println(gaussLegendre(10));