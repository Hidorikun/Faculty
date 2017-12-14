; 14.
; a) Write a function to return the _union of two sets.
; b) Write a function to return the product of all numerical atoms in a list, at any level.
; c) Write a function to sort a linear list with keeping the double values.
; d) Build a list which contains positions of a minimum numeric element from a given linear list.

; a)
(defun _member (l e)
	(cond
		((null l) nil)
		((= (car l) e) T)
		(T (_member (cdr l) e) )
	)
)

(print (_member '(1 2 3 4) 3))
; => T

(defun _union (a b)
	(cond
		((null a) nil)
		((_member b (car a)) (cons (car a) (_union (cdr a) b)))
		(T (_union (cdr a) b))
	)
)

(print (_union '(1 2 3 4) '(3 4 5)))
; => '(3 4)

; b)
(defun product (l)
	(cond
		((null l) 1)
		((listp (car l)) (* (product (car l)) (product (cdr l))))
		((numberp (car l)) (* (car l) (product (cdr l))))
		(T (product (cdr l)))
	)
)

(print (product '(1 2 (3 3 (4) 6))))
; => 432

; c)
(defun insert (l e)
	(if (null l)
		(list e)
		(progn
			(setf r (insert (cdr l) e))
			(cons (min (car l) (car r)) (cons (max (car l) (car r)) (cdr r)))
		)
	)
)

(print (insert (insert (insert (insert nil 4) 3) 6) 1))
; => '(1 3 4 6)

(defun _sort (l)
	(if (null l)
		nil
		(insert (_sort (cdr l)) (car l))
	)
)

(print (_sort '(4 2 2 5 3 6 7)))
; => '(2 2 3 4 5 6 7)

; d)
(defun list-max (l)
	(cond
		((= (list-length l) 1) (car l))
		(T (max (car l) (list-max (cdr l))))
	)
)

(print (list-max '(1 2 3 1)))
; => 3

(defun _positions (l e i)
	(cond
		((null l) nil)
		((= (car l) e) (cons i (_positions (cdr l) e (+ i 1))))
		(T (_positions (cdr l) e (+ i 1)))
	)
)

(defun positions (l)
	(_positions l (list-max l) 0)
)

(print (positions '(1 2 3 1 2 3 3 1)))
; => '(2 5 6)
