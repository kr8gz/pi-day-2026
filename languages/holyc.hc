F64 GaussLegendre(I32 iterations) {
    F64 a = 1;
    F64 b = 1 / sqrt(2.0);
    F64 p = 1;
    F64 t = 0.25;

    for (I64 i = 0; i < iterations; ++i) {
        F64 an = a;

        a = (a + b) / 2.0;
        b = sqrt(an * b);
        t = t - p * pow(an - a, 2.0);
        p = 2.0 * p;
    }

    return pow(a + b, 2.0) / (4.0 * t);
}

U8 Main() {
    "%f",GaussLegendre(10);
}