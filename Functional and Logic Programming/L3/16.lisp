; 16. Write a function that produces the linear list of all atoms of a given list, from all levels, and written in
; the same order. Eg.: (((A B) C) (D E)) --> (A B C D E)

(defun linearize (l)
	(cond
		((atom l) (list l))
		((listp l) (apply 'append (mapcar 'linearize l)))
	)
)

(print (linearize '(((A B) C) (D E))))
; => (A B C D E)
