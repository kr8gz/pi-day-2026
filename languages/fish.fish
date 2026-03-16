function guass_legendre -a iterations
    set opt "--scale=max"

    set a "1"
    set b $(math $opt "1 / sqrt(2)")
    set p "1"
    set t "0.25"

    for i in $(seq 10)
        set an $a;

        set a $(math $opt "($a + $b) / 2")
        set b $(math $opt "sqrt($an * $b)")
        set t $(math $opt "$t - $p * ($a - $an) ^ 2")
        set p $(math $opt "$p * 2")
    end

    echo $(math $opt "($a + $b) ^ 2 / (4 * $t)")
end

echo $(guass_legendre 10)
