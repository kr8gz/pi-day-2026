float gauss_legendre(int iterations) {
    float a = 1.0;
    float b = 1.0 / sqrt(2.0);
    float p = 1.0;
    float t = 0.25;

    for (int i = 0; i < iterations; i = i + 1) {
        float an = a;

        a = (a + b) / 2.0;
        b = sqrt(an * b);
        t = t - p * (an - a) ** 2;
        p = 2.0 * p;
    }

    return (a + b) ** 2 / (4.0 * t);
}

int main() {
    write(sprintf("%f\n", gauss_legendre(10)));
    return 0;
}