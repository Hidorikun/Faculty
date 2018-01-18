; 10. Return the level of a node X in a tree of type (2). The level of the root element is 0.

(defun _level (tree x level)
	(cond
		((null (car tree)) nil)
		((and (numberp (car tree)) (= (car tree) x)) level)
		(T (progn
			(setf lvl (_level (cadr tree) x (+ level 1)))
			(if (null lvl)
				(_level (caddr tree) x (+ level 1))
				lvl
			)
		))
	)
)

(defun level (tree x)
	(_level tree x 0)
)

(print (level '(1 (2 (3) (4)) (5 (6) (7))) 5))
; => 1
