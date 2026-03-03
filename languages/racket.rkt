#lang racket

(define (gauss-legendre iterations)
    (let ([a 1.0]
          [b (/ 1.0 (sqrt 2.0))]
          [p 1.0]
          [t 0.25])
        (for ([i (in-range 1 iterations)])
            (let ([a1 (/ (+ a b) 2)])
                (set!-values (a b t p) (values
                    a1
                    (sqrt (* a b))
                    (- t (* p (expt (- a a1) 2)))
                    (* p 2)
                ))))
        (/ (expt (+ a b) 2) (* t 4))))

(print (gauss-legendre 10))