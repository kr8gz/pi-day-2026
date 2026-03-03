proc gaussLegendre {iterations} {
    set a 1
    set b [expr 1 / { sqrt(2) }]
    set p 1
    set t 0.25

    for { set i 1 } { $i < $iterations } { incr i } {
        set a1 [expr ($a + $b) / 2]
        
        set b [expr { sqrt($a * $b) }]
        set t [expr $t - $p * pow($a - $a1, 2)]
        set p [expr 2 * $p]
        set a [expr $a1]
    }

    return [expr pow($a + $b, 2) / (4 * $t)]
}

puts [ gaussLegendre {10} ]