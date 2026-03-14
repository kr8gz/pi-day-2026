function gauss_legendre(iterations) {
    var a = 1;
    var b = 1 / sqrt(2);
    var p = 1;
    var t = 0.25;

    for (var i = 0; i < iterations; i++) {
        var an = a;

        a = (a + b) / 2;
        b = sqrt(an * b);
        t = t - p * power(an - a, 2);
        p *= 2;
    }

    return power(a + b, 2) / (4 * t);
}

show_debug_message(string(gauss_legendre(10)));