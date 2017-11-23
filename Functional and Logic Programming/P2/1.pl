% 1.
% a. Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
% sublist with removing the doubles.
% Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, 2, [1, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1], 7]

%a
%merge_sort(+L:list, -R:list)

merge_sort([], []).
merge_sort([H], [H]):-!.
merge_sort(L, R):-
	split(L, LEFT, RIGHT),
	merge_sort(LEFT, RL),
	merge_sort(RIGHT, RR),
	merge(RL, RR, R).

%merge(+A:list, +B:list, -R:list)

merge([], B, B).
merge(A, [], A).
merge([HA|TA], [HB|TB], [HA|R]):-
	HA =< HB,
	merge(TA, [HB|TB], R).
merge([HA|TA], [HB|TB], [HB|R]):-
	HB < HA,
	merge([HA|TA], TB, R).


%split(+L:list, +AUX:list, -LEFT:list, -RIGHT:list)

split(L, AUX, AUX, L):-
	length(L, LEN_L),
	length(AUX, LEN_R),
	DIFF is LEN_R - LEN_L,
	abs(DIFF, ABS),
	ABS =< 1.
split([H|T], AUX, L, R):-
	append(AUX, [H], RA),
	split(T, RA, L, R).

%split(+L:list, -LEFT:list, -RIGHT:list)

split([], [], []).
split(LIST, LEFT, RIGHT):-
	split(LIST, [], LEFT, RIGHT).

%remove_doubles(+L:list, -R:list)

remove_doubles([], []).
remove_doubles([H], [H]).
remove_doubles([H, H|T], R):-
	remove_doubles([H|T], R), !.
remove_doubles([H1, H2|T], [H1|R]):-
	remove_doubles([H2|T], R).

%sorted_set(+L:list, -R:list)

sorted_set(L, R):-
	merge_sort(L, SORTED),
	remove_doubles(SORTED, R).

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [SET|R]):-
	is_list(H),
	sorted_set(H, SET),
	main(T, R).
