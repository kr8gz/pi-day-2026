module pi

function gaussLegendre = |iterations| {
    var a = 1.0;
    var b = 1.0 / Math.sqrt(2.0);
    var p = 1.0;
    var t = 0.25;

    for (var i = 0; i < iterations; i = i + 1) {
        let an = a;

        a = (a + b) / 2;
        b = Math.sqrt(an * b);
        t = t - p * Math.pow(an - a, 2);
        p = p * 2;
    }

    return Math.pow(a + b, 2) / (4 * t);
}

function main = |args| {
    println(gaussLegendre(10));
}