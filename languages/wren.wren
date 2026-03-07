var gaussLegendre = Fn.new {|iterations|
    var a = 1.0
    var b = 1.0 / 2.0.sqrt
    var p = 1.0
    var t = 0.25

    for (i in 1...iterations) {
        var an = a

        a = (a + b) / 2
        b = (an * b).sqrt
        t = t - p * (an - a).pow(2)
        p = 2 * p
    }

    return (a + b).pow(2) / (4 * t)
}

System.print(gaussLegendre.call(10))