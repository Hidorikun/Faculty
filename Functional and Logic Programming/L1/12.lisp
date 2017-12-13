; 12.
; a) Write a function to return the dot product of two vectors. https://en.wikipedia.org/wiki/Dot_product
; b) Write a function to return the maximum value of all the numerical atoms of a list, at any level.
; c) All permutations to be replaced by: Write a function to compute the result of an arithmetic
; expression memorized
;  in preorder on a stack. Examples:
;  (+ 1 3) ==> 4 (1 + 3)
;  (+ * 2 4 3) ==> 11 [((2 * 4) + 3)
;  (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))
; d) Write a function to return T if a list has an even number of elements on the first level, and NIL on
; the contrary case, without counting the elements of the list.

; a)
(defun dot-product (a b)
	(if (null a)
		0
		( + (* (car a) (car b)) (dot-product (cdr a) (cdr b)))
	)
)

(print (dot-product '(1 2 3) '(4 5 6)))
; => 1*4 + 2*5 + 3*6 = 32

; b)
(defun list-max (l)
  (cond
    ((null l) 0)
    ((listp (car l)) (max (list-max (car l)) (list-max (cdr l))))
    ((numberp (car l)) (max (car l) (list-max (cdr l))))
    (T (list-max (cdr l)))
  )
)

(print (list-max '(1 (2 3 (3 4)))))
; => 4

; c)
(defun __expression (op a b)
	(cond
		((string= op "+") (+ a b))
		((string= op "-") (- a b))
		((string= op "*") (* a b))
		((string= op "/") (floor a b))
	)
)

(defun _expression (l)
	(cond
		((null l) nil)
		((and (and (numberp (cadr l)) (numberp (caddr l))) (atom (car l)) (cons (__expression (car l) (cadr l) (caddr l)) (_expression(cdr (cdr (cdr l)))))))
		(T (cons (car l) (_expression (cdr l))))
	)
)

(defun expression (l)
	(cond
		((null (cdr l)) (car l))
		(T (expression (_expression l)))
	)
)
(print (expression '(+ * 2 4 - 5 * 2 2)))
; => 9 ((2 * 4) + (5 - (2 * 2))

; d)
(defun _even-length (l even)
  (if (null l) even (_even-length (cdr l) (not even)))
)

(defun even-length (l)
  (_even-length l T)
)

(print (even-length '(1 2 (1 2 (3)) 4)))
; => T
