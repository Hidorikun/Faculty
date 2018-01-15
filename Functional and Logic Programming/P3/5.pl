% 5. Two integers, n and m are given. Write a predicate to determine all possible sequences of numbers
% from 1 to n, such that between any two numbers from consecutive positions, the absolute difference
% to be >= m.

%permutations(+L:list, -R:list)

permutations([], []).
permutations(L, [E|R]):-
	choose(L, E, REST),
	permutations(REST, R).

%choose(+L:list, -E:number, -R:list)

choose([E|T], E, T).
choose([E|T], X, [E|R]):-
	choose(T, X, R).

%combinations(+L:list, -R:list)

combinations([], []).
combinations([H|T], [H|R]):-
	combinations(T, R).
combinations([_|T], R):-
	combinations(T, R).

%arrangements(+L:list, -R:list)

arrangements(L, R):-
	combinations(L, Comb),
	permutations(Comb, R).

%range(+Low:number, +High:number, -Range:list)

range(Low, High, []):-
	Low > High, !.
range(Low, High, [Low|R]):-
	NewLow is Low + 1,
	range(NewLow, High, R).

%condition(+L:list, +M:number)

condition([_], _):-!.
condition([H1, H2|T], M):-
	Diff is H1 - H2,
	abs(Diff, AbsDiff),
	AbsDiff >= M,
	condition([H2|T], M).

%one_solution(+N:number, +M:number)

one_solution(N, M, R):-
	range(1, N, L),
	arrangements(L, R),
	condition(R, M).

%allsolutions(+N:number, +M:number)

allsolutions(N, M, R):-
	findall(Aux, one_solution(N, M, Aux), R).
