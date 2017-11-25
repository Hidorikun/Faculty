% 4.
% a. Write a predicate to determine the sum of two numbers written in list representation.
% b. For a heterogeneous list, formed from integer numbers and list of digits, write a predicate to compute the
% sum of all numbers represented as sublists.
% Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2]

%a
%normalize(+A:list, +B:list, -NA:list, -NB:list)

normalize(A, B, A, B):-
	length(A, L),
	length(B, L).
normalize(A, B, AR, BR):-
	length(A, LA),
	length(B, LB),
	LB < LA,
	normalize(A, [0|B], AR, BR).
normalize(A, B, AR, BR):-
	length(A, LA),
	length(B, LB),
	LB > LA,
	normalize([0|A], B, AR, BR).

%sum(+A:list, +B:list, -R:list)

sum(A, B, [1|R]):-
	normalize(A, B, AR, BR),
	sum(AR, BR, 1, R).
sum(A, B, R):-
	normalize(A, B, AR, BR),
	sum(AR, BR, 0, R).

%sum(+A:list, +B:list, -CARRY:number, -R:list)

sum([H], [K], CARRY, [DIGIT]):-
	SUM is H + K,
	CARRY is SUM div 10,
	DIGIT is SUM mod 10, !.
sum([H|T], [K|TK], CARRY,[DIGIT|R]):-
	sum(T, TK, OLD_CARRY, R),
	SUM is H + K + OLD_CARRY,
	CARRY is SUM div 10,
	DIGIT is SUM mod 10 .

%b
%main(+L:list, -R:list)

main([], [0]).
main([H|T], R):-
	not(is_list(H)),
	main(T, R).
main([H|T], R):-
	is_list(H),
	main(T, SUM),
	sum(H, SUM, R).
