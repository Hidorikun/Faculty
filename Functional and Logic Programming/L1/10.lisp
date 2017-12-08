; 10.
; a) Write a function to return the product of all the numerical atoms from a list, at superficial level.
; b) Write a function to replace the first occurence of an element E in a given list with an other element
; O.
; c) Write a function to compute the result of an arithmetic expression memorised
;  in preorder on a stack. Examples:
;  (+ 1 3) ==> 4 (1 + 3)
;  (+ * 2 4 3) ==> 11 [((2 * 4) + 3)
;  (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))
; d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the
; parameter list. Example:
;  (A B A B A C A) --> ((A 4) (B 2) (C 1)).

; a)
(defun product (l)
	(cond
		((null l) 1)
		((numberp (car l)) (* (car l) (product (cdr l))))
		(T (product (cdr l)))
	)
)

(print (product '(1 (2 3) 4 (2 (4)) 5)))
; => 20

; b)
(defun _replace (l e v)
	(cond
		((null l) nil)
		((= (car l) e) (cons v (cdr l)))
		(T (cons (car l) (_replace (cdr l) e v)))
	)
)

(print (_replace '(1 2 3 1 4) 1 0))
; => '(0 2 3 1 4)

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
(defun remove-element (l e)
	(cond
		((null l) nil)
		((string= (car l) e) (remove-element (cdr l) e))
		(T (cons (car l) (remove-element (cdr l) e)))
	)
)

(print (remove-element '(B E L L A) 'L))
; => '(B E A)

(defun count-element (l e)
	(cond
		((null l) 0)
		((string= (car l) e) (+ 1 (count-element (cdr l) e)))
		(T (count-element (cdr l) e))
	)
)

(print (count-element '(S A P A B A P) 'A))
; => 3
(defun frequency (l)
	(cond
		((null l) nil)
		(T (cons (list (car l) (count-element l (car l))) (frequency (remove-element l (car l)))))
	)
)

(print (frequency '(A B A B A C A)))
; -> '((A 4) (B 2) (C 1)).
