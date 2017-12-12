; 11.
; a) Determine the least common multiple of the numerical values of a nonlinear list.
; b) Write a function to test if a linear list of numbers has a "mountain" aspect (a list has a "mountain"
; aspect if the items increase to a certain point and then decreases.
;  Eg. (10 18 29 17 11 10). The list must have at least 3 atoms to fulfil this criteria.
; c) Remove all occurrences of a maximum numerical element from a nonlinear list.
; d) Write a function which returns the product of numerical even atoms from a list, to any level.

; a)
(defun _gcd (a b)
	(if (= b 0) a (_gcd b (mod a b)))
)

(print (_gcd 18 24))
; => 6

(defun _lcm (a b)
	(floor (* a b) (_gcd a b))
)

(print (_lcm 4 9))
; => 36

; b)
(defun _mountain (l rising)
	(cond
		((= (list-length l) 1) (if rising nil T))
		((and (< (car l) (cadr l)) (not rising)) nil)
		((and (> (car l) (cadr l)) rising) (_mountain (cdr l) nil))
		(T (_mountain (cdr l) rising))
	)
)

(defun mountain (l)
	(if (< (list-length l) 3)
		nil
		(_mountain l T)
	)
)

(print (mountain '(1 2 3 4)))
; => T

; c)
(defun remove-occurences (l e)
	(cond
		((null l) nil)
		((= (car l) e) (remove-occurences (cdr l) e))
		(T (cons (car l) (remove-occurences (cdr l) e)))
	)
)

(print (remove-occurences '(1 2 1 3 4 1 2) 1))
; => '(2 3 4 2)

(defun list-max (l)
	(cond
		((= (list-length l) 1) (car l))
		(T (max (car l) (list-max (cdr l))))
	)
)

(print (list-max '(1 2 3 1)))
; => 3

(defun remove-max-element (l)
	(remove-occurences l (list-max l))
)

(print (remove-max-element '(1 2 3 3)))
; => '(1 2)

; d)
(defun even (a)
	(= (mod a 2) 0)
)

(print (even 0))
; => T

(defun product (l)
	(cond
		((null l) 1)
		((listp (car l)) (* (product (car l)) (product (cdr l))))
		((even (car l)) (* (car l) (product (cdr l))))
		(T (product (cdr l)))
	)
)

(print (product '(1 2 (3 3 (4) 6))))
; => 2 * 4 * 6 = 48
