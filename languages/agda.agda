-- what the fuck is this language

open import Agda.Builtin.IO using (IO)
import Agda.Builtin.Float as F
  renaming (primFloatPlus to _+_; primFloatMinus to _-_; primFloatTimes to _*_; primFloatDiv to _/_; primFloatSqrt to sqrt; primShowFloat to show)
open import Agda.Builtin.String using (String)
open import Agda.Builtin.Nat using (Nat; _+_; suc)
open import Agda.Builtin.Unit using (⊤)

postulate putStrLn : String → IO ⊤
{-# FOREIGN GHC import qualified Data.Text.IO as T #-}
{-# COMPILE GHC putStrLn = T.putStrLn #-}

record State : Set where
    field
        a b p t : F.Float

pi : State → State
pi s = 
    let a1 = (State.a s F.+ State.b s) F./ 2.0
    in record
        { a = a1
        ; b = F.sqrt (State.a s F.* State.b s)
        ; p = 2.0 F.* State.p s
        ; t = State.t s F.- (State.p s F.* ((State.a s F.- a1) F.* (State.a s F.- a1)))
        }

iterate : Nat → State → State
iterate 0       s = s
iterate (suc n) s = iterate n (pi s)

gaussLegendre : Nat → F.Float
gaussLegendre n =
    let s = iterate n (record { a = 1.0 ; b = F.sqrt 0.5 ; p = 1.0 ; t = 0.25 })
        sum = State.a s F.+ State.b s
    in (sum F.* sum) F./ (4.0 F.* State.t s)

main : IO ⊤
main = putStrLn (F.show (gaussLegendre 10))