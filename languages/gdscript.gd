extends Node

func gauss_legendre(iterations):
    var a = 1
    var b = 1 / sqrt(2)
    var p = 1
    var t = 0.25

    for i in range(0, iterations):
        var an = a

        a = (a + b) / 2
        b = sqrt(an * b)
        t = t - p * (an - a) ** 2
        p *= 2
    
    return (a + b) ** 2 / (4 * t)

func _ready():
    print(gauss_legendre(10))