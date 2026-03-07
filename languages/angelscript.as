double GaussLegendre(int iterations) {
    double a = 1.0f;
    double b = 1.0f / sqrt(2.0f);
    double p = 1.0f;
    double t = 0.25f;

    for (int i = 0; i < iterations; i++) {
        double an = a;

        a = (a + b) / 2.0f;
        b = sqrt(an * b);
        t = t - p * pow(an - a, 2);
        p *= 2.0f;
    }

    return pow(a + b, 2) / (4.0f * t);
}

void main() {
    print(formatFloat(GaussLegendre(10), '', 10) + '\n');
}