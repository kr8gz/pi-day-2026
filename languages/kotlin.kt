import kotlin.math.sqrt
import kotlin.math.pow

fun gaussLegendre(iterations: Int): Double {
    var a: Double = 1.0
    var b: Double = 1.0 / sqrt(2.0)
    var p: Double = 1.0
    var t: Double = 0.25
    
    for (i in 1..iterations) {
        val an = a
        val bn = b
        val pn = p
        val tn = t
        
        a = (an + bn) / 2
        b = sqrt(an * bn)
        t = tn - pn * (an - a).pow(2)
        p = 2 * pn
    }
    
    return (a + b).pow(2) / (4 * t)
}

fun main() {
    println(gaussLegendre(10))
}