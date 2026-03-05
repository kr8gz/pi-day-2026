S 10000;

isqrt(n) {
    auto x, prev;
    x = n;
    prev = 0;
    while (prev != x) {
        prev = x;
        x = (x + n / x) / 2;
    }
    x;
}

/* scaled */
ssqrt(n) {
    extrn S;
    isqrt(n * S);
}

gaussLegendre(iterations) {
    extrn S;
    auto a, b, p, t, i, an, diff;

    i = 0;
    a = S;
    p = S;
    t = S / 4;
    b = S * S / ssqrt(2 * S);

    while (i < iterations) {
        an = a;

        a = (a + b) / 2;
        b = ssqrt(an * b / S);
        diff = an - a;
        t = t - p * diff / S * diff / S;
        p =* 2;
        
        i =+ 1;
    }

    (a + b) * (a + b) / (4 * t);
}

main() {
    extrn S, printf;
    auto pi, whole, frac;
    /* because the whole thing is scaled, precision is so bad that 1 pass gives the closest result */
    pi = gaussLegendre(1);
    whole = pi / S;
    frac = pi - whole * S;
    printf("%d.%04d\n", whole, frac);
    return(0);
}