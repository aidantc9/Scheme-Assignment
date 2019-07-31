#lang racket
;a)
(define (separator? x);creating the separator check 
  (cond ((char=? x  #\space) #t)
        ((char=? x  #\tab) #t)
        ((char=? x  #\newline) #t);these three lines check if its one of the 3 separators
        (else #f)));otherwise it is not a seperator so false

;b)

(define (cpy L)
  (cond ((null? L) '());if null return empty list 
        ((separator? (car L)) '());similarly if its a seperator return the empty list
        ((cons (car L) (cpy (cdr L))))));otherwise recall cpy recursive call so go back up stack and add first char of current L

;c)
(define (drop L);works alot like the last one 
  (cond ((null? L) '());if null return empty list
        ((separator? (car L)) (cdr L));if its a seperator return the end of the list
        (#t (drop (cdr L)))));otherwise just recall drop with cdr of list 

;d)
(define (same? L1 L2)
  (cond ((or (null? L1) (null? L2) ) #t);cleared the list reach base case therfore true
        ((not (char=? (car L1)  (car L2))) #f);the first chars each list are diff therefore false 
        ((same? (cdr L1) (cdr L2)))));recall func


;e)

(define (replace IL SL CL)
  (cond ((null? IL) '());base case ie list is empty so return null and start going up stack
        ((and (same? IL SL) (eq? (findSep IL) null)) SL);the SL ie portion of the list that is to be charged is found but a seperator is not found so just return SL
        ((same? IL SL) (append CL (cons (findSep IL) (replace (drop IL) SL CL))));the SL is found and the separator is found so calling replace with rest of list and appending the extra CL and sep once going up stack
        ((eq? (findSep IL) null) (cpy IL));no sperator found so return copy of list without seperator 
        (else (append (cpy IL) (cons (findSep IL) (replace (drop IL) SL CL))))));no separator found so call replace again and append same list because IL not Same with SL

(define (findSep L);does what the name implies it find a seperator and is used as a helper function
  (if (null? L)
      null;return null when a seperator is not found
      (if (separator? (car L));if a seperator is found return it 
          (car L)
          (findSep (cdr L)))));else recall the func


  
