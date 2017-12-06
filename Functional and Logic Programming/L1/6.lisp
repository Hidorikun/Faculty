; 6.
; a) Write a function to test whether a list is linear.
; b) Write a function to replace the first occurence of an element E in a given list with an other element
; O.
; c) Write a function to replace each sublist of a list with its last element.
;  A sublist is an element from the first level, which is a list.
;  Example: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f)
;  (a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)
; d) Write a function to merge two sorted lists without keeping double values

; a)
(defun linearp (l)
	(cond
		((null l) T)
		((listp (car l)) nil)
		(T (linearp (cdr l)))
	)
)

(print (linearp '(1 2 3)))
; => T

; b)
(defun _replace (l e v)
	(cond
		((null l) nil)
		((= (car l) e) (cons v (cdr l)))
		(T (cons (car l) (_replace (cdr l) e v)))
	)
)

(print (_replace '(1 2 3 4 5 6) 3 0))
; => '(1 2 0 4 5 6)

; c)
(defun last-element (l)
	(if (listp l) (last-element (car (reverse l))) l)
)

(print (last-element '(1 2 (3 (4 5)))))
; => 5

(defun _reduce (l)
	(cond
		((null l) nil)
		((listp (car l)) (cons (last-element (car l)) (_reduce (cdr l))))
		(T (cons (car l) (_reduce (cdr l))))
	)
)

(print (_reduce '(a (b c) (d (e (f))))))
; => '(a c f)

; d)
(defun _merge-sorted (a b)
	(cond
		((null a) b)
		((null b) a)
		((<= (car a) (car b)) (cons (car a) (_merge-sorted (cdr a) b)))
		(T (cons (car b) (_merge-sorted a (cdr b))))
	)
)

(print (_merge-sorted '(1 2 3) '(3 4 4 5 7)))
; => (1 2 3 3 4 4 5 7)

(defun _remove-doubles (l)
	(cond
		((null l) nil)
		((= (list-length l) 1) (cons (car l) nil))
		((= (car l) (cadr l)) (_remove-doubles (cdr l)))
		(T (cons (car l) (_remove-doubles (cdr l))))
	)
)

(print (_remove-doubles '(1 1 2 3 3 4 4 5 6)))
; => '(1 2 3 4 5 6)

(defun _merge-remove (a b)
	(_remove-doubles (_merge-sorted a b))
)

(print (_merge-remove '(1 2 3 4 5) '(1 2 3 6 7)))
; => '(1 2 3 4 5 6 7)
