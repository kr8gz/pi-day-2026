import std.io;
import std.math;

fn gauss_legendare(s32 iterations) {
    double a = 1.0;
    double b = 1.0 / std::math::sqrt(2);
    double p = 1.0;
    double t = 0.25;
    
    for (s32 i = 1, i < iterations + 1, i = i + 1) {
        double an = a;
        
        a = (a + b) / 2.0;
        b = std::math::sqrt(an * b);
        t = t - p * std::math::pow(an - a, 2.0);
        p *= 2;
    }
    
    return std::math::pow(a + b, 2.0) / (4.0 * t);
};

fn main() {
    std::print("{}", gauss_legendare(10));
};