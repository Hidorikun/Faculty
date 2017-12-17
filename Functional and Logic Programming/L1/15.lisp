; 15.
; a) Write a function to insert an element E on the n-th position of a linear list.
; b) Write a function to return the sum of all numerical atoms of a list, at any level.
; c) Write a function to return the set of all _sublists of a given linear list. Ex. For list ((1 2 3) ((4 5) 6)) =>
; ((1 2 3) (4 5) ((4 5) 6))
; d) Write a function to test the equality of two sets, without using the difference of two sets.

; a)
(defun _insert (l n e)
	(cond
		((null l) nil)
		((= n 1) (cons e l))
		(T (cons (car l) (_insert (cdr l) (- n 1) e)))
	)
)

(print (_insert '(1 2 3 4) 3 0))
; => '(1 2 0 3 4)

;b)
(defun _sum (l)
	(cond
		((null l) 0)
		((listp (car l)) (+ (_sum (car l)) (_sum (cdr l))))
		(T (+ (car l) (_sum (cdr l))))
	)
)

(print (_sum '(1 2 (3 (4)) (5))))
; => 15

; c)
(defun list= (a b)
	(cond
		((and (null a) (null b)) T)
		((= (car a) (car b)) (list= (cdr a) (cdr b)))
	)
)

(print (list= '(1 2 3) '(1 2 3)))
; => T

(defun list-member (l e)
	(cond
		((null l) nil)
		((and (listp (car l)) (list= (car l) e)) T)
		((listp (car l)) (or (list-member (car l) e) (list-member (cdr l) e)))
		(T (list-member (cdr l) e))
	)
)

(print (list-member '(1 (2 3) (4 (5 6))) '(2 3)))
; => T

; c)
(defun _sublists (l first-touch)
	(cond
		((null l) nil)
		((= first-touch 1) (cons l (_sublists l 0)))
		((listp (car l)) (append (_sublists (car l) 1) (_sublists (cdr l) 0)))
		(T (_sublists (cdr l) 0))
	)
)

(defun sublists (l)
	(_sublists l 1)
)

(print (sublists '(1 2 (3 (4 5) (6 7)) 8 (4 5))))
; => '( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (4 5) )

(defun make-set (l)
	(if (null l)
		nil
		(progn
			(setf result (make-set (cdr l)))
			(if (list-member result (car l))
				result
				(cons (car l) result)
			)
		)
	)
)

(print (make-set '( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) )))
; => '( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7))

(defun sublists-set (l)
	(make-set (sublists l))
)

(print (sublists-set '(1 2 (3 (4 5) (6 7)) 8 (4 5))))
; =>((1 2 (3 (4 5) (6 7)) 8 (4 5)) (3 (4 5) (6 7)) (6 7) (4 5))

; d)
(defun _member (l e)
	(cond
		((null l) nil)
		((listp (car l)) (or (_member (car l) e) (_member (cdr l) e)))
		((= (car l) e) T)
		(T (_member (cdr l) e))
	)
)
(defun _remove (l e)
	(cond
		((null l) nil)
		((= (car l) e) (_remove (cdr l) e))
		(T (cons (car l) (_remove (cdr l) e)))
	)
)

(print (_remove '(1 2 2 3 4 2) 2))
; => '(1 3 4)

(defun set= (a b)
	(cond
		((and (null a) (null b)) T)
		((_member b (car a)) (set= (_remove b (car a)) (cdr a)))
	)
)

(print (set= '(1 2 3) '(3 1 2)))
; => T
