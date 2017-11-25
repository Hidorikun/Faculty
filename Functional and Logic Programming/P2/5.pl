% 5.
% a. Substitute all occurrences of an element of a list with all the elements of another list.
% Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].
% b. For a heterogeneous list, formed from integer numbers and list of numbers, replace in every sublist all
% occurrences of the first element from sublist it a new given list.
% Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
% [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]

%a
%unite(+L:list, +K:list, -R:list)

unite([], K, K).
unite([H|T], K, [H|R]):-
	unite(T, K, R).

%subst(+L:list, +N:number, +K:list, -R:list)

subst([], _, _, []).
subst([N|T], N, K, R):-
	subst(T, N, K, AUX),
	unite(K, AUX, R), !.
subst([H|T], N, K, [H|R]):-
	subst(T, N, K, R).

%b
%main(+L:list, +K:list, -R:list)

main([], _, []).
main([[H|T1]|T], K, [Y|R]):-
	 subst([H|T1], H, K, Y),
	 main(T, K, R), !.
main([H|T], K, [H|R]):-
	 main(T, K, R).
