FUNCTION GaussLegendre(Iterations AS INTEGER) AS DOUBLE
    DIM A AS DOUBLE
    DIM B AS DOUBLE
    DIM P AS DOUBLE
    DIM T AS DOUBLE
    DIM AN AS DOUBLE
    DIM BN AS DOUBLE
    DIM PN AS DOUBLE
    DIM I AS INTEGER

    A = 1.0
    B = 1.0 / SQR(2.0)
    P = 1.0
    T = 0.25

    FOR I = 1 TO Iterations
        AN = A
        BN = B
        PN = P

        A = (AN + BN) / 2
        B = SQR(AN * BN)
        T = T - PN * (AN - A) * (AN - A)
        P = 2 * P
    NEXT I

    RETURN (A + B) * (A + B) / (4 * T)
END FUNCTION

PRINT GaussLegendre(10)