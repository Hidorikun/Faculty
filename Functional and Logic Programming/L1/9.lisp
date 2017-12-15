; 9.
; a) Write a function that merges two sorted linear lists and keeps double values.
; b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.
; c) Write a function to determines the sum of two numbers in list representation, and returns the
; corresponding decimal number, without transforming the representation of the number from list to
; number.
; d) Write a function to return the greatest common divisor of all numbers in a linear list.

; a)
; merge-sorted(a, b) => merged list
; merge-sorted(a1..an, b1..bn) = b, null a
;														   = a, null b
;															 = a1 U merge-sorted(a2..an, b),  a1 < b1
; 														 = b1 U merge-sorted(a, l2..ln), otherwise
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
; replace(l e r) => list where e is replaced by r at any levels
; replace(l1..ln, e r) = nil, null l
; 										 = replace(l1, e r) U replace(l2..ln, e r), l1 is list
; 										 = l1 U replace(l2..ln, e r)
(defun _replace (l e r)
		(cond
			((null l) nil)
			((listp	(car l)) (cons (_replace (car l) e r) (_replace (cdr l) e r)))
			((= (car l) e) (append r (_replace (cdr l) e r)))
			(T (cons (car l) (_replace (cdr l) e r)))
		)
)

(print (_replace '(1 (2 1 2) 2 2 ( 2 ( 1 ) )) 1 '(3 3) ))
; => (3 3 (2 3 3 2) 2 2 (2 (3 3)))

; c)
; normalise(a, b) => (a, b), both having the same number of elements,
; the shortest one being completed with 0 at front
; normalize(a1..an, b1..bn) = list(a, b), length(a) = length(b)
; 	= normalize( 0 U a1..an, b), length(a) < length(b)
;   = normalize(a, 0 U b1..bn), length(a) > length(b)
(defun normalize (a b)
	(cond
		((= (list-length a) (list-length b)) (list a b))
		((< (list-length a) (list-length b)) (normalize (cons 0 a) b))
		((> (list-length a) (list-length b)) (normalize a (cons 0 b)))
	)
)

(print ( normalize '(1 2 3) '(4 5 6 7 8) ))
; => '( '(0 0 1 2 3) '( 4 5 6 7 8) )

; sum-carry(a, b) => returns the sum and the carry of the 2 numbers represented
; as lists
; sum-carry(a1..an, b1..bn) = (null, 0), null a
; 	= ((digit, r1), carry);
; 			r1, r2 := sum-carry(a2..an, b2..bn);
; 		  sum := a1 + b1 + r2
; 			digit := sum mod 10
; 			carry := sum // 10 , otherwise

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

; sum(a b) => list representing sum of a and b
; sum(a1..an, b1..bn) =
; 	normal_a, normal_b := normalize(a, b);
; 	r1, r2 := normalize(normal_a, normal_b)
;		= (1 U r1), r2 == 1
;   = r1, r2 == 0

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

(print (sum '(1 0) '(9 5)))
; => '(1 0 5)

; d)
; gcd(a, b) = greatest common divisor of a and b
; gcd(a, b) = a, b = 0
; 				  = gcd( b, a mod b ), otherwise
(defun _gcd (a b)
		(if (= b 0) a (_gcd b (mod a b)))
)

; list-gcd(l) => gcd of all elements in the list
; list-gcd(l1..ln) = l1, length(l) == 1
; 							   = gcd(l1, list-gcd(l2..ln)), otherwise
(defun list-gcd (l)
	(cond
		((= (list-length l) 1) (car l))
		(T (_gcd (car l) (list-gcd (cdr l))))
	)
)

(print  (list-gcd '(36 72 78)))
; => 6
