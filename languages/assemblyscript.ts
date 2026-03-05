export function gaussLegendre(iterations: i32): f64 {
    var a: f64 = 1, b: f64 = 1 / f64.sqrt(2), p: f64 = 1, t: f64 = 0.25;

    for (var i = 1; i <= iterations; i++) {
        var an: f64 = a;
        
        a = (a + b) / 2;
        b = f64.sqrt(an * b);
        t = t - p * (an - a) ** 2;
        p *= 2;
    }

    return (a + b) ** 2 / (4 * t);
}