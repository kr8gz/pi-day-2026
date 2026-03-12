class GaussLegendre {
    static Float gaussLegendre(Int iterations) {
        Float a := 1.0f
        Float b := 1.0f / 2.0f.sqrt()
        Float p := 1.0f
        Float t := 0.25f

        for (i := 0; i < 10; ++i) {
            Float an := a

            a = (a + b) / 2.0f
            b = (an * b).sqrt()
            t = t - p * (an - a).pow(2.0f)
            p *= 2.0f
        }

        return (a + b).pow(2.0f) / (4.0f * t)
    }

    static Void main() {
        echo(gaussLegendre(10))
    }
}