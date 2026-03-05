let gaussLegendre = (iterations) => {
    let a = ref(1.0);
    let b = ref(1.0 /. sqrt(2.0));
    let p = ref(1.0);
    let t = ref(0.25);

    for (i in 1 to iterations) {
        let an = a^;

        a := (a^ +. b^) /. 2.0;
        b := sqrt(an *. b^);
        t := t^ -. p^ *. (an -. a^) ** 2.0;
        p := 2.0 *. p^;
    };

    (a^ +. b^) ** 2.0 /. (4.0 *. t^);
}

Js.log(gaussLegendre(10));