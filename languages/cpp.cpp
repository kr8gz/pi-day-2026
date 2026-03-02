#include <iostream>
#include <cmath>

double gauss_legendre(int iterations) {
    double a = 1;
    double b = 1.f / sqrtl(2);
    double p = 1;
    double t = .25f;
    
    for (int i = 1; i <= iterations; i++) {
        double an = a;
        double bn = b;
        double pn = p;
        double tn = t;
        
        a = (an + bn) / 2;
        b = sqrtl(an * bn);
        t = tn - pn * powl(an - a, 2);
        p = 2 * pn;
    }
    
    return powl(a + b, 2) / (4 * t);
}

int main()
{
    std::cout << gauss_legendre(10);

    return 0;
}