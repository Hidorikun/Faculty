% 15.
% a. Define a predicate to determine the predecessor of a number represented as digits in a list.
% Eg.: [1 9 3 6 0 0] => [1 9 3 5 9 9]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to determine
% the predecessor of the every sublist considered as numbers.
% Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
% [1, [2, 2], 4, 5, [6, 7, 8], 10, 11, [1, 1, 9] 6]

%a
%predecessor(+L:list, -C:number, -R:list)

predecessor([], 0, []):-!.
predecessor([0], 1, [9]):-!.
predecessor([X], 0, [X1]):-
	X1 is X - 1, !.
predecessor([0|T], 1, [9|R]):-
	predecessor(T, 1, R), !.
predecessor([H|T], 0, [H1|R]):-
	predecessor(T, C, R),
	H1 is H - C, !.

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [PRE|R]):-
	is_list(H),
	predecessor(H, _, PRE),
	main(T, R).
