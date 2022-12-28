#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  < Daniel Valadez >					 	;
;  < valadezd@oregonstate.edu >	                	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; your code here

;Warm-upo exercise 
;(define (f lst)
;  (if (null? lst)
 ;     '()
 ;     (cons (+ 1 (car lst)) (f (cdr lst)))))

;(f '(3 1 4 1 5 9))

;Member? Function

(define (member? e lst)
  ;Determine if element "e" is a part of lst

  (if (null? lst)
      #f
  (if (equal? e (car lst))
      #t
      (member? e (cdr lst))))
)

;Set? function
(define (set? lst)
  ;check lst to see if it's a well-formed set.
  ;Well-formed sets are sets in which there are no duplicates.

  ;I'll try to call member? for each item in the lst.
  ;(if (null? lst)
  ;    #f)
  ;This will return the boolean we need to proceed.  
  ;(if (member? (car lst) '(lst))
   ;   #f
  ;(if (equal? (member?(cdr lst) '(lst))) #f)
  ;    #t)

  ;maybe I can use not on the result of the member? function
  ;The line below only checks the first element of the list to the rest. 
  ;(not(member? (car lst) (cdr lst)))
  (if (null? lst)
      #t
  (if (member? (car lst) (cdr lst))
      #f
      (set? (cdr lst))))
)

;Union function
;Takes two lists and returns another
;representing a mathematical union of the two. 
(define (union lst1 lst2)
  ;I think whatever unique values in the first list
  ;can stay there. Check lst2 values against lst1
  ;and then append any new values into lst1.
  (cond ((null? lst2) lst1)
        ((member? (car lst2) lst1)
         (union lst1 (cdr lst2)))
        (else (union (cons (car lst2) lst1) (cdr lst2))))
)

;Intersect function
(define (intersect lst1 lst2)
  ;The opposite here where we want the common values these lists share. 
   (cond
     ((null? lst1)(quote ()))
     ((member? (car lst1) lst2)
      (cons (car lst1)
            (intersect (cdr lst1) lst2)))
     (else (intersect (cdr lst1) lst2)))
)

;Difference Function (only have to wory about lst1 - lst2) 
(define (difference lst1 lst2)
  (cond
    ((null? lst1) '())
    ((member? (car lst1) lst2) (difference (cdr lst1) lst2))
    (#t(cons (car lst1)
             (difference (cdr lst1) lst2))))
)

;(member? 1'(1 2 3 4 5)) ;#t
;(member? 90'(1 2 3 4 5 6)) ;#f
;(set? '(1 2 3 4)) ;#t
;(set? '(1 2 3 4 1)) ;#f
;(set? '(4 1 1 8)) #f
;(union '(1 2 3 4) '(1 2 3 5 6 7))
;(intersect '(1 2 3 4 5 6 7 8 9) '(1 10 11 14 25 4 7 901 8))
;(difference '(1 2 5 6 7) '(1 2 3 4 5))


;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))