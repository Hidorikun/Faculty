; 11. Return the level (and coresponded list of nodes) with maximum number of nodes for a tree of type
; (2). The level of the root element is 0.

(defun get-level (tree level)
	(cond
		((null tree) nil)
		((= level 0) (list (car tree)))
		(T (append (get-level (cadr tree) (- level 1)) (get-level (caddr tree) (- level 1))))
	)
)

(print (get-level '(1 (2 (3) (4)) (5 (6) (7))) 2))
; => '(3 4 6 7)

(defun _max-level (tree max lvl)
	(setf me (get-level tree lvl))
	(cond
		((null me) max)
		((> (list-length me) (list-length max)) (_max-level tree me (+ lvl 1)))
		(T (_max-level tree me (+ lvl 1)))
	)
)

(print (_max-level '(1 (2 (3) (4)) (5 (6) (7))) '() 0))
; => '(3 4 6 7)

(defun max-level (tree)
	(_max-level tree '() 0)
)

(print (max-level  '(1 (2 (3) (4)) (5 (6) (7))) ) )
; => '(3 4 6 7)
