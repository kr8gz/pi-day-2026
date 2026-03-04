import ballerina/io;

function gaussLegendre(int iterations) returns float {
    float a = 1.0;
    float b = 1.0 / (2.0).sqrt();
    float p = 1.0;
    float t = 0.25;

    foreach int _ in int:range(1, iterations, 1) {
        float an = a;
        float bn = b;
        float pn = p;
        float tn = t;

        a = (an + bn) / 2.0;
        b = (an * bn).sqrt();
        t = tn - pn * (an - a).pow(2);
        p = 2.0 * pn;
    }

    return (a + b).pow(2) / (4.0 * t);
}

public function main() {
    io:println(gaussLegendre(10));
}