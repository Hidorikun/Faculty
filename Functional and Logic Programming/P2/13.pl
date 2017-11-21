% 13.
% a. Given a linear numerical list write a predicate to remove all sequences of consecutive values.
% Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].
% b. For a heterogeneous list, formed from integer numbers and list of numbers; write a predicate to delete from
% every sublist all sequences of consecutive values.
% Eg.: [1, [2, 3, 5], 9, [1, 2, 4, 3, 4, 5, 7, 9], 11, [5, 8, 2], 7] =>
% [1, [5], 9, [4, 7, 9], 11, [5, 8, 2], 7]

%a
%consecutive(+A:number, +B:number)

consecutive(A, B):-
    A - B =:= 1.

%_remove(+L:list, +FLAG:number, -R:list)

remove([], _, []).
remove([_], 1, []).
remove([H], 0, [H]).
remove([H1, H2|T], _, R):-
    H2 - H1 =:= 1, !,
    remove([H2|T], 1, R).
remove([H1, H2|T], 1, R):-
    H2 - H1 =\= 1,
    remove([H2|T], 0, R).
remove([H1, H2|T], 0, [H1|R]):-
    H2 - H1 =\= 1,
    remove([H2|T], 0, R).

%remove(+L:list, -R:list)

remove(L, R):-
    remove(L, 0, R).

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [RM|R]):-
	is_list(H),
	remove(H, RM),
	main(T, R).
