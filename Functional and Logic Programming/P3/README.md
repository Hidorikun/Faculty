P3: Backtracking in Prolog

1. Write a predicate to generate the list of all subsets with all elements of a given list.
Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]


2. Are given n points in a plan (represented using its coordinates). Write a predicate to determine all
subsets of collinear points.


3. Write a predicate to determine all decomposition of n (n given, positive), as sum of consecutive natural
numbers.


4. The list a1... an is given. Write a predicate to determine all sublists strictly ascending of this list a.


5. Two integers, n and m are given. Write a predicate to determine all possible sequences of numbers
from 1 to n, such that between any two numbers from consecutive positions, the absolute difference
to be >= m.


6. Generate the list of all arrangements of K elements of a given list.
Eg: [2, 3, 4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4], [4,3]] (not necessary in this order)


7. A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate
to generate all possible variants considering that: last prediction can’t be 2 and no more than two
possible predictions X.


8. Generate all strings of n parenthesis correctly closed.
 Eg: n=4 => (()) and () ()


9. Generate all permutation of N (N - given) respecting the property: for every 2<=i<=n exists an 1<=j<=i,
so |v(i)-v(j)|=1.


10. For a list a1... an with integer and distinct numbers, define a predicate to determine all subsets with
sum of elements divisible with n.


11. “Colouring” a map. n countries are given; write a predicate to determine all possibilities of colouring n
countries with m colours, such that two adjacent countries not having the same colour.


12. Generate all sub-strings of a length 2*n+1, formed from values of 0, 1 or -1, so a1 = ..., a2n+1 = 0 and
|a(i+1) - ai| = 1 or 2, for every 1 <= i <= 2n.


13. The list a1, ..., an is given and it consists of distinct integers. Write a predicate to determine all subsets
with aspect of "mountain" (a set has a "mountain" aspect if the elements increase to a certain point
and then decrease).


14. Write a program to generate the list of all subsets of sum S with the elements of a list (S - given).
Eg: [1,2,3,4,5,6,10] si S=10 => [[1,2,3,4], [1,4,5], [2,3,5], [4,6], [10]] (not necessary in this order)


15. For a given n, positive, determine all decomposition of n as a sum of consecutive natural numbers.
