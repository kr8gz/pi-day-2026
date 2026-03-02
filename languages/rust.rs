fn gauss_legendre(iterations: i32) -> f64 {
    let mut a: f64 = 1.0;
    let mut b: f64 = 1.0 / (2.0_f64).sqrt();
    let mut p: f64 = 1.0;
    let mut t: f64 = 0.25;
    
    for _ in 1..(iterations + 1) {
        let an = a;
        let bn = b;
        let pn = p;
        let tn = t;
        
        a = (an + bn) / 2.0;
        b = (an * bn).sqrt();
        t = tn - pn * (an - a).powf(2.0);
        p = 2.0 * pn;
    }
    
    return (a + b).powf(2.0) / (4.0 * t);
}

fn main() {
    println!("{}", gauss_legendre(10));
}