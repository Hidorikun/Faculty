%3.
%a. Define a predicate to remove from a list all repetitive elements.
%Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
%b. Remove all occurrence of a maximum value from a list on integer numbers.

%a.

%remove_occurences(+L:list, +V:atom, -R:list)
%remove_occurences(l1..ln, v) = [], n = 0
%			      = l1 + remove_occurences(l2..ln, v), l1 != v
%			      = remove_occurences(l2..ln, v), l1 == v

remove_occurences([], _, []).
remove_occurences([H|T], V, [H|R]):-H=\=V,
    remove_occurences(T, V, R).
remove_occurences([H|T], V, R):-H=:=V,
    remove_occurences(T, V, R).

%count_occurences(+L:list, +V:atom, -COUNT:number)
%count_occurences(l1..ln, v) = 0, n = 0
%			     = 1 + count_occurences(l2..ln, v), l1 == v
%			     = count_occurences(l2..ln, v), l1 != v

count_occurences([], _, 0).
count_occurences([H|T], V, COUNT):-H=:=V,
    count_occurences(T, V, CNT),
    COUNT is CNT+1.
count_occurences([H|T], V, COUNT):-H=\=V,
	count_occurences(T, V, COUNT).

%b.

%remove_repetitive(+L:list, -R:list)
%remove_repetitive(l1..ln) = [], n == 0
%			   = l1 + remove_repetitive(l2..ln), if count_occurences(l1..ln, l1) == 1
%			   = remove_repetitive(remove_occurences(l2..ln, l1)) if count_occurences(l1..ln, l1) > 1

remove_repetitive([], []).
remove_repetitive([H|T], [H|R]):-
    count_occurences([H|T], H, 1),
    remove_repetitive(T, R).
remove_repetitive([H|T], R):-
    count_occurences([H|T], H, COUNT),
    COUNT > 1,
    remove_occurences(T, H, R1),
    remove_repetitive(R1, R).
