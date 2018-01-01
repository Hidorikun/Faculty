; 13. Define a function that returns the depth of a tree represented as (root list_of_nodes_subtree1 ...
; list_of_nodes_subtreen)

(defun _depth (l level)
	(cond
		((atom l) level)
		((listp l) (apply 'max (mapcar #'(lambda (l) (_depth l (+ level 1))) l)))
	)
)

(defun depth (l)
	(_depth l 0)
)

(print (depth '(1 2 (3 4 (5 6)) 7)))
; => 3
