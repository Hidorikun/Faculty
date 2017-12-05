; 5.
; a) Write twice the n-th element of a linear list. Example: for (10 20 30 40 50) and n=3 will produce (10
; 20 30 30 40 50).
; b) Write a function to return an association list with the two lists given as parameters.
;  Example: (A B C) (X Y Z) --> ((A.X) (B.Y) (C.Z)).
; c) Write a function to determine the number of all sublists of a given list, on any level.
;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 lists:
; (list itself, (3 ...), (4 5), (6 7), (9 10)).
; d) Write a function to return the number of all numerical atoms in a list at superficial level.

; a)
(defun double-nth (l n)
	(cond
		((null l) nil)
		((= n 1) ( cons (car l) ( cons (car l) (cdr l))))
		(T (cons (car l) (double-nth (cdr l) (- n 1))))
	)
)

(print (double-nth '(10 20 30 40 50) 3))
; => '(10 20 30 30 40 50)

; b)
(defun associate (a b)
	(cond
		((null a) nil)
		(T (cons (list (car a) (car b)) (associate (cdr a) (cdr b))))
	)
)

(print (associate '(a b c) '(x y z)))
; => '((a x) (b y) (c z))

; c)
(defun sublists (l first-touch)
	(cond
		((null l) 0)
		((listp (car l)) (+ (sublists (car l) 1) (sublists (cdr l) 0)))
		(T (+ first-touch (sublists (cdr l) 0)))
	)
)

(print (sublists '(1 2 (3 (4 5) (6 7)) 8 (9 10)) 1))
; => 5

; d)
(defun numbers (l)
	(cond
		((null l) 0)
		((numberp (car l)) (+ 1 (numbers (cdr l))))
		(T (numbers (cdr l)))
	)
)

(print (numbers '(a b 1 2 3 (1 2) 4)))
; => 4
