Module VBModule
    Function GaussLegendre(iterations As Integer)
        Dim a As Double = 1
        Dim b As Double = 1 / Math.Sqrt(2)
        Dim p As Double = 1
        Dim t As Double = 0.25

        Dim i As Integer
        For i = 1 to iterations
            Dim an = a
            Dim bn = b
            Dim pn = p
            Dim tn = t

            a = (an + bn) / 2
            b = Math.sqrt(an * bn)
            t = tn - pn * Math.Pow(an - a, 2)
            p = 2 * pn
        Next i

        return Math.Pow(a + b, 2) / (4 * t)
    End Function

    Sub Main()
        Console.WriteLine(GaussLegendre(10))
    End Sub
End Module