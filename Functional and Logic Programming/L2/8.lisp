; 8. Return the list of nodes of a tree of type (2) accessed inorder.

(defun inorder (tree)
	(cond
		((null (car tree)) nil)
		(T (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree))))
	)
)

(print (inorder '(1 (2 (3) (4)) (5 (6) (7)))))
; => '(3 2 4 1 6 5 7)
