; 9.
; a) Write a function that merges two sorted linear lists and keeps double values.
; b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.
; c) Write a function to determines the sum of two numbers in list representation, and returns the
; corresponding decimal number, without transforming the representation of the number from list to
; number.
; d) Write a function to return the greatest common divisor of all numbers in a linear list.

; d)
(defun gcd (a b)
    (if (= b 0) a (gcd b (mod a b)))
)

(defun list-gcd (l)
    (if (= (list-length l) 1)
        (car l)
        (gcd (car l)(list-gcd (cdr l)))
    )
)

(defvar l (list 16 8 80))
(print (list-gcd l) )
