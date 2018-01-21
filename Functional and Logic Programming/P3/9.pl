% 9. Generate all permutation of N (N - given) respecting the property: for every 2<=i<=n exists an 1<=j<=i,
% so |v(i)-v(j)|=1.

%range(+Low:number, +High:number, -R:list)

range(Low, High, []):-
	Low > High, !.
range(Low, High, [Low|R]):-
	NewLow is Low + 1,
	range(NewLow, High, R).

%range(+N:number, -R:list)

range(N, R):-
	range(1, N, R), !.

%choose(+L:list, E:atom, Rest:list)

choose([E|T], E, T).
choose([H|T], E, [H|R]):-
	choose(T, E, R).

%permutations_(+L:list, -R:list)

permutations_([], []).
permutations_(L, [E|R]):-
	choose(L, E, Rest),
	permutations_(Rest, R).

%permutations(+N:number, -R:list)

permutations(N, R):-
	range(N, Range),
	permutations_(Range, R).

%validate(+L:list)

validate([H|T]):-
	validate_([H], T).

%validate_(+Pre:list, L:list)

validate_(_, []):-!.
validate_(Pre, [Current| Next]):-
	findConsecutive(Pre, Current),
	validate_([Current|Pre], Next).

%findConsecutive(+L:list, +E:atom)

findConsecutive([H|_], E):-
	Diff is H - E,
	abs(Diff, AbsDiff),
	AbsDiff =:= 1, !.
findConsecutive([_|T], E):-
	findConsecutive(T, E).

%find_permutation(+N:number, -R:list)

find_permutation(N, R):-
	permutations(N, R),
	validate(R).

%all_solutions(+N:number, -R:list)

all_solutions(N, R):-
	findall(Aux, find_permutation(N, Aux), R).
