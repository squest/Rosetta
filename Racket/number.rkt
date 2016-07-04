#lang racket

(define (fibo? lst)
  (define (iter a b c res)
    (if (= (+ a b) c)
	(or (empty? res)
	    (iter b c (first res) (rest res)))
	false))
  (iter (first lst) (second lst) (third lst)))

(define (fibo n-or-pred)
  (define (iter-n a b i res)
    (if (= i n-or-pred)
	(reverse res)
	(iter-n b (+ a b) (+ 1 i) (cons a res))))
  (define (iter-pred a b res)
    (if (n-or-pred a)
	(iter-pred b (+ a b) (cons a res))
	(reverse res)))
  (if (number? n-or-pred)
      (iter-n 1 1 0 '[])
      (iter-pred 1 1 '[])))

(provide fibo fibo?)
