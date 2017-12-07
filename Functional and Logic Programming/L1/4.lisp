; 4.
; a) Write a function to return the sum of two vectors.
; b) Write a function to get from a given list the list of all atoms, on any
;  level, but on the same order. Example:
;  (((A B) C) (D E)) ==> (A B C D E)
; c) Write a function that, with a list given as parameter, inverts only continuous
;  sequences of atoms. Example:
;  (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))
; d) Write a list to return the maximum value of the numerical atoms from a list, at superficial level.

; a)
(defun sum-vectors ( x1 y1 x2 y2 )
	(cons (+ x1 x2) (+ y1 y2))
)

(print (sum-vectors 1 2 3 4))
;=> '(4 6)

; b)
(defun deparanthesise (l)
	(cond
		((null l) nil)
		((listp (car l)) (append (deparanthesise (car l)) (deparanthesise (cdr l))))
		(T (append (list (car l)) (deparanthesise (cdr l))))
	)
)

(print (deparanthesise '(((A B) C) (D E))))
;  (((A B) C) (D E)) ==> (A B C D E)

; c)
(defun reverse-atoms (l aux)
	(cond
		((null l) (reverse aux))
		((listp (car l))  (append (reverse aux) (cons (reverse-atoms (car l) nil) (reverse-atoms (cdr l) nil))))
		(T (reverse-atoms ( cdr l ) (append aux (list (car l)))))
	)
)

(print (reverse-atoms '(a b c (d (e f) g h i)) nil))
; => (c b a (d (f e) i h g))

; d)
(defun superficial-max (l)
	(cond
		((null l) 0)
		((listp (car l)) (superficial-max (cdr l)))
		(T (max (car l) (superficial-max (cdr  l))))
	)
)

(print (superficial-max '(1 2 4 2 (8 (10 9)))))
; => 4
