%11.
%a. Replace all occurrences of an element from a list with another element e.
%b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to determine
%the maximum number of the list, and then to replace this value in sublists with the maximum value of sublist.
%Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, [1, 3, 5, 8, 5, 4], 5, [5, 9, 1], 2] =>
%[1, [2, 7, 7], 4, 5, [1, 4], 3, [1, 3, 8, 8, 8, 4], 5, [9, 9, 1], 2]

%a
%replace(+L:list, +V:atom, +E:atom, -R:list)
replace([], _, _, []).
replace([V|T], V, E, [E|R]):-
	replace(T, V, E, R), !.
replace([H|T], V, E, [H|R]):-
	replace(T, V, E, R).

%b
%max(A:number, B:number)
%max(a, b) = a, a > b
%		   = b, b >= a

max(A, B, A):-
	A > B.
max(A, B, B):-
	B >= A.

%list_max(+L:list, -R:number)
%list_max(l1..ln) = l1, n = 1
%	          = max(list_max(l2..ln)), otherwise

list_max([H], H).
list_max([H|T], R):-
	list_max(T, R1),
	max(H, R1, R).

%del_sublists(+L:list, -R:number)
%del_sublists(l1..ln) = [], n = 0
%		      = l1 + del_sublists(l2..ln), not(is_list(l1))
%		      = del_sublists(l2..ln), is_list(l1)

del_sublists([], []).
del_sublists([H|T], [H|R]):-
	not(is_list(H)),
	del_sublists(T, R).
del_sublists([H|T], R):-
	is_list(H),
	del_sublists(T, R).

%pure_max(+L:list, -R:number)
%pure_max(l1..ln) = list_max(del_sublists(l1..ln))

pure_max(L, R):-
	del_sublists(L, L1),
	list_max(L1, R).

%main(+L:list, +M:number, -R:list)
%main(l1..ln, m) = [], n = 0
%		 = l1 + main(l2..ln), not(is_list(l1))
%	         = replace(l1, m, list_max(l1)) + main(l2..ln), is_list(l1)

main([], _, []).
main([H|T], M, [H|R]):-
	not(is_list(H)),
	main(T, M, R).

main([H|T], M, [REP|R]):-
	is_list(H),
	list_max(H, MX),
	replace(H, M, MX, REP),
	main(T, M, R).

%main(+L:list, -R:list)
%main(l1..ln) = [], n = 0
%		      = main(l1..ln, pure_max(l1..ln))

main([], []).
main(L, R):-
	pure_max(L, M),
	main(L, M, R).
