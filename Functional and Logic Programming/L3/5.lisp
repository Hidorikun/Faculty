; 5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
; ex : (1 2 (2 3 4) 5) => -1 + 2 + 2 - 3 + 4 -5 = -1

(defun _sum (l)
	(cond
		((and (numberp l) (oddp l)) (* l -1))
		((and (numberp l) (evenp l)) l)
		((listp l) (apply '+ (mapcar '_sum l)))
		(T 0)
	)
)

(print (_sum '(1 2 (2 3 4) 5)))
; => -1
