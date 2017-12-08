; 8.
; a) Write a function to return the difference of two sets.
; b) Write a function to reverse a list with its all sublists, on all levels.
; c) Write a function to return the list of the first elements of all list elements of a given list with an odd
; number of elements at superficial level. Example:
;  (1 2 (3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9).
; d) Write a function to return the sum of all numerical atoms in a list at superficial level.

; a)
(defun difference (a b)
	(cond
		((null a) nil)
		((not (member (car a) b)) (cons (car a) (difference (cdr a) b)))
		(T (difference (cdr a) b))
	)
)

(print (difference '(1 2 3 4 5) '(1 2)))
; => '(3 4 5)

; b)
(defun _reverse (l)
	(cond
		((null l) nil)
		((listp (car l)) (append (_reverse (cdr l)) (list (_reverse (car l)))))
		(T (append (_reverse (cdr l)) (list (car l))))
	)
)

(print (_reverse '(1 2 (1 2 3) 3 4)))
; => '(4 3 (3 2 1) 2 1)

; c)
(defun odd-list-length (l)
	(= (mod (list-length l) 2) 1)
)

(print (odd-list-length '(1 2 3)))
; => T

(defun first-elements (l first-element)
	(cond
		((null l) nil)
		((listp (car l)) (append (first-elements (car l) T) (first-elements (cdr l) nil)))
		((and first-element (odd-list-length l)) (cons (car l) (first-elements (cdr l) nil)))
		(T (first-elements (cdr l) nil))
	)
)

(print (first-elements '(1 2 (3 (4 5) (6 7)) 8 (9 10 11)) T))
; => '(1 3 9)

; d)
(defun list-sum (l)
	(cond
		((null l) 0)
		((numberp (car l)) (+ (car l) (list-sum (cdr l))))
		(T (list-sum (cdr l)))
	)
)

(print (list-sum '(1 (1 2) 2 (1 2) 3 ())))
; => 6
