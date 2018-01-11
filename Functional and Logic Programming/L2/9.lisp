; 9. Convert a tree of type (1) to type (2).
; for example: (A 2 B 0 C 2 D 0 E 0) => (A (B) (C (D) (E)))

; convert (l, stack) => converted_list
; convert (l1...ln, s1..sn) = stack, l is null
;   											  = convert( (l2) U l3..ln, s1..sn), number(l1) and (l1 == 0)
; 												  = convert( (s1, l2 ) U l3..ln, s2..sn), number(l1) and (l1 == 1)
;													  = convert( (s2 s1 l3) U s3...sn ), number(l1) and (l1 == 2)
(defun _convert (l stack)
	(cond
		((null l) (car stack))

		((and (numberp (car l)) (= (car l) 0)) (_convert (cons (list (cadr l)) (cdr (cdr l))) stack))
		((and (numberp (car l)) (= (car l) 1)) (_convert (cons (list (car stack) (cadr l)) (cdr (cdr l))) (cdr stack)))
		((and (numberp (car l)) (= (car l) 2)) (_convert (cons (list (cadr stack) (car stack) (cadr l)) (cdr (cdr l))) (cdr (cdr stack))))

		(T (_convert (cdr l) (cons (car l) stack)))
	)
)

; convert(l) => converted list
; convert(l1..ln) = reverse(convert(reverse(l), nil)))
(defun convert (l)
	(reverse(_convert (reverse l) nil))
)

(print (convert '(A 0)))
; => '(A)
(print (convert '(A 1 B 0)))
; => '(A (B))
(print (convert '(A 2 B 1 C 2 D 0 E 0 F 1 G 0)))
; => (A (B) (C))
(print (convert '(A 2 B 0 C 2 D 0 E 0)))
; => '(A (B) (C (D) (E)))
