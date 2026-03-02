import Foundation

func gaussLegendre(iterations: Int) -> Double {
    var a: Double = 1;
    var b: Double = 1 / sqrt(2);
    var p: Double = 1;
    var t: Double = 0.25;

    for _ in 1...iterations {
        let an = a;
        let bn = b;
        let pn = p;
        let tn = t;

        a = (an + bn) / 2;
        b = sqrt(an * bn);
        t = tn - pn * pow(an - a, 2);
        p = 2 * pn;
    }

    return pow(a + b, 2) / (4 * t);
}

print(gaussLegendre(iterations: 10));