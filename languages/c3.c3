import std::io;
import std::math;

fn double gauss_legendre(int iterations) {
    double a = 1.0;
    double b = 1.0 / math::sqrt(2);
    double p = 1.0;
    double t = 0.25;

    for (int i = 1; i < iterations + 1; i++) {
        double an = a;

        a = (a + b) / 2.0;
        b = math::sqrt(an * b);
        t = t - p * math::pow((an - a), 2.0);
        p *= 2.0;
    }

    return math::pow((a + b), 2.0) / (4.0 * t);
}

fn int main() {
    io::printfn("%.15f", gauss_legendre(10));
    return 0;
}
