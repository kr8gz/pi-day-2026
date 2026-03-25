def gauss_legendre [iterations] {
    mut a = 1.0
    mut b = 1.0 / (2 | math sqrt)
    mut p = 1.0
    mut t = 0.25
    
    for _ in (seq 1 10) {
        let an = $a

        $a = ($a + $b) / 2.0
        $b = ($an * $b) | math sqrt
        $t = $t - $p * ($a - $an) ** 2
        $p *= 2
    }

    ($a + $b) ** 2 / (4.0 * $t)
}

gauss_legendre 10