#lang racket
(define (1over L)
  (map (lambda (N);This maps the lambda function to the whole list L in 1over 
       (cond ((null? N) null);if null return null
             ((eqv? 0 N) 0);if the number for the lambda function is zero return zero
             (else (/ 1 N)))) L));otherwise take the number and 1over it 

