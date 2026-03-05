package main

import "core:fmt"
import "core:math"

gauss_legendre :: proc(iterations: int) -> f64 {
    a := 1.0;
    b := 1.0 / math.sqrt_f64(2.0);
    p := 1.0;
    t := 0.25;

    for i := 0; i < iterations; i += 1 {
        an := a;

        a = (a + b) / 2.0;
        b = math.sqrt_f64(an * b);
        t = t - p * math.pow_f64(an - a, 2);
        p *= 2.0;
    }

    return math.pow_f64(a + b, 2) / (4.0 * t);
}

main :: proc() {
    fmt.printf("%.10f\n", gauss_legendre(10));
}