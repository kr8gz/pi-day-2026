CLASS ycl_gauss_legendre DEFINITION
    PUBLIC
    FINAL
    CREATE PUBLIC.
    PUBLIC SECTION.
        CLASS-METHODS gauss_legendre
            IMPORTING iv_iterations TYPE i
            RETURNING VALUE(rv_result) TYPE f.
ENDCLASS.

CLASS ycl_gauss_legendre IMPLEMENTATION.
    METHOD gauss_legendre.
        DATA: lv_a TYPE f VALUE '1.0',
              lv_b TYPE f,
              lv_p TYPE f VALUE '1.0',
              lv_t TYPE f VALUE '0.25',
              lv_an TYPE F.

        lv_b = 1 / sqrt( 2 ).

        DO iv_iterations TIMES.
            lv_an = lv_a.
            lv_a = ( lv_a + lv_b ) / 2.
            lv_b = sqrt( lv_an * lv_b ).
            lv_t = lv_t - lv_p * ( lv_an - lv_a ) ** 2
            lv_p = lv_p * 2.
        ENDDO.
    
        rv_result = ( lv_a + lv_b ) ** 2 / ( 4 * lv_t ).
    ENDMETHOD.
ENDCLASS.

REPORT y_gauss_legendre.

START-OF-SELECTION.
    DATA: lv_result TYPE f.

    lv_result = ycl_gauss_legendre=>gauss_legendre( iv_iterations = 10 ).

    WRITE: / lv_result.