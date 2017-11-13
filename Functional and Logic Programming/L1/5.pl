%5.
%a. Write a predicate to compute the union of two sets.
%b. Write a predicate to determine the set of all the pairs of elements in a list.
%Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].

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

%union(+SET1:list, +SET2:list, -R:list)
%union(l1..ln, k1..km ) = [], if n = 0 && m = 0
%			= l1 + union(remove_occurences(l2..ln, l1), remove_occurences(k1..km, l1)),
%					    		if n > 0
%			= k1 + union(remove_occurences(l1..ln, l1), remove_occurences(k1..km, l1)),
%					    		if m > 0

union([], [], []).
union([H|T], SET2, [H|R]):-
    remove_occurences(T, H, R1),
    remove_occurences(SET2, H, R2),
    union(R1, R2, R).
union([], SET2, R):-
    union(SET2, [], R).

%b.

%sets(+L:list, -R:list)
%sets(l1..ln, k) = [], k == 0
%		 = l1 + sets(l2..ln, k-1), if k > 0
%		 = sets(l2..ln, k-1), if k > 0

gen_sets(_, 0, []):-!.
gen_sets([H|T], K, [H|R]):-
    K1 is K - 1,
    gen_sets(T, K1, R).
gen_sets([_|T], K, R):-
    gen_sets(T, K, R).

%gen_sets_list(+L:list, -R:list)
%gen_sets_list(l1..ln) = [], n == 0
%	     	       = findall(sets(l1..ln, 2))

sets([], []).
sets(LIST, R):-
	findall(X, gen_sets(LIST, 2, X), R).
