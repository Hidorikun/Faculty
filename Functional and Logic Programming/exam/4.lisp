; 4. Create a lisp program that removes an element from a ist at all levels.

(defun _remove (l e)
	(cond
		((null l) nil)
		((listp (car l)) (cons (_remove (car l) e) (_remove (cdr l) e)))
		((= (car l) e) (_remove (cdr l) e))
		(T (cons (car l) (_remove (cdr l) e)))
	)
)

(print (_remove '(1 2 (1 2 (1 4))) 1))
; => '(2 (2 (4))
