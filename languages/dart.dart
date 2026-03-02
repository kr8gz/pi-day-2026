import 'dart:math';

double gaussLegendre(int iterations) {
    double a = 1;
    double b = 1 / sqrt(2);
    double p = 1;
    double t = 0.25;
    
    for (var i = 1; i <= iterations; i++) {
        var an = a;
        var bn = b;
        var pn = p;
        var tn = t;
        
        a = (an + bn) / 2;
        b = sqrt(an  * bn);
        t = tn - pn * pow(an - a, 2);
        p = 2 * pn;
    }
    
    return pow(a + b, 2) / (4 * t);
}

void main() {
    print(gaussLegendre(10));
}