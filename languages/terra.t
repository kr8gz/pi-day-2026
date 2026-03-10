local C = terralib.includec("stdio.h")
local CMath = terralib.includec("math.h")

terra gaussLegendre(iterations : int)
    var a : double = 1.0
    var b : double = 1.0 / CMath.sqrt(2.0)
    var p : double = 1.0
    var t : double = 0.25

    for i = 0, iterations do
        var an = a

        a = (a + b) / 2
        b = CMath.sqrt(an * b)
        t = t - p * (an - a) * (an - a)
        p = 2 * p
    end

    return (a + b) * (a + b) / (4 * t)
end

print(gaussLegendre(10))