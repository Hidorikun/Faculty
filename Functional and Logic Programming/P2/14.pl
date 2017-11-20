% 14.
% a. Define a predicate to determine the longest sequences of consecutive even numbers (if exist more maximal
% sequences one of them).
% b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to replace
% every sublist with the longest sequences of even numbers from that sublist.
% Eg.: [1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3] =>
% [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

%a
%even(+N:number)

even(N):-
	N mod 2 =:= 0.

%seq(+L:list, +AUX:list, +COL:list, -R:list)

seq([], _, COL, COL).
seq(L, AUX, COL, R):-
	length(AUX, K),
	length(COL, MX),
	K > MX,
	seq(L, AUX, AUX, R), !.
seq([H|T], AUX, COL, R):-
	even(H),
	append(AUX, [H], AUX2),
	seq(T, AUX2, COL, R).
seq([H|T], _, COL, R):-
	not(even(H)),
	seq(T, [], COL, R).

%seq(+L:list, -R:list)

seq(L, R):-
	seq(L, [], [], R).

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [SEQ|R]):-
	is_list(H),
	seq(H, SEQ),
	main(T, R).
