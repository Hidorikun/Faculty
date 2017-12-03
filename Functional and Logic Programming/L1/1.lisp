; 1.
; a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.
; b) Write a function to check whether an atom E is a _member of a list which is not necessarily linear.
; c) Write a function to determine the list of all sublists of a given list, on any level.
;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
;  ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )
; d) Write a function to transform a linear list into a set.

; a)
(defun nth-element( l k )
	(cond
		((null l) nil)
		((= k 1) (car l))
		(T (nth-element (cdr l) (- k 1)))
	)
)

(print (nth-element '(1 2 3 4) 3))
; => 3

; b)
(defun _member (l e)
	(cond
		((null l) nil)
		((listp (car l)) (or (_member (car l) e) (_member (cdr l) e)))
		((= (car l) e) T)
		(T (_member (cdr l) e))
	)
)

(print (_member '(1 (2 3) (4 (5 6))) 3))
; => T

; c)

(defun sublists (l first-touch)
	(cond
		((null l) nil)
		((= first-touch 1) (cons l (sublists l 0)))
		((listp (car l)) (append (sublists (car l) 1) (sublists (cdr l) 0)))
		(T (sublists (cdr l) 0))
	)
)
(print (sublists '(1 2 (3 (4 5) (6 7)) 8 (9 10)) 1))
; => ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )

; d)
(defun make-set (l)
	(if (null l)
		nil
		(progn
			(setf result (make-set (cdr l)))
			(if (_member result (car l))
				result
				(cons (car l) result)
			)
		)
	)
)
(print (make-set '(1 2 3 1 3 1 4)))
; => ''(2 3 1 4) order not kept!
