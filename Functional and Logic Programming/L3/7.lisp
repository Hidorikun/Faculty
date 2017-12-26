; 7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list

(defun _replace (l e p)
	(cond
		((and (numberp l) (= l e)) p)
		((listp l) (mapcar #'(lambda (l) (_replace l e p)) l))
		(T l)
	)
)

(print (_replace '(1 2 3 1 (1 3 (1 2 (1))) (1)) 1 0))
; => '(0 2 3 0 (0 3 (0 2 (0))) (0))
