#lang racket

(define (quick-sort lst)
  (if (<= (length lst) 1)
      lst
      (let* [(c1 (first lst))
	     (smaller (filter (lambda (x) (<= x c1)) (rest lst)))
	     (larger (filter (lambda (x) (> x c1)) (rest lst)))]
	(append (quick-sort smaller)
		(list c1)
		(quick-sort larger)))))

(provide quick-sort)




