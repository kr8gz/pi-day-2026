package pi

class GaussLegendre {
    def static gaussLegendre(int iterations) {
        var a = 1.0;
        var b = 1.0 / Math.sqrt(2.0);
        var p = 1.0;
        var t = 0.25;

        for (i : 1..iterations) {
            val an = a;
            
            a = (a + b) / 2.0;
            b = Math.sqrt(an * b);
            t = t - p * Math.pow(an - a, 2);
            p *= 2.0;
        }

        return Math.pow(a + b, 2) / (4.0 * t);
    }

    def static void main(String[] args) {
        println(gaussLegendre(10));
    }
}