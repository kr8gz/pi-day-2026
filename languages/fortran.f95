PROGRAM main
    IMPLICIT NONE
    print *, gauss_legendre(10)

CONTAINS
    FUNCTION gauss_legendre(iterations) result(pi)
        IMPLICIT NONE;
        INTEGER, INTENT(IN) :: iterations
        REAL :: pi

        REAL :: a, b, p, t, an, bn, pn, tn
        INTEGER :: i

        a = 1.0
        b = 1.0 / sqrt(2.0)
        p = 1.0
        t = 0.25

        do i = 1, iterations
            an = a
            bn = b
            pn = p
            tn = t

            a = (an + bn) / 2
            b = sqrt(an * bn)
            t = tn - pn * (an - a) ** 2
            p = 2 * pn
        end do

        pi = (a + b) ** 2 / (4 * t)
    END FUNCTION gauss_legendre
END PROGRAM main