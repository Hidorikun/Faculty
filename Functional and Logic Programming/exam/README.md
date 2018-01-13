1. We have the following program:
```prolog
f([], 0).
f([H|T], S):-
	f(T, S1), !,
	H mod 2 =:= 1,
	S is S1 + H.
f([_|T], S):-
	f(T, S).
```
 - what does it return for [1, 2, 3, 4, 5, 6, 7] and why?
false, because the cut prevents the execution from ever reaching the third branch of the program,
	so whenever it reaches an even number, it will reutrn false.
- how can it be modified to return the number of all odd elements in a list?

2. Check if a number X is prime in 2 methods and explain said methods.
3. Generate arrangments of k from n elements.
4. Create a lisp program that removes an element from a ist at all levels.
5. Write a Lisp program to determine the number of sublists at any level of a given list, where the last atom (at any level) is nonnumeric. The list processing will be done using a MAP function. For example, the list (A (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6) F) has 2 such sublists: (6 F), (D 1 (6 F)).
