on gaussLegendre(iterations)
    set a to 1
    set b to (1 / 2 ^ 0.5)
    set p to 1
    set t to 0.25

    repeat iterations times
        set an to a

        set a to ((a + b) / 2)
        set b to ((an * b) ^ 0.5)
        set t to (t - p * (an - a) ^ 2)
        set p to (2 * p)
    end repeat

    return ((a + b) ^ 2) / (4 * t)
end gaussLegendre

set pi to gaussLegendre(10)
display dialog pi