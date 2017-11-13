%4.
%a. Write a predicate to determine the difference of two sets.
%	A - B means elements of A which are not the elements of B.
%b. Write a predicate to add value 1 after every even element from a list.

%a.

%contains(+L:list, +V:atom)
%contains(l1..ln, v) = false, n == 0
%		     = true, l1 == v
%		     = contains(l2..ln, v), otherwise

contains([V|_], V):-!.
contains([_|T], V):-contains(T, V).

%difference(+SET1:list, +SET2:list, -DIF:list)
%difference(l1..ln, k1..km) = [], n == 0
%			    = difference(l2..ln, k1..kn)), if contains(k1..kn, l1)
%			    = l1 + difference(l2..ln, k1..kn),otherwise

difference([], _, []).
difference([H|T], SET, R):-
    contains(SET, H),
    difference(T, SET, R), !.
difference([H|T], SET,[H|R]):-
    difference(T, SET, R).

%b.

%add(+L:list, -R:list)
%add(l1..ln) = [], n == 0
%	     = l1 + add(l2..ln), if l1 mod 2 != 0
%            = l1 + 1 + add(l2..ln), if l1 mod 2 == 0

add([], []).
add([H|T], [H|R]):-
    H mod 2 =\= 0,
    add(T, R).
add([H|T], [H,1|R]):-
    H mod 2 =:= 0,
    add(T, R).
