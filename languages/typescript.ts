const gaussLegendre = (iterations: number) => {
    let a = 1;
    let b = 1 / Math.sqrt(2);
    let p = 1;
    let t = 0.25;
    
    for (let i = 1; i <= iterations; i++) {
        const an = a;
        const bn = b;
        const pn = p;
        const tn = t;
        
        a = (an + bn) / 2;
        b = Math.sqrt(an * bn);
        t = tn - pn * (an - a) ** 2;
        p = 2 * pn;
    }
    
    return (a + b) ** 2 / (4 * t);
}

console.log(gaussLegendre(10));