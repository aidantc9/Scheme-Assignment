#lang racket
(define TOL 1e-6);tolerance of the function 
(define (newtonRhap x f fx)
 (define test (let ((a (f x)) (b (fx x)))
                (- x (/ a b))));computes the term for the current iteration 
 (define check  (abs(- x test)));check holds the difference between the current term and the last one
  (cond ((<= check TOL) test);if difference (check) is less than tolerance end 
        ((> check TOL) (newtonRhap test f fx))));otherwise recall it 
      
 

  

  