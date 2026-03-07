gausslegendre =: 3 : 0
    a =. 1
    b =. 1 % %: 2
    p =. 1
    t =. 0.25
    for_i. i. y do.
        an =. a
        a =. (a + b) % 2
        b =. %: an * b
        t =. t - p * *: an - a
        p =. 2 * p
    end.
    (*: a + b) % 4 * t
)
echo gausslegendre 10