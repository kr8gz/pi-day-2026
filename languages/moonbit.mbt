fn gauss_legendere(iterations: Int) -> Double {
    let mut a = 1.0;
    let mut b = 1.0 / (2.0).sqrt();
    let mut p = 1.0;
    let mut t = 0.25;

    for x = 0; x < iterations + 1; x = x + 1{
        let an = a;

        a = (a + b) / 2.0;
        b = (an * b).sqrt();
        t = t - p * @math.pow(a - an, 2);
        p *= 2;
    }

    return @math.pow(a + b, 2) / (4.0 * t);
}

fn main {
    println(gauss_legendere(10));
}
