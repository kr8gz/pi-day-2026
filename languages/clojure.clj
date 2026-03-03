(defn gauss-legendre [iterations]
    (loop [a 1.0 b (/ 1.0 (Math/sqrt 2.0)) tt 0.25 p 1.0 i 0]
        (if (= i iterations)
            (/ (Math/pow (+ a b) 2) (* 4.0 tt))
            (let [a1 (/ (+ a b) 2.0)]
                (recur a1
                    (Math/sqrt (* a b))
                    (- tt (* p (Math/pow (- a1 a) 2)))
                    (* 2.0 p)
                    (inc i))))))

(println (gauss-legendre 10))