P2: Lists in Prolog (2)

1.
a. Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]               
b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
sublist with removing the doubles.
Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, 2, [1, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1], 7].

2.
a. Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]                                         
b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
sublist, keeping the doubles.
Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].

3.
a. Merge two sorted lists with removing the double values.                                                      
b. For a heterogeneous list, formed from integer numbers and list of numbers, merge all sublists with removing
the double values.
[1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
[1, 2, 3, 4, 6, 7, 9, 10, 11].

4.
a. Write a predicate to determine the sum of two numbers written in list representation.                                                            
b. For a heterogeneous list, formed from integer numbers and list of digits, write a predicate to compute the
sum of all numbers represented as sublists.
Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2].

5.
a. Substitute all occurrences of an element of a list with all the elements of another list.
Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].                                                      
b. For a heterogeneous list, formed from integer numbers and list of numbers, replace in every sublist all
occurrences of the first element from sublist it a new given list.
Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
[1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]

6.
a. Determine the product of a number represented as digits in a list to a given digit.
Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]                                         
b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to replace
every sublist with the position of the maximum element from that sublist.
[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

7.
a. Determine the position of the maximal element of a linear list.
Eg.: maxpos([10,14,12,13,14], L) produces L = [2,5].                                        
b. For a heterogeneous list, formed from integer numbers and list of numbers, replace every sublist with the
position of the maximum element from that sublist.
[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

8.
a. Determine the successor of a number represented as digits in a list.
Eg.: [1 9 3 5 9 9] --> [1 9 3 6 0 0]                                    
b. For a heterogeneous list, formed from integer numbers and list of numbers, determine the successor of a
sublist considered as a number.
[1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
[1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]

9.
a. For a list of integer number, write a predicate to add in list after 1-st, 3-rd, 7-th, 15-th element a given value e.                                            
b. For a heterogeneous list, formed from integer numbers and list of numbers; add in every sublist after 1-st,
3-rd, 7-th, 15-th element the value found before the sublist in the heterogenous list. The list has the particularity
that starts with a number and there aren’t two consecutive elements lists.
Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
[1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6, 7], 5].

10.
a. For a list of integer numbers, define a predicate to write twice in list every prime number.                                     
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to write in
every sublist twice every prime number.
Eg.: [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5] =>
[1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]

11.
a. Replace all occurrences of an element from a list with another element e.                                    
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to determine
the maximum number of the list, and then to replace this value in sublists with the maximum value of sublist.
Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, [1, 3, 5, 8, 5, 4], 5, [5, 9, 1], 2] =>
[1, [2, 7, 7], 4, 5, [1, 4], 3, [1, 3, 8, 8, 8, 4], 5, [9, 9, 1], 2]

12.
a. Define a predicate to add after every element from a list, the divisors of that number.
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to add in
every sublist the divisors of every element.                                            
Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, 2, [6, 2, 1], 4, [7, 2, 8, 1], 2] =>
[1, [2, 5, 7], 4, 5, [1, 4, 2], 3, 2, [6, 2, 3, 2, 1], 4, [7, 2, 8, 2, 4, 1], 2]

13.
a. Given a linear numerical list write a predicate to remove all sequences of consecutive values.
Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].                                  
b. For a heterogeneous list, formed from integer numbers and list of numbers; write a predicate to delete from
every sublist all sequences of consecutive values.
Eg.: [1, [2, 3, 5], 9, [1, 2, 4, 3, 4, 5, 7, 9], 11, [5, 8, 2], 7] =>
[1, [5], 9, [4, 7, 9], 11, [5, 8, 2], 7]

14.
a. Define a predicate to determine the longest sequences of consecutive even numbers (if exist more maximal
sequences one of them).                                 
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to replace
every sublist with the longest sequences of even numbers from that sublist.
Eg.: [1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3] =>
[1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

15.
a. Define a predicate to determine the predecessor of a number represented as digits in a list.
Eg.: [1 9 3 6 0 0] => [1 9 3 5 9 9]                         
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to determine
the predecessor of the every sublist considered as numbers.
Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
[1, [2, 2], 4, 5, [6, 7, 8], 10, 11, [1, 1, 9] 6]
