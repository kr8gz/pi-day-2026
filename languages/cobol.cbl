identification division.
program-id. MAIN.

data division.
       working-storage section.
       01 WS-RESULT PIC S9(5)V9(10).
       01 WS-ITERATIONS PIC 9(5) VALUE 10.

procedure division.
    call 'GAUSS_LEGENDRE' using by reference WS-RESULT, by reference WS-ITERATIONS.
    display WS-RESULT.
    stop run.

end program MAIN.

identification division.
program-id. GAUSS_LEGENDRE.

data division.
       working-storage section.
       01 A PIC S9(5)V9(10).
       01 B PIC S9(5)V9(10).
       01 P PIC S9(5)V9(10).
       01 T PIC S9(5)V9(10).
       01 AN PIC S9(5)V9(10).
       01 BN PIC S9(5)V9(10).
       01 PN PIC S9(5)V9(10).
       01 TN PIC S9(5)V9(10).
       01 I PIC 9(5) VALUE 1.
       linkage section.
       01 LS-RESULT PIC S9(5)V9(10).
       01 LS-ITERATIONS PIC 9(5).

procedure division using by reference LS-RESULT, by reference LS-ITERATIONS.
    move 1.0 to A.
    compute B = 1.0 / FUNCTION SQRT(2.0).
    move 0.25 to T.
    move 1.0 to P.
    perform until I > LS-ITERATIONS
       move A to AN
       move B to BN
       move T to TN
       move P to PN

       compute A = (AN + BN) / 2.0
       compute B = FUNCTION SQRT(AN * BN)
       compute T = TN - PN * (AN - A) * (AN - A)
       compute P = 2.0 * PN
       add 1 to I
    end-perform.
    compute LS-RESULT = (A + B) * (A + B) / (4.0 * T).
exit program.