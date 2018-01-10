% 4. The list a1...an is given.
% Write a predicate to determine all sublists strictly ascending of this list a

%subset(+L:list, -R:list)
%subset(l1..ln) = [], n = 0
%	        = l1 U subset(l2..ln)
%	        = subset(l2..ln)

subset([], []).
subset([H|T], [H|R]):-
	subset(T, R).
subset([_|T], R):-
	subset(T, R).

%is_sorted(+L:list)
%is_sorted(l1..ln) = True, n = 0 || n = 1
%	           = False, l1 > l2
%		   = is_sorted(l2..ln), l2 >= l1

is_sorted([]):-!.
is_sorted([_]):-!.
is_sorted([H1, H2|T]):-
	H1 =< H2,
	is_sorted([H2|T]).

%one_solution(+L:list, -R:list)
%one_solution(l1..ln) = [], n = 0
%	         = subset(l1..ln), is_sorted(subset(l1..ln))

one_solution([], []).
one_solution(L, K):-
	subset(L, K),
	is_sorted(K).

%all_solutions(+L:List, -R:list)

all_solutions(L, R):-
	findall(AUX, one_solution(L, AUX), R).
