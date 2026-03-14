gaussLegendre[n_Integer] := Module[
    {a = 1, b = 1/Sqrt[2], p = 1, t = 1/4, an},

    Do[
        an = a;

        a = (a + b) / 2;
        b = Sqrt[an b];
        t = t - p (an - a)^2;
        p = 2 p;
        ,
        {n}
    ];

    N[(a + b)^2/(4 t), 50]
]

gaussLegendre[10]