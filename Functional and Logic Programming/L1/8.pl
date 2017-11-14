%8.
%a. Write a predicate to determine if a list has even numbers of elements without counting the elements from
%the list.
%b. Write a predicate to delete first occurrence of the minimum number from a list.

%a.

%even(+L:list)
%even(l1, l2...ln) = false, n == 1
%				   = true, n == 0
%				   = even(l3..ln), otherwise

even([]).
even([_,_|T]):-
	even(T).

%b.

%min(+L:list, -R:number)
%min(l1..ln) = l1, n == 1
%			 = l1, l1 < min(l2..ln)
%			 = min(l2..ln), otherwise

min([MIN], MIN).
min([H|T], H):-
	min(T, MIN),
	H < MIN, !.
min([_|T], MIN):-
	min(T, MIN).

%delete_first(+L:list, K:atom, -R:lis)
%delete_first(l1..ln, k) = [], n == 0
%						 = [l2..ln], l1 == v
%						 = l1 + delete_first(l2..ln), otherwise

delete_first([], _, []).
delete_first([H|T], K, T):-
	H =:= K, !.
delete_first([H|T], K, [H|R]):-
	delete_first(T, K, R).

%delete_min(+L:list, -R:list)
%delete_min(l1..ln) = delete_first(l1..ln, min(l1..ln))

delete_min(L, R):-
	min(L, MIN),
	delete_first(L, MIN, R), !.
