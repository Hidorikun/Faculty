%4.
%The list a1...an is given.
%Write a predicate to determine all sublists strictly ascending of this list a

%subset(+L:list, -R:list)
%subset(l1..ln) = [], n = 0
%				  l1 U subset(l2..ln)
%				  subset(l2..ln)

subset([], []).
subset([E|Tail], [E|NTail]):-
  subset(Tail, NTail).
subset([_|Tail], NTail):-
  subset(Tail, NTail).

%is_sorted(+L:list)
%is_sorted(l1..ln) = True, n = 0 || n = 1
%					 True, n = 1
%					 False, l1 > l2
%					 is_sorted(l2..ln), l2 >= l1

is_sorted([]):-!.
is_sorted([_]):-!.
is_sorted([H1, H2|T]):-
	H1 =< H2,
	is_sorted([H2|T]).

%process(+LIST, -SortedSubset)
%process(l1..ln) = [], n = 0
%				   subset(l1..ln), is_sorted(subset(l1..ln))

process([], []).
process(L, K):-
	subset(L, K),
	is_sorted(K).
