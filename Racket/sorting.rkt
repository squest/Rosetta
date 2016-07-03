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

(define (merge-sort lst)
  (let [(ctr (length lst))]
    (if (<= ctr 1)
	lst
	(let [(half1 (take lst (quotient ctr 2)))
	      (half2 (drop lst (quotient ctr 2)))]
	  (merge (merge-sort half1)
		 (merge-sort half2))))))

(define (merge col1 col2)
  (cond
   [(empty? col1) col2]
   [(empty? col2) col1]
   [true (let [(c1 (first col1))
	       (c2 (first col2))]
	   (if (<= c1 c2)
	       (cons c1 (merge (rest col1) col2))
	       (cons c2 (merge col1 (rest col2)))))]))

(define (take-while pred col)
  (define (iter rcol res)
    (cond
     [(empty? rcol) (reverse res)]
     [(pred (first rcol)) (iter (rest rcol) (cons (first rcol) res))]
     [true (reverse res)]))
  (iter col '[]))

(define (drop-while pred col)
  (cond
   [(empty? col) col]
   [(pred (first col)) (drop-while pred (rest col))]
   [true col]))

(define (isort col)
  (define (iter l1 res)
    (if (empty? l1)
	res
	(let* [(c1 (first l1))
	       (smaller (take-while (lambda (x) (<= x c1)) res))
	       (larger (drop-while (lambda (x) (<= x c1)) res))]
	  (iter (rest l1) (append smaller (list c1) larger)))))
  (if (<= (length col) 1)
      col
      (iter (rest col) (list (first col)))))

(provide quick-sort merge-sort isort)




