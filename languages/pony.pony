use "collections"

class GaussLegendre
    var _iterations: USize

    new create(iterations: USize) =>
        _iterations = iterations

    fun ref calculate(): F64 =>
        var a: F64 = 1.0
        var b: F64 = 0.7071067811865476
        var p: F64 = 1.0
        var t: F64 = 0.25

        for i in Range(1, _iterations) do
            let an = a

            a = (a + b) / 2
            b = (an * b).sqrt()
            t = t - (p * (an - a).pow(2))
            p = 2 * p
        end

        (a + b).pow(2) / (4 * t)

actor Main
    new create(env: Env) =>
        let gauss_legendre = GaussLegendre(10)
        env.out.print(gauss_legendre.calculate().string())