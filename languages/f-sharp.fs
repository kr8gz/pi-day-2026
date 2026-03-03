let gaussLegendre iterations : float =
    let mutable a = 1.0
    let mutable b = 1.0 / sqrt 2.0
    let mutable p = 1.0
    let mutable t = 0.25

    for i = 1 to iterations do
        let an = a
        let bn = b
        let pn = p
        let tn = t

        a <- (an + bn) / 2.0
        b <- sqrt (an * bn)
        t <- tn - pn * (an - a) ** 2.0
        p <- 2.0 * pn
    
    (a + b) ** 2.0 / (4.0 * t)

printfn "%g" (gaussLegendre 10)