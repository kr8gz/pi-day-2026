let gauss_legendre iterations = 
    let a = ref 1.0 in
    let b = ref (1.0 /. sqrt 2.0) in
    let p = ref 1.0 in
    let t = ref 0.25 in

    for _ = 1 to iterations do
        let an = !a in
        let bn = !b in
        let pn = !p in
        let tn = !t in

        a := (an +. bn) /. 2.0;
        b := sqrt (an *. bn);
        t := tn -. pn *. (an -. !a) ** 2.0;
        p := 2.0 *. pn;
    done;

    (!a +. !b) ** 2.0 /. (4.0 *. !t)

let () = Printf.printf "%.10f\n" (gauss_legendre 10)