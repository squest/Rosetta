#lang racket

(require rackunit "number.rkt")

(define/provide-test-suite fibo-test

 (display "Testing fibonacci functions\n")

 (check-equal? (fibo 10)
	       '[1 1 2 3 5 8 13 21 34 55])

 (check-equal? (fibo (lambda (x) (< x 100)))
	       '[1 1 2 3 5 8 13 21 34 55 89])

 (display "Testing the predicate function for fibo list\n")

 (check-equal? (fibo? (fibo 100))
	       true)

 (check-equal? (fibo? (fibo (lambda (x) (< x 10000000))))
	       true)

 (let [(n (round (* 10000 (random))))]
   (display "Time taken to generate random numbers of fibo numbers\n")
   (check-equal? (time (fibo? (fibo n))) true)))

