import ceylon.math.float { sqrt }

shared Float gaussLegendre(Integer iterations) {
    variable Float a = 1.0;
    variable Float b = 1.0 / sqrt(2.0);
    variable Float p = 1.0;
    variable Float t = 0.25;

    for (i in 1..iterations) {
        Float an = a;

        a = (a + b) / 2.0;
        b = sqrt(an * b);
        t = t - p * (an - a) ^ 2;
        p *= 2.0;
    }

    return (a + b) ^ 2 / (4.0 * t);
}

shared void run() {
    print(gaussLegendre(10));
}