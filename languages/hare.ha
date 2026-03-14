use fmt;
use math;

fn gauss_legendre(iterations: uint) f64 = {
    let a = 1.0;
    let b = 1.0 / math::sqrtf64(2.0);
    let t = 0.25;
    let p = 1.0;

    for (let i = 0u; i < iterations; i += 1) {
        let an = a;

        a = (a + b) / 2.0;
        b = math::sqrtf64(an * b);
        t = t - p * math::powf64(an - a, 2.0);
        p *= 2.0;
    };

    return math::powf64(a + b, 2.0) / (4.0 * t);
};

export fn main() void = {
    fmt::printfln("{}", gauss_legendre(10))!;
};