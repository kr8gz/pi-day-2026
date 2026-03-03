class
    PI

create
    make

feature
    make
        do
            print (gauss_legendre (10))
            print ("%N")
        end
        
    gauss_legendre ( iterations : INTEGER ) : REAL_64
        local
            a  : REAL_64
            b  : REAL_64
            p  : REAL_64
            t  : REAL_64
            an : REAL_64
            bn : REAL_64
            pn : REAL_64
            i  : INTEGER
        do
            a := 1.0
            b := 1.0 / sqrt (2.0)
            p := 1.0
            t := 0.25
            from
                i := 1
            until
                i > iterations
            loop
                an := a
                bn := b
                pn := p

                a := (an + bn) / 2.0
                b := sqrt (an * bn)
                t := t - pn * (an - a) * (an - a)
                p := 2.0 * pn
                i := i + 1
            end

            Result := (a + b) * (a + b) / (4 * t)
        end