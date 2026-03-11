using Toybox.Application as App;
using Toybox.System;
using Toybox.Math;

function gaussLegendre(iterations) {
    var a = 1.0d;
    var b = 1.0d / Math.sqrt(2.0d);
    var p = 1.0d;
    var t = 0.25d;

    for (var i = 0; i < iterations; i++) {
        var an = a;

        a = (a + b) / 2;
        b = Math.sqrt(an * b);
        t = t - p * Math.pow(an - a, 2);
        p *= 2;
    }

    return Math.pow(a + b, 2) / (4 * t);
}

class GaussLegendreApp extends App.AppBase {
    function onStart() {
        System.println(gaussLegendre(10));
    }
}