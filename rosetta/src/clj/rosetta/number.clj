(ns rosetta.number)

(def fibo-list
  "Lazy sequence of fibonacci numbers starting from 1,1"
  (cons 1 (cons 1 (lazy-seq (map +' fibo-list (rest fibo-list))))))

(defn fibo
  "Generate a list of fibonacci numbers. If n is an int then generate up-to Un,
  if pred is a predicate function that use take-while pred."
  [n-or-pred]
  (if (number? n-or-pred)
    (take n-or-pred fibo-list)
    (take-while n-or-pred fibo-list)))