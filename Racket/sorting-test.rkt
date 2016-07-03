#lang racket

(require rackunit "sorting.rkt")

(test-case
 "Testing quicksort"

 (display "Entering sorting tests\n")

 (display "Testing quicksort\n")

 (check-equal? (range 20)
	       (quick-sort (shuffle (range 20))))
 
 (let [(lst (range 1 10 0.2))]
   (check-equal? lst (quick-sort (shuffle lst))))
 
 (check-equal? (quick-sort '()) '())

 (display "Time taken for 5000 elements sorting\n")

 (let* [(lst (range 5000))
	(slst (shuffle lst))]
   (check-equal? lst (time (quick-sort slst)))))


