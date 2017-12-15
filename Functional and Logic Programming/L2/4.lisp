; 4. Convert a tree of type (2) to type (1).
; example: (A (B) (C (D) (E))) => (A 2 B 0 C 2 D 0 E 0)

(defun convert (l)
	(cond
		((= (list-length l) 1) (list (car l) 0))
		((= (list-length l) 2) (append (list (car l) 1) (convert (cadr l))))
		((= (list-length l) 3) (append (list (car l) 2) (convert (cadr l)) (convert (caddr l))))
	)
)

(print (convert '(A (B) (C (D) (E)))))
; => (A 2 B 0 C 2 D 0 E 0)

(print (convert '(A (B))))
; => '(a 1
