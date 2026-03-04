double gauss_legendre(int iterations) {
    double a = 1;
    double b = 1 / Math.sqrt(2);
    double p = 1;
    double t = 0.25;

    for (var i = 1; i <= iterations; i++) {
        double an = a;

        a = (a + b) / 2;
        b = Math.sqrt(an * b);
        t = t - p * Math.pow(an - a, 2);
        p *= 2;
    }

    return Math.pow(a + b, 2) / (4 * t);
}

void main() {
    print(@"$(gauss_legendre(10))");
}