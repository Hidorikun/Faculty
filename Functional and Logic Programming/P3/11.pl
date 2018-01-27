% 11. “Colouring” a map. n countries are given; write a predicate to determine all possibilities of colouring n
% countries with m colours, such that two adjacent countries not having the same colour.

%range(+Low:number, +High:number, -R:list)

range(Low, High, []):-
	Low > High, !.
range(Low, High, [Low|R]):-
	NewLow is Low + 1,
	range(NewLow, High, R).

%range(+N:number, -R:list)

range(N, R):-
	range(1, N, R), !.

%choose(+L:list, -E:atom)

choose([E|_], E).
choose([_|T], E):-
	choose(T, E).

%cartesian_product(+L:list, +K:number, -R:list)

cartesian_product(_, 0, []):-!.
cartesian_product(L, K, [E|R]):-
	choose(L, E),
	Q is K - 1,
	cartesian_product(L, Q, R).

%validte(+L:list)

validate([_]).
validate([H1, H2|T]):-
	H1 =\= H2,
	validate([H2|T]).

%one_solution(+N:number, +M:number, -R:list)

one_solution(N, M, Coloring):-
	range(M, Colors),
	cartesian_product(Colors, N, Coloring),
	validate(Coloring).

%all_solutions(+N:number, +M:number, -R:list)

all_solutions(N, M, R):-
	findall(Coloring, one_solution(N, M, Coloring), R).
