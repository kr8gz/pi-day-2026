import math

fn gauss_legendre(iterations int) f64 {
    mut a := 1.0
    mut b := 1.0 / math.sqrt(2.0)
    mut p := 1.0
    mut t := 0.25

    for _ in 1..(iterations + 1) {
        mut an := a
        mut bn := b
        mut pn := p
        mut tn := t

        a = (an + bn) / 2
        b = math.sqrt(an * bn)
        t = tn - pn * math.pow(an - a, 2)
        p = 2 * pn
    }

    return math.pow(a + b, 2) / (4 * t)
}

fn main() {
    println(gauss_legendre(10))
}