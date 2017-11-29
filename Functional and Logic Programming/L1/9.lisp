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

; c)
(defun normalize (a b)
	(cond
		((= (list-length a) (list-length b)) (list a b))
		((< (list-length a) (list-length b)) (normalize (cons 0 a) b))
		((> (list-length a) (list-length b)) (normalize a (cons 0 b)))
	)
)

(print ( normalize '(1 2 3) '(4 5 6 7 8) ))
; => '( '(0 0 1 2 3) '( 4 5 6 7 8) )

(defun sum-carry (a b)
	(cond
		((null a) (list nil 0 ))
		(T (progn
			(setf result (sum-carry (cdr a) (cdr b)))
			(setf sum (+ (+ (car a) (car b)) (cadr result)))
			(setf digit ( mod sum 10))
			(setf carry (floor sum 10))
			(list (cons digit (car result)) carry)
		))
	)
)

(print (sum-carry '(1 2 3) '(2 3 4)))
; => '( '(3 5 7) 0)

(defun sum (a b)
	(progn
		(setf normalized-lists (normalize a b))
		(setf result (sum-carry (car normalized-lists) (cadr normalized-lists)))
		(if (= (cadr result) 1)
			(cons 1 (car result))
			(car result)
		)
	)
)

(print (sum '(9 9 9) '(1)))
; => '( 1 0 0 0 )

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
