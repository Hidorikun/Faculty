; 2. Write a function that returns the sum of numeric atoms in a list, at any level.

(defun sum (l)
	(cond
		((numberp l) l)
		((listp l) (apply '+ (mapcar 'sum l)))
		(T 0)
	)
)

(print (sum '(a)))
; => 0
(print (sum '(1 2 (3 4) (5 (6 7)))))
; => 28
