let gaussLegendre = (iterations) => {
    let a: ref<float> = ref(1.0)
    let b: ref<float> = ref(1.0 / Math.sqrt(2.0))
    let p: ref<float> = ref(1.0)
    let t: ref<float> = ref(0.25)

    for _ in 1 to iterations {
        let an = a.contents

        a := (a.contents + b.contents) / 2.0
        b := Math.sqrt(an * b.contents)
        t := t.contents - p.contents * (an - a.contents) ** 2.0
        p := 2.0 * p.contents
    }

    (a.contents + b.contents) ** 2.0 / (4.0 * t.contents)
}

Console.log(gaussLegendre(10))