; 3. Define a function to tests the membership of a node in a n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtreen)

(defun __member (node tree )
	(cond
		((and (atom l) (= node tree )) 1)
		((listp l) (apply '+ (mapcar #' (lambda (l) (__member node tree )) l)))
		(T 0)
	)
)

(defun _member (node tree )
	(if (> (__member node tree ) 0) T nil)
)

(print (_member 1 '(4 (3 (2 (1) (9)) (7)))))
; => T
