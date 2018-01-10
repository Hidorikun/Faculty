% 6. Generate the list of all arrangements of K elements of a given list.
% Eg: [2, 3, 4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4], [4,3]] (not necessary in this order)


%permutations(+L:list, -R:list)

permutations([], []).
permutations(L, [E|R]):-
	choose(L, E, REST),
	permutations(REST, R).

%choose(+L:list, -E:number, -R:list)

choose([E|T], E, T).
choose([E|T], X, [E|R]):-
	choose(T, X, R).

%subsets(+L:list, -R:list)

subsets([], []).
subsets([H|T], [H|R]):-
	subsets(T, R).
subsets([_|T], R):-
	subsets(T, R).

%combinations(+L:list, +K:number, -R:list)

combinations(L, K, R):-
	subsets(L, R),
	length(R, K).

%arrangements(+L:list, +K:number, -R:list)

arrangements(L, K, R):-
	combinations(L, K, Comb),
	permutations(Comb, R).

%allsolutions(+L:list, +K:number, -R:list)

allsolutions(L, K, R):-
	findall(Aux, arrangements(L, K, Aux), R).
