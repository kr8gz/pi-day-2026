use Math;

proc gaussLegendre(iterations: int): real {
    var a: real = 1.0;
    var b: real = 1.0 / Math.sqrt(2.0);
    var p: real = 1.0;
    var t: real = 0.25;

    for i in 1..iterations {
        var an: real = a;

        a = (a + b) / 2;
        b = Math.sqrt(an * b);
        t = t - p * (an - a) ** 2;
        p = 2 * p;
    }

    return (a + b) ** 2 / (4 * t);
}

writeln(gaussLegendre(10));