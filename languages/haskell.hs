pi_step :: Int -> (Double, Double, Double, Double)
pi_step 1 = (1, 1 / sqrt(2), 0.25, 1)
pi_step i =
    let (a, b, t, p) = pi_step (i - 1)
        a' = (a + b) / 2
        b' = sqrt (a * b)
        t' = t - p * (a - a') ** 2
        p' = 2 * p
    in (a', b', t', p')

gauss_legendre :: Int -> Double
gauss_legendre i =
    let (a, b, t, p) = pi_step i
    in (a + b) ** 2 / (4 * t)

main :: IO ()
main = print (gauss_legendre 10)