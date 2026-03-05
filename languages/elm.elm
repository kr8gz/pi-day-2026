import Html exposing (text)

type alias PiState = { a : Float, b : Float, t : Float, p : Float }

pi : Int -> PiState
pi i =
    case i of
        0 -> 
            { a = 1.0, b = 1.0 / sqrt 2.0, t = 0.25, p = 1 }
        _ ->
            let s = pi (i - 1)
                a1 = (s.a + s.b) / 2.0
                b1 = sqrt (s.a * s.b)
                t1 = s.t - s.p * (s.a - a1) ^ 2.0
                p1 = 2.0 * s.p
            in { a = a1, b = b1, t = t1, p = p1 }

gaussLegendre : Int -> Float
gaussLegendre iterations =
    let s = pi iterations
    in (s.a + s.b) ^ 2.0 / (4 * s.t)

main = text (String.fromFloat (gaussLegendre 10))