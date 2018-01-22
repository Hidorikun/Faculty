% 10. For a list a1... an with integer and distinct numbers, define a predicate to determine all subsets with
% sum of elements divisible with n.

%sublists(+L:list, -R:list)

sublists([], []).
sublists([H|T], [H|R]):-
	sublists(T, R).
sublists([_|T], R):-
	sublists(T, R).

%sum(+L:list, -N:number)

sum([], 0):-!.
sum([H|T], R):-
	sum(T, Sum),
	R is Sum + H.

%divisible(+N:number, +M:number)

divisible(N, M):-
	Mod is N mod M,
	Mod =:= 0.

%validate(+L:list, +N:number)

validate(L, N):-
	sum(L, Sum),
	divisible(Sum, N).

%one_solution(+L:list, +N:number, -R:list)

one_solution(L, N, R):-
	sublists(L, R),
	validate(R, N).

%all_solutions(+L:list, +N:number, -R:list)

all_solutions(L, N, R):-
	findall(Aux, one_solution(L, N, Aux), R).
