pi_gl :: Int -> (Double, Double, Double, Double)
pi_gl 1 = (1, 1 / sqrt(2), 0.25, 1)
pi_gl i =
    let (a, b, t, p) = pi_gl (i - 1)
        a' = (a + b) / 2
        b' = sqrt (a * b)
        t' = t - p * (a - a') ** 2
        p' = 2 * p
    in (a', b', t', p')

gauss_legendre :: Int -> Double
gauss_legendre i =
    let (a, b, t, p) = pi_gl i
    in (a + b) ** 2 / (4 * t)

main :: IO ()
main = print (gauss_legendre 10)