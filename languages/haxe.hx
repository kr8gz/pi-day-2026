class Main {
    static function gaussLegendre(iterations: Int): Float {
        var a = 1.0;
        var b = 1.0 / Math.sqrt(2.0);
        var p = 1.0;
        var t = 0.25;

        for (i in 1...iterations) {
            var an = a;
            var bn = b;
            var pn = p;
            var tn = t;

            a = (an + bn) / 2;
            b = Math.sqrt(an * bn);
            t = tn - pn * Math.pow(an - a, 2);
            p = 2 * pn;
        }

        return Math.pow(a + b, 2) / (4 * t);
    }
    static public function main() {
        trace(gaussLegendre(10));
    }
}