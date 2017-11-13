%6.
%a. Write a predicate to test if a list is a set.
%b. Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less
%than three times, all occurrences will be removed.

%a.

%count_occurences(+L:list, +V:atom, -COUNT:number)
%count_occurences(l1..ln, v) = 0, n = 0
%			    1 + count_occurences(l2..ln, v), l1 == v
%			     count_occurences(l2..ln, v), l1 != v

count_occurences([], _, 0).
count_occurences([H|T], V, COUNT):-H=:=V,
    count_occurences(T, V, CNT),
    COUNT is CNT+1.
count_occurences([H|T], V, COUNT):-H=\=V,
	count_occurences(T, V, COUNT).


%is_set(+L:list)
%is_set(l1..ln) = true, n == 0
%= is_set(l2..ln), count_occurences(l2..ln, l1) == 0,
%= false, otherwise
%
%
%
is_set([]).
is_set([H|T]):-
    count_occurences(T, H, 0),
    is_set(T).

%b.

%remove_k_occurences(+L:list, +V:atom, +K:number, -R:list)
%remove_k_occurences(l1..ln, v, k) = [], n == 0 || k == 0
%								   = l1 + remove_k_occurences(l2..ln, v, k), l1 != v
%								   = remove_k_occurences(l2..ln, v, k-1), l1 == v

remove_k_occurences([], _, _, []):-!.
remove_k_occurences([V|T], V, K, R):-
    K > 0,
    K1 is K - 1,
    remove_k_occurences(T, V, K1, R), !.
remove_k_occurences([H|T], V, K, [H|R]):-
    remove_k_occurences(T, V, K, R).

%remove_3_occurences(+L:list, V:atom, -R:list)
%remove_3_occurences(l1..ln, v) = remove_k_occurences(l1..ln, v, k)

remove_3_occurences(L, V, R):-
	remove_k_occurences(L, V, 3, R).
