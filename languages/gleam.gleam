import gleam/io
import gleam/float
import gleam/result

fn pi(i: Int) -> #(Float, Float, Float, Float) {
    case i {
        0 -> #(1.0, 1.0 /. result.unwrap(float.square_root(2.0), 0.0), 0.25, 1.0)
        _ -> {
            let #(a, b, t, p) = pi(i - 1)
            let a1 = {a +. b} /. 2.0

            #(a1, result.unwrap(float.square_root(a *. b), 0.0), t -. p *. result.unwrap(float.power(a -. a1, 2.0), 0.0), 2.0 *. p)
        }
    }
}

fn gauss_legendre(iterations: Int) -> Float {
    let #(a, b, t, _) = pi(iterations)
    result.unwrap(float.power(a +. b, 2.0), 0.0) /. {4.0 *. t}
}

pub fn main() {
    io.println(float.to_string(gauss_legendre(10)))
}