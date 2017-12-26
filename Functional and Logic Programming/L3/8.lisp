; 8. Write a function to determine the number of nodes on the level k from a n-tree represented as follows:
; (root list_nodes_subtree1 ... list_nodes_subtreen)

(defun _count (tree level)
	(cond
		((= level 1) 1)
		((listp tree) (apply '+ (mapcar #'(lambda (l) (_count tree (- level 1) )) (cdr tree))))
		(T 0)
	)
)

(print (_count '(1) 1))
; = 1

(print (_count '(1 (2) (2)) 2))
; => 2

(print (_count '(1 (2 (3)) (2)) 3))
; => 4


a 2
	b 2
		c 0
		d 2
			h 0
			g 0
	i 1
		j 0
