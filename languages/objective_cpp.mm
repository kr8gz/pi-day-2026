#import <Foundation/Foundation.h>

double gaussLegendre (int iterations) {
    double a = 1;
    double b = 1 / sqrt(2);
    double p = 1;
    double t = 0.25;
    
    for (int i = 1; i <= iterations; i++) {
        double an = a;
        double bn = b;
        double pn = p;
        double tn = t;
        
        a = (an + bn) / 2;
        b = sqrt(an * bn);
        t = tn - pn * powl(an - a, 2);
        p = 2 * pn;
    }
    
    return powl(a + b, 2) / (4 * t);
}

int main (int argc, const char * argv[]) {
    NSLog(@"%.10f", gaussLegendre(10));
}