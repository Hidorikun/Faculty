; 1. Write a function to check if an atom is member of a list (the list is non-liniar)

(defun __member (l e)
	(cond
		((and (atom l) (= l e)) 1)
		((listp l) (apply '+ (mapcar #' (lambda (l) (__member l e)) l)))
		(T 0)
	)
)

(defun _member (l e)
	(if (> (__member l e) 0) T nil)
)

(print (_member '(1 2 3 (4 5 (6)) 7 8 9) 9))
; => T
