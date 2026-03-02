import std.stdio;
import std.math;

double gaussLegendre(int iterations) {
    double a = 1.0;
    double b = 1.0 / sqrt(2.0);
    double p = 1.0;
    double t = 0.25;

    for (int i = 1; i <= iterations; i++) {
        double an = a;
        double bn = b;
        double pn = p;
        double tn = t;

        a = (an + bn) / 2;
        b = sqrt(an * bn);
        t = tn - pn * pow(an - a, 2);
        p = 2 * p;
    }

    return pow(a + b, 2) / (4 * t);
}

void main() {
    writeln(gaussLegendre(10));
}