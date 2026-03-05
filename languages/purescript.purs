module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Number (sqrt, pow)

type PiState = { a :: Number, b :: Number, t :: Number, p :: Number }

pi :: Int -> PiState
pi 0 = { a: 1.0, b: 1.0 / sqrt 2.0, t: 0.25, p: 1.0 }
pi i =
    let s = pi (i - 1)
        a' = (s.a + s.b) / 2.0
        b' = sqrt (s.a * s.b)
        t' = s.t - s.p * pow (s.a - a') 2.0
        p' = 2.0 * s.p
    in { a: a', b: b', t: t', p: p' }

gaussLegendre :: Int -> Number
gaussLegendre iterations =
    let s = pi iterations
    in pow (s.a + s.b) 2.0 / (4.0 * s.t)

main :: Effect Unit
main = log (show (gaussLegendre 10))