; 13.
; a) A linear list is given. Eliminate from the list all elements from N to N steps, N-given.
; b) Write a function to test if a linear list of integer numbers has a "valley" aspect (a list has a valley
; aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must
; have at least 3 elements to fulfill this condition.
; c) Build a function that returns the minimum numeric atom from a list, at any level.
; d) Write a function that deletes from a linear list of all occurrences of the minimum element.

; a)
(defun _remove-from-n-to-n (l n k)
	(cond
		((null l) nil)
		((= k 1) (_remove-from-n-to-n (cdr l) n n))
		(T (cons (car l) (_remove-from-n-to-n (cdr l) n (- k 1))))
	)
)
(defun remove-from-n-to-n (l n)
	(_remove-from-n-to-n l n n)
)

(print (remove-from-n-to-n '(1 2 3 4 5 6 7 8) 3))
; => '(2 3 4 5 7 8)

; b)
(defun _valley (l decreasing)
	(cond
		((= (list-length l) 1) (if decreasing nil T))
		((and (> (car l) (cadr l)) (not decreasing)) nil)
		((and (< (car l) (cadr l)) decreasing) (_valley (cdr l) nil))
		(T (_valley (cdr l) decreasing))
	)
)

(defun valley (l)
	(if (< (list-length l) 3)
		nil
		(_valley l T)
	)
)

(print (valley '(5 4 3 4)))
; => T

; c)

(defun list-min (l)
	(cond
		((= (list-length l) 1) (car l))
		((listp (car l)) (min (list-min (car l)) (list-min (cdr l))))
		(T (min (car l) (list-min (cdr l))))
	)
)

(print (list-min '(1 2 (0 1) 3 1)))
; => 0

; d)
(defun remove-occurences (l e)
	(cond
		((null l) nil)
		((= (car l) e) (remove-occurences (cdr l) e))
		(T (cons (car l) (remove-occurences (cdr l) e)))
	)
)

(print (remove-occurences '(1 2 1 3 4 1 2) 1))
; => '(2 3 4 2)


(defun remove-min-element (l)
	(remove-occurences l (list-min l))
)

(print (remove-min-element '(1 2 1 1 4 5)))
; => '(2 4 5)
