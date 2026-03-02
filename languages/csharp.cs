using System;

public class Pi
{
    public static double GaussLegendre(int iterations) {
        double a = 1;
        double b = 1 / Math.Sqrt(2);
        double p = 1;
        double t = 0.25;
        
        for (int i = 0; i <= iterations; i++) {
            double an = a;
            double bn = b;
            double pn = p;
            double tn = t;
            
            a = (an + bn) / 2;
            b = Math.Sqrt(an * bn);
            t = tn - pn * Math.Pow(an - a, 2);
            p = 2 * pn;
        }
        
        return Math.Pow(a + b, 2) / (4 * t);
    }
    
    public static void Main(string[] args)
    {
        Console.WriteLine(Pi.GaussLegendre(10));
    }
}