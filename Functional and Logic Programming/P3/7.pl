% 7. A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate
% to generate all possible variants considering that: last prediction can’t be 2 and no more than two
% possible predictions X.

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

%count(+L:list, +E:atom, -R:number)

count([], _, 0):-!.
count([E|T], E, R):-
	count(T, E, NR),
	R is NR + 1.
count([_|T], E, R):-
	count(T, E, R).

%last_element(+L:list, -E:atom)

last_element([E], E).
last_element([_|T], E):-
	last_element(T, E).

%validate_prediction(+L:list)

validate_prediction(L):-
	last_element(L, LastElement),
	LastElement \= 2,
	count(L, 'X', Xcount),
	Xcount =< 2, !.

%find_variant(+L:list, +K:number, -R:list)

find_variant(L, K, R):-
	cartesian_product(L, K, R),
	validate_prediction(R).

%all_variants(+L:list, +K:number, -R:list)

all_variants(L, K, R):-
	findall(Variant, find_variant(L, K, Variant), R).

%solution(-R:list)

solution(R):-
	all_variants([1, 'x', 2], 4, R).
