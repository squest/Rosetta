#lang racket

(require rackunit
	 rackunit/text-ui
	 "number-test.rkt"
	 "sorting-test.rkt")

(run-tests fibo-test 'normal)
(run-tests sorting-tests 'normal)

