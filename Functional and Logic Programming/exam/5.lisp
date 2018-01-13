; Write a Lisp program to determine the number of sublists at any level of a given list, where the last atom (at any level) is nonnumeric. The list processing will be done using a MAP function. For example, the list (A (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6) F) has 2 such sublists: (6 F), (D 1 (6 F)).

(defun linearize (l)
	(cond
		((atom l) (list l))
		((listp l) (apply #'append (mapcar #'linearize l)))
	)
)

(print (linearize '(1 2 (3 (4 5) 6 (7) 8))))
; => '(1 2 3 4 5 6 7 8)

(defun last-element (l)
	(cond
		((null (cdr l)) (car l))
		(T (last-element (cdr l)))
	)
)

(print (last-element '(1 2 4)))
; => 4

(defun valid-sublist (l)
	(not (numberp (last-element (linearize l))))
)

(print (valid-sublist '(6 F)))
; => T

(defun _count-sublists (l)
	(cond
		((atom l) 0)
		((valid-sublist l) (+ 1 (apply #'+ (mapcar #'_count-sublists l))))
		(T (apply #'+ (mapcar #'_count-sublists l)))
	)
)

(defun count-sublists (l)
		(apply #'+ (mapcar #'_count-sublists l))
)

(print (count-sublists '(A (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6) F)))
; => 2
