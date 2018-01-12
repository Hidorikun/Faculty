; Define a function that computes thee sum of 2 numbers represented as lists, without converting them in base 10.

; _sum(a1...an, b1...bm, rest, r1...rw) = r1...rw, n = m = 0 and rest = 0
;																				= 1 r1..rw, n = m = 0 and rest = 1
;																				=_sum(nil, b2..bm, (b1 + rest)/10, ((b1 + rest) mod 10) U r1...rw), if a = null
;																				=_sum(a2..an, nil, (a1 + rest)/10, ((a1 + rest) mod 10) U r1...rw), if b = null
;																				=_sum(a2..an, b2..bm, (a1 + b1 + rest)/10, ((a1 + b1 + rest) mod 10) U r1..rw), otherwise
(defun _sum (a b rest result)
	(cond
		((and (null a) (null b) (= rest 0)) result)
		((and (null a) (null b) (= rest 1)) (cons 1 result))
		((null a) (_sum nil (cdr b) (floor (+ (car b) rest) 10) (cons (mod (+ (car b) rest) 10) result)))
		((null b) (_sum (cdr a) nil (floor (+ (car a) rest) 10) (cons (mod (+ (car a) rest) 10) result)))
		(T (_sum (cdr a) (cdr b) (floor (+ (car a) (car b) rest) 10) (cons (mod (+ (car a) (car b) rest) 10) result)))
	)
)

(defun sum (a b)
	(_sum (reverse a) (reverse b) 0 '())
)

(print (sum '(9 1 1) '(2 2 2)))
; => '(3 3 3)

(print (sum '(1 2 0 0) '(9 9 9)))
; => '(2 1 9 9)

(print (sum '(1 2 3 4) '(1 2 3)))
; => '(1 3 5 7)

(print (sum '(1 2 8) '(3 5)))
; => '(1 6 3)

(print (sum '(8 8) '(5 7)))
; => '(1 4 5)
