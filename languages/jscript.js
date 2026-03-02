function gaussLegendre(iterations) {
    var a = 1;
    var b = 1 / Math.sqrt(2);
    var p = 1;
    var t = 0.25;
    
    for (var i = 1; i <= iterations; i++) {
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

WScript.Echo(gaussLegendre(10));