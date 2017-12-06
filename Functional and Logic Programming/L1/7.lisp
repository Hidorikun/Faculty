; 7.
; a) Write a function to eliminate the n-th element of a linear list.
; b) Write a function to determine the successor of a number represented digit by digit as a list, without
; transforming the representation of the number from list to number. Example: (1 9 3 5 9 9) --> (1 9 3 6
; 0 0)
; c) Write a function to return the set of all the atoms of a non-linear list.
;  Exemplu: (1 (2 (1 3 (2 4) 3) 1) (1 4)) ==> (1 2 3 4)
; d) Write a function to test whether a linear list is a set

; a)
(defun remove-nth (l n)
	(cond
		((null l) nil)
		((= n 1) (cdr l))
		(T (cons (car l) (remove-nth (cdr l) (- n 1))))
	)
)

(print (remove-nth '(1 2 3 4 5 6) 4))
; => '(1 2 3 5 6)

; b)
(defun _increase (l)
	(if (= (list-length l) 1)
		(progn
			(setf digit ( + (car l) 1))
			(setf carry (floor digit 10))
			(setf digit (mod digit 10))
			(list carry ( list digit))
		)
		(progn
			(setf result (_increase (cdr l)))
			(setf digit (+ (car l) (car result)))
			(setf carry (floor digit 10))
			(setf digit (mod digit 10))
			(list carry (cons digit (cadr result)))
		)
	)
)

(defun increase (l)
	(setf result (_increase l))
	(if (= (car result) 1)
		(cons 1 (cadr result))
		(cdr result)
	)
)

(print (increase '(9 9 9)))
; => '(1 0 0 0)

; c)
(defun atoms (l)
	(cond
		((null l) nil)
		((listp (car l)) (append (atoms (car l )) (atoms (cdr l))))
		(T (cons (car l) (atoms (cdr l))))
	)
)

(print (atoms '(1 (2 (1 3 (2 4) 3) 1) (1 4))))
; => '(1 2 1 3 2 4 3 1 1 4)

(defun make-set (l)
	(if (null l)
		nil
		(progn
			(setf result (make-set (cdr l)))
			(if (member (car l) result)
				result
				(cons (car l) result)
			)
		)
	)
)

(print (make-set '(1 2 3 1 5 3 1 4)))
; => '(2 5 3 1 4) order not kept!

(defun atoms-set (l)
	(make-set (atoms l))
)

(print (atoms-set '(1 (2 (1 3 (2 4) 3) 1) (1 4))))
; => '(1 2 3 4) in any order

; d)
(defun is-set (l)
	(cond
		((null l) T)
		((member (car l) (cdr l)) nil)
		(T (is-set (cdr l)))
	)
)

(print (is-set '(1 2 3)))
; => T
