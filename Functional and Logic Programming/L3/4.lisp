; 4. Write a function that returns the product of numeric atoms in a list, at any level.

(defun product (l)
	(cond
		((numberp l) l)
		((listp l) (apply '* (mapcar 'product l)))
    (T 1)
	)
)

(print (product '(1 2 (3 4) (5 (6 7)))))
; => 5040
