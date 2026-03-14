gauss_legendre ← {
    a ← 1.0
    b ← 1.0 ÷ (2.0 * 0.5)
    p ← 1.0
    t ← 0.25

    {
        an ← a

        a ← (a + b) ÷ 2.0
        b ← (an × b) * 0.5
        t ← t - p × (an - a) * 2
        p ← p × 2.0
    } ⍣ ⍵ ⊢ a b p t

    ((a + b) * 2) ÷ (4.0 × t)
}

⎕←gauss_legendre 10