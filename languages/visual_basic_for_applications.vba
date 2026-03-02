Function GaussLegendre(iterations As Integer) As Double
    Dim a As Double = 1
    Dim b As Double = 1 / Sqr(2)
    Dim p As Double = 1
    Dim t As Double = 0.25

    Dim n As Integer
    For i = 1 to iterations
        Dim an as Double: an = a
        Dim bn as Double: bn = b
        Dim pn as Double: pn = p
        Dim tn as Double: tn = t

        a = (an + bn) / 2
        b = Sqr(an * bn)
        t = tn - pn * (an - a) ^ 2
        p = 2 * pn
    Next i

    GaussLegendre = (a + b) ^ 2 / (4 * t)
End Function

Sub Main()
    Debug.Print GaussLegendre(10)
End Sub