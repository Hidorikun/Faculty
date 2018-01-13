% generate arrangments of k from n elements

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
