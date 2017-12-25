; 6. Write a function that returns the maximum of numeric atoms in a list, at any level.

(defun list-max (l)
	(cond
		((numberp l) l)
		((listp l) (apply 'max (mapcar 'list-max l)))
	)
)

(print (list-max '(1 2 (2 3) (4 5))))
; => 5
