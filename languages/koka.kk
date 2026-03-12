module koka

import std/num/float64

fun gauss-legendre(iterations)
    var a := 1.0
    var b := 1.0 / sqrt(2.0)
    var p := 1.0
    var t := 0.25

    repeat(iterations)
        val an = a

        a := (a + b) / 2.0
        b := sqrt(an * b)
        t := t - p * (an - a) ^ 2.0
        p := 2.0 * p

    (a + b) ^ 2.0 / (4.0 * t)


fun main()
    println(gauss-legendre(10))