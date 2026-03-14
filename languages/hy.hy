(defn gauss-legendre [iterations]
    (setv a 1.0)
    (setv b (/ 1.0 (** 2.0 0.5)))
    (setv tt 0.25)
    (setv p 1.0)
    
    (for [i (range iterations)]
        (setv a1 (/ (+ a b) 2.0))
        (setv b (** (* a b) 0.5))
        (setv tt (- tt (* p (** (- a1 a) 2))))
        (setv p (* 2.0 p))
        (setv a a1))
        
    (/ (** (+ a b) 2) (* 4.0 tt)))

(print (gauss-legendre 10))