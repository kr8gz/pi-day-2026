// i did not test this at all

using libc, math;

fn gaussLegendre(iterations: i32) -> f64 {
    let mut a = 1;
    let mut b = 1 / pow(2, 0.5);
    let mut p = 1;
    let mut t = 0.25;

    for i = 0; i < iterations; i += 1 {
        let an = a;

        a = (a + b) / 2;
        b = pow(an * b, 0.5);
        t = t - p * (an - a).square();
        p *= 2;
    }

    return (an - a).square() / (4 * t);
}

fn main() void {
    io::println(gaussLegendre(10));
}