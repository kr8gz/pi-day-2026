def gauss_legendre (iterations: i32): f64 =
    let (a, b, p, t) =
        loop (a, b, p, t) = (1.0f64, 1.0f64 / f64.sqrt 2.0f64, 1.0f64, 0.25f64)
        for i < iterations do
            let a' = (a + b) / 2.0f64
            let b' = f64.sqrt (a * b)
            let t' = t - p * (a - a') * (a - a')
            let p' = 2.0f64 * p
            in (a', b', p', t')
        
    in ((a + b) * (a + b)) / (4.0f64 * t)

entry main : f64 = gauss_legendre 10i32