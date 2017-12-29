; 10. Define a function that replaces one node with another one in a n-tree represented as: root
; list_of_nodes_subtree1... list_of_nodes_subtreen)
; Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' => tree (a (g (c)) (d) (e (f)))}

(defun _replace (l e r)
	(cond
		((and (atom l) (string= l e)) r)
		((atom l) l)
		((listp l) (mapcar #'(lambda (l) (_replace l e r)) l))
	)
)

(print (_replace '(a (b (c)) (d) (e (f))) 'b 'g))
; => (a (g (c)) (d) (e (f)))}
