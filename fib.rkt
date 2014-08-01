#lang typed/racket

(: fibRec (Integer Integer Integer -> Integer))
(define (fibRec qianVal zuoVal rem) 
  (if (= 0 rem) zuoVal (fibRec zuoVal (+ qianVal zuoVal) (- rem 1))))

(: fib (Integer -> Integer))
(define (fib x) 
  (cond
    ((= x 0) 0)
    ((= x 1) 1)
    (else (fibRec 0 1 (- x 1)))))

(: doWork (Integer Integer -> Integer))
(define (doWork acc rem)
  (if (= 0 rem) acc (doWork 
                     (+ acc (fib (remainder (+ 1 acc) 50))) 
                     (- rem 1))))

(define arg (string->number (vector-ref (current-command-line-arguments) 0)))
(define n (if arg arg 0))

(doWork 0 (if n (numerator (inexact->exact (real-part n))) 0))