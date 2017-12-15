; 14. Write a function that returns the number of atoms in a list, at any level.

; count(l) => nr of atoms
; count(l) = 1, l is atom
; 	= ∑(l1..ln) _count(li) ,l is list
(defun _count (l)
	(cond
		((atom l) 1)
		((listp l) (apply '+ (mapcar '_count l)))
	)
)

(print (_count '(1 2 3 (4 (5 6)) (7))))
; => 7
