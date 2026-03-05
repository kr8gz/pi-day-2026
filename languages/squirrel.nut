function gauss_legendre(iterations) {
    local a = 1;
    local b = 1 / sqrt(2);
    local p = 1;
    local t = 0.25;

    for (local i = 1; i < iterations; i++) {
        local an = a;

        a = (a + b) / 2;
        b = sqrt(an * b);
        t = t - p * pow(an - a, 2);
        p *= 2;
    }

    return pow(a + b, 2) / (4 * t);
}

print(gauss_legendre(10));