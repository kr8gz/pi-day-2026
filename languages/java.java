class Main {
    static double gaussLegendre(int iterations) {
        double a = 1;
        double b = 1 / Math.sqrt(2);
        double p = 1;
        double t = 0.25;
        
        for (int i = 1; i <= iterations; i++) {
            double an = a;
            double bn = b;
            double pn = p;
            double tn = t;
            
            a = (an + bn) / 2;
            b = Math.sqrt(an * bn);
            t = tn - pn * Math.pow(an - a, 2);
            p = 2 * pn;
        }
        
        return Math.pow(a + b, 2) / (4 * t);
    }
    
    public static void main(String[] args) {
        System.out.printf("%f", Main.gaussLegendre(10));
    }
}