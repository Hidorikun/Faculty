%2.
%a. Write a predicate to remove all occurrences of a certain atom from a list.
%b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has
%n occurrences.
%Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].

%a.

%remove_occurences(+L:list, +V:atom, -R:list)
%remove_occurences(l1..ln, v) = [], n = 0
%							    l1 + remove_occurences(l2..ln, v), l1 != v
%							   	remove_occurences(l2..ln, v), l1 == v

remove_occurences([], _, []).
remove_occurences([H|T], V, [H|R]):-H=\=V,
    remove_occurences(T, V, R).
remove_occurences([H|T], V, R):-H=:=V,
    remove_occurences(T, V, R).

%b

%count_occurences(+L:list, +V:atom, -COUNT:number)
%count_occurences(l1..ln, v) = 0, n = 0
%							   1 + count_occurences(l2..ln, v), l1 == v
%							   count_occurences(l2..ln, v), l1 != v

count_occurences([], _, 0).
count_occurences([H|T], V, COUNT):-H=:=V,
    count_occurences(T, V, CNT),
    COUNT is CNT+1.
count_occurences([H|T], V, COUNT):-H=\=V,
	count_occurences(T, V, COUNT).

%main(+L:list, -R:list)
%main(l1..ln) =  [], n == 0
%				 [ l1, count_occurences(l1..ln, l1) ] U main(remove_occurences(l1..ln, l1))

main([], []).
main([H|T], [ [H, OCC] | R]):-
    count_occurences([H|T], H, OCC),
    remove_occurences(T, H, REM),
    main(REM, R).
