#lang racket

(require rackunit "sorting.rkt")

(test-case
 "Testing quicksort"

 (display "Testing quicksort\n")

 (check-equal? (quick-sort (shuffle (range 20)))
	       (range 20))
 
 (let [(lst (range 1 10 0.2))]
   (check-equal? (quick-sort (shuffle lst)) lst))
 
 (check-equal? (quick-sort '()) '())

 (display "Time taken for 5000 elements sorting\n")

 (let* [(lst (range 5000))
	(slst (shuffle lst))]
   (check-equal? (time (quick-sort slst)) lst)))

(test-case
 "Testing mergesort"

 (display "Testing mergesort\n")

 (check-equal? (merge-sort (shuffle (range 20)))
	       (range 20))
 
 (let [(lst (range 1 10 0.2))]
   (check-equal? (merge-sort (shuffle lst)) lst))
 
 (check-equal? (merge-sort '()) '())

 (display "Time taken for 5000 elements sorting\n")

 (let* [(lst (range 5000))
	(slst (shuffle lst))]
   (check-equal? (time (merge-sort slst)) lst)))

(test-case
 "Testing insertion sort"

 (display "Testing insertion sort\n")

 (check-equal? (isort (shuffle (range 20)))
	       (range 20))
 
 (let [(lst (range 1 10 0.2))]
   (check-equal? (isort (shuffle lst)) lst))
 
 (check-equal? (isort '()) '())

 (display "Time taken for 5000 elements sorting\n")

 (let* [(lst (range 5000))
	(slst (shuffle lst))]
   (check-equal? (time (isort slst)) lst)))




