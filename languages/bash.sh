#!/bin/bash

gauss_legendre() {
    local iterations=$1
    local scale=1000000

    local a=$scale
    local b=707107
    local p=$scale
    local t=250000

    for ((i = 1; i <= iterations; i++)); do
        local an=$a

        a=$(( (a + b) / 2 ))
        local n=$(( an * b / scale ))
        local sqrt_input=$(( scale * n ))

        local prev=0
        b=$sqrt_input
        while [[ $prev -ne $b ]]; do
            prev=$b
            b=$(( (b + sqrt_input / b) / 2 ))
        done

        local diff=$(( an - a))
        t=$(( t - p * diff / scale * diff / scale ))
        p=$(( 2 * p ))
    done

    local pi=$(( (a + b) * (a + b) / (4 * t) ))
    local whole=$(( pi / scale ))
    local frac=$(( pi - whole * scale ))

    echo "$whole.$frac"
}

gauss_legendre 10