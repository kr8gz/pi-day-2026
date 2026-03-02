object Main {
    def gaussLegendre(iterations: Int) : Double = {
        var a = 1.0;
        var b = 1.0 / math.sqrt(2.0);
        var p = 1.0;
        var t = 0.25;
        
        for ( i <- 1 to iterations ) {
            var an = a;
            var bn = b;
            var pn = p;
            var tn = t;
            
            a = (an + bn) / 2;
            b = math.sqrt(an * bn);
            t = tn - pn * math.pow(an - a, 2);
            p = 2 * pn;
        }
        
        return math.pow(a + b, 2) / (4 * t);
    }
    
    def main(args: Array[String]) = {
        println(gaussLegendre(10));
    }
}