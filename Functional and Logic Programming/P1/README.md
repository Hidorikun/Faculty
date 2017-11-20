P1: Lists in Prolog (1)
1.
a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.
2.
a. Write a predicate to remove all occurrences of a certain atom from a list.
b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has
n occurrences.
Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].
3.
a. Define a predicate to remove from a list all repetitive elements.
Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
b. Remove all occurrence of a maximum value from a list on integer numbers.
4.
a. Write a predicate to determine the difference of two sets.
b. Write a predicate to add value 1 after every even element from a list.
5.
a. Write a predicate to compute the union of two sets.
b. Write a predicate to determine the set of all the pairs of elements in a list.
Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].
6.
a. Write a predicate to test if a list is a set.
b. Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less
than three times, all occurrences will be removed.
7.
a. Write a predicate to compute the intersection of two sets.
b. Write a predicate to create a list (m, ..., n) of all integer numbers from the interval [m, n].
8.
a. Write a predicate to determine if a list has even numbers of elements without counting the elements from
the list.
b. Write a predicate to delete first occurrence of the minimum number from a list.
9.
a. Insert an element on the position n in a list.
b. Define a predicate to determine the greatest common divisor of all numbers from a list.
10.
a. Define a predicate to test if a list of an integer elements has a "valley" aspect (a set has a "valley" aspect if
elements decreases up to a certain point, and then increases.
eg: 10 8 6 9 11 13 – has a “valley” aspect
b. Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).
11.
a. Write a predicate to substitute an element from a list with another element in the list.
b. Write a predicate to create the sublist (lm, …, ln) from the list (l1,…, lk).
12.
a. Write a predicate to substitute in a list a value with all the elements of another list.
b. Remove the n-th element of a list.
13.
a. Transform a list in a set, in the order of the last occurrences of elements. Eg.: [1,2,3,1,2] is transformed in
[3,1,2].
b. Define a predicate to determine the greatest common divisor of all numbers in a list.
14.
a. Write a predicate to test equality of two sets without using the set difference.
b. Write a predicate to select the n-th element of a given list.
15.
a. Write a predicate to transform a list in a set, considering the first occurrence.
Eg: [1,2,3,1,2] is transform in [1,2,3].
b. Write a predicate to decompose a list in a list respecting the following: [list of even numbers list of odd
numbers] and also return the number of even numbers and the numbers of odd numbers.
