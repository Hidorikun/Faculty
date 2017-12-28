; 9. Write a function that _removes all occurrences of an atom from any level of a list

(defun __remove (e l)
	(cond
		((atom l) l)
		((listp l) (mapcar #'(lambda (l) (__remove e  l)) (remove e l)))
	)
)

(defun _remove (e l)
	(__remove e (remove e l))
)

(print (_remove 1 '(1 (2 3) (1 (2 3)) 1) ))
; => ((2 3) ((2 3)))
