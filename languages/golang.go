package main
import (
    "fmt"
    "math"
)

func gaussLegendre(iterations int) float64 {
    a := 1.0;
    b := 1.0 / math.Sqrt(2.0);
    p := 1.0;
    t := 0.25;
    
    for i := 0; i < iterations; i++ {
        an := a;
        bn := b;
        pn := p;
        tn := t;
        
        a = (an + bn) / 2;
        b = math.Sqrt(an * bn);
        t = tn - pn * math.Pow(an - a, 2);
        p = 2 * pn;
    }
    
    return math.Pow(a + b, 2) / (4 * t);
}

func main() {
  	fmt.Println(gaussLegendre(10));
}