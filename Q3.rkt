#lang racket
(define TOL 1e-6)
(define (term x n)
   (let ((a (* pi pi)) (b (- (* 2 n) 1)))
                (/ (* x x 4) (* b a b))));find the value of the current term of the formula without the -1

(define (p_cos x)
  (if (null? x)
      x;if the given value is null end otherwise call the help function 
      (p_cosHelp x 1 1)))

(define (p_cosHelp x n last)
  (define ans (- 1 (term x n)));current term
  (define diff (abs(- ans last)));difference between this term and the last term
  (cond ((<= diff TOL) ans);this condition just check if ans is at tolerance or not if not recall
        ((> diff TOL) (* ans (p_cosHelp x (+ 1 n) ans))))
  )




  

  