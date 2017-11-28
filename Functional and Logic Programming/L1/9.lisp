; 9.
; a) Write a function that merges two sorted linear lists and keeps double values.
; b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.
; c) Write a function to determines the sum of two numbers in list representation, and returns the
; corresponding decimal number, without transforming the representation of the number from list to
; number.
; d) Write a function to return the greatest common divisor of all numbers in a linear list.

; a)
(defun _merge-sorted (a b)
	(cond
		((null a) b)
		((null b) a)
		((<= (car a) (car b)) (cons (car a) (_merge-sorted (cdr a) b)))
		(T (cons (car b) (_merge-sorted a (cdr b))))
	)
)

(print (_merge-sorted '(1 2 3) '(3 4 4 5 7)))
; => (1 2 3 3 4 4 5 7)

; b)
(defun _merge-unsorted (a b)
	(cond
		((null a) b)
		(T (cons (car a) (_merge-unsorted (cdr a) b)))
	)
)

(print (_merge-unsorted '(1 2) '(4 5)) )
; => (1 2 4 5)

(defun _replace (l e r)
		(cond
			((null l) nil)
			((listp	(car l)) (cons (_replace (car l) e r) (_replace (cdr l) e r)))
			((= (car l) e) (_merge-unsorted r (_replace (cdr l) e r)))
			(T (cons (car l) (_replace (cdr l) e r)))
		)
)

(print (_replace '(1 (2 1 2) 2 2 ( 2 ( 1 ) )) 1 '(3 3) ))
; => (3 3 (2 3 3 2) 2 2 (2 (3 3)))

; d)
(defun _gcd (a b)
		(if (= b 0) a (_gcd b (mod a b)))
)

(defun list-gcd (l)
	(cond
		((= (list-length l) 1) (car l))
		(T (_gcd (car l) (list-gcd (cdr l))))
	)
)

(print  (list-gcd '(36 72 78)))
; => 6
