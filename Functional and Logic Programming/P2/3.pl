% 3.
% a. Merge two sorted lists with removing the double values.
% b. For a heterogeneous list, formed from integer numbers and list of numbers, merge all sublists with removing
% the double values.
% [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
% [1, 2, 3, 4, 6, 7, 9, 10, 11].

%a
%merge(+A:list, +B:list, -R:list)

merge([], B, B).
merge(A, [], A).
merge([HA|TA], [HB|TB], [HA|R]):-
	HA =< HB,
	merge(TA, [HB|TB], R).
merge([HA|TA], [HB|TB], [HB|R]):-
	HB < HA,
	merge([HA|TA], TB, R).

%make_set(+L:list, -R:list)

make_set([], []).
make_set([H], [H]).
make_set([H, H|T], R):-
	make_set([H|T], R), !.
make_set([H1, H2|T], [H1|R]):-
	make_set([H2|T], R).

%unify(+A:list, +B:list, -R:list)
unify(A, B, R):-
	merge(A, B, MERGED),
	make_set(MERGED, R).

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], R):-
	not(is_list(H)),
	main(T, R).
main([H|T], R):-
	is_list(H),
	main(T, SORTED),
	unify(H, SORTED, R).
