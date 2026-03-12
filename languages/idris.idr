module Main

record State where
    constructor MkState
    a, b, p, t : Double

piStep : State -> State
piStep s =
    let a1 = (s.a + s.b) / 2.0
    in MkState
        { a = a1
        , b = sqrt (s.a * s.b)
        , p = 2.0 * s.p
        , t = s.t - (s.p * ((s.a - a1) * (s.a - a1)))
        }

iterate : Nat -> State -> State
iterate 0     s = s
iterate (S n) s = iterate n (piStep s)

gaussLegendre : Nat -> Double
gaussLegendre n =
    let s = iterate n (MkState 1.0 (sqrt 0.5) 1.0 0.25)
    in ((s.a + s.b) * (s.a + s.b)) / (4.0 * s.t)

main : IO ()
main = printLn (gaussLegendre 10)