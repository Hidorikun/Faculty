; 3.
; a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.
; b) Write a function to get from a given list the list of all atoms, on any
;  level, but reverse order. Example:
;  (((A B) C) (D E)) ==> (E D C B A)
; c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list.
; d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.

; a)
(defun __insert (l e k i)
	(cond
		((and (= k i) (null l)) (list e))
		((null l) nil)
		((= k i) (cons (car l) (cons e (__insert (cdr l) e k 1))))
		(T (cons (car l) (__insert (cdr l) e k (+ i 1))))
	)
)

(defun _insert (l e)
	(__insert l e 2 1)
)

(print (_insert '(1 2 3 4 5 6 7 8 9 10) 0))
; => '(1 2 0 3 4 0 5 6 0 7 8 0 9 10 0)

; b)
(defun _gcd (a b)
		(if (= b 0) a (_gcd b (mod a b)))
)

(defun list-gcd (l)
	(cond
		((and (listp (car l)) (= (list-length l) 1)) (list-gcd (car l)))
		((listp (car l)) (_gcd (list-gcd (car l)) (list-gcd (cdr l))))
		((= (list-length l) 1) (car l))
		(T (_gcd (car l) (list-gcd (cdr l))))
	)
)

(print (list-gcd '( 36 ( 72 6 ))))
; => 6

; c)
(defun _merge-unsorted (a b)
	(cond
		((null a) b)
		(T (cons (car a) (_merge-unsorted (cdr a) b)))
	)
)

(print (_merge-unsorted '(1 2) '(4 5)) )
; => (1 2 4 5)

; (defun _reverse (l)
; 	(print l)
; 	(cond
; 		((null l) nil)
; 		((and (= (list-length l) 1) (not (listp (car l)))) (list (car l)))
; 		((listp (car l)) (_merge-unsorted (_reverse (cdr l)) (_reverse (car l))))
; 		(T (cons (_reverse (cdr l)) (car l)))
; 	)
; )
;
; (print (_reverse '(((A B) C) (D E))))
; => (E D C B A)

; d)
(defun occurences (l e)
	(cond
		((null l) 0)
		((listp (car l)) (+ (occurences (car l) e) (occurences (cdr l) e)))
		((= (car l) e) (+ 1 (occurences (cdr l) e)))
		(t (occurences (cdr l) e))
	)
)

(print (occurences '(1 (1 2) (1)) 1))
; => 3
