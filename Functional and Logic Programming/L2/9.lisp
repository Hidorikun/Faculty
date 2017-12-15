; 9. Convert a tree of type (1) to type (2).
; for example: (A 2 B 0 C 2 D 0 E 0) => (A (B) (C (D) (E)))

(defun _convert (l stack)
	(cond
		((null l) (car stack))

		((and (numberp (car l)) (= (car l) 0)) (_convert (cons (list (cadr l)) (cdr (cdr l))) stack))
		((and (numberp (car l)) (= (car l) 1)) (_convert (cons (list (car stack) (cadr l)) (cdr (cdr l))) (cdr stack)))
		((and (numberp (car l)) (= (car l) 2)) (_convert (cons (list (cadr stack) (car stack) (cadr l)) (cdr (cdr l))) (cdr (cdr stack))))

		(T (_convert (cdr l) (cons (car l) stack)))
	)
)

(defun _reverse (l)
	(cond
		((null l) nil)
		((listp (car l)) (append (_reverse (cdr l)) (list (_reverse (car l)))))
		(T (append (_reverse (cdr l)) (list (car l))))
	)
)

(print (_reverse '(1 2 (1 2 3) 3 4)))

(defun convert (l)
	(_reverse(_convert (_reverse l) nil))
)

(print (convert '(A 0)))
; => '(A)
(print (convert '(A 1 B 0)))
; ; => '(A (B))
(print (convert '(A 2 B 1 C 2 D 0 E 0 F 1 G 0)))
; => (A (B) (C))
(print (convert '(A 2 B 0 C 2 D 0 E 0)))
; => '(A (B) (C (D) (E)))
