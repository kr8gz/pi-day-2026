#Requires AutoHotkey v1.1

GaussLegendre(iterations) {
    A := 1
    B := 1 / Sqrt(2)
    P := 1
    T := 0.25

    Loop, %iterations% {
        An := A

        A := (A + B) / 2
        B := Sqrt(An * B)
        T := T - P * (An - A) ** 2
        P := 2 * P
    }

    return (A + B) ** 2 / (4 * T)
}

Pi := GaussLegendre(10)

MsgBox %Pi%