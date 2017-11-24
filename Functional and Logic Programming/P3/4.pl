%4.
%The list a1... an is given.
%Write a predicate to determine all sublists strictly ascending of this list a

%subset(+LIST, -LIST)
%subset(l1..ln) = [], n = 0
%				  l1 U subset(l2..ln)
%				  subset(l2..ln)

subset([], []).
subset([E|Tail], [E|NTail]):-
  subset(Tail, NTail).
subset([_|Tail], NTail):-
  subset(Tail, NTail).

%is_sorted(+LIST, -BOOL)
%is_sorted(l1..ln) = True, n = 0
%					 True, n = 1
%					 False, l1 > l2
%					 is_sorted(l2..ln), l2 >= l1

is_sorted([], true).
is_sorted([_], true).
is_sorted([H1, H2|_], false):- H1 > H2.
is_sorted([H1, H2|T], R):- H1 =< H2, is_sorted([H2|T], R).

%process(+LIST, -SortedSubset)
%process(l1..ln) = [], n = 0
%				   subset(l1..ln), is_sorted(subset(l1..ln))

process([], []).
process(L, K):-
    subset(L, K),
    is_sorted(K, true).
