%7.
%a. Write a predicate to compute the intersection of two sets.
%b. Write a predicate to create a list (m, ..., n) of all integer numbers from the interval [m, n].


%a.

%member(+L:list, +v:value)
%member(l1..ln, v) = false, n == 0
%	           = true, v == l1
%		   = member(l2..ln, v), otherwise

member([V|_], V):-!.
member([_|T], V):-
	member(T, V).

%intersection(+SET1:list, +SET2:list, -R:List)
%intersection(l1..ln, k1..km) = [], n == 0
%			      = l1 + intersection(l2..ln, k1..km), member(k1..km, k1)
%			      = intersection(l2..ln, k1..km), otherwise

intersection([], _, []).
intersection([H|T], SET, [H|R]):-
	member(SET, H),
	intersection(T, SET, R),!.
intersection([_|T], SET, R):-
	intersection(T, SET, R).

%b.

%range(+m:number, +n:number, -R:list)
%range(m, n) = [], m > n
%	     = m + range(m+1, n), otherwise

range(M, N, []):-
	M > N, !.
range(M, N, [M|R]):-
	M1 is M+1,
	range(M1, N, R).
