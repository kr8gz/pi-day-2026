      PROGRAM MAIN
      IMPLICIT NONE
      REAL GLCOMP
      PRINT *, GLCOMP(10)
      END
      function GLCOMP(ITERS)
      IMPLICIT NONE
      REAL GLCOMP
      INTEGER ITERS

      REAL A, B, P, T, AN
      INTEGER I

      A = 1.0
      B = 1.0 / SQRT(2.0)
      P = 1.0
      T = 0.25

      DO 10 I = 1, ITERS
          AN = A

          A = (A + B) / 2
          B = SQRT(AN * B)
          T = T - P * (AN - A) ** 2
          P = 2 * P
10    CONTINUE

      GLCOMP = (A + B) ** 2 / (4 * T)
      END