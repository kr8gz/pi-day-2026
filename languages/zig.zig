const std = @import("std");

fn gaussLegendre(iterations: usize) f64 {
    var a: f64 = 1;
    var b: f64 = 1.0 / @sqrt(2.0);
    var p: f64 = 1;
    var t: f64 = 0.25;

    for (1..(iterations + 1)) |_| {
        const an = a;
        const bn = b;
        const pn = p;
        const tn = t;

        a = (an + bn) / 2;
        b = @sqrt(an * bn);
        t = tn - pn * std.math.pow(f64, an - a, 2);
        p = 2 * pn;
    }

    return std.math.pow(f64, a + b, 2) / (4 * t);
}

pub fn main() void {
    std.debug.print("{}", .{gaussLegendre(10)});
}