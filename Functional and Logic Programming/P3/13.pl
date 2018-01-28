% 13. The list a1, ..., an is given and it consists of distinct integers. Write a predicate to determine all subsets
% with aspect of "mountain" (a set has a "mountain" aspect if the elements increase to a certain point
% and then decrease).

%choose(+L:list, -E:elem, -R:list)

choose([E|T], E, T).
choose([H|T], E, [H|R]):-
	choose(T, E, R).

%permutation(+L:list, -R:list)

permutation([], []).
permutation(L, [E|R]):-
	choose(L, E, Rest),
	permutation(Rest, R).

%subset(+L:list, -R:list)

subset([], []):-!.
subset([H|T], [H|R]):-
	subset(T, R).
subset([_|T], R):-
	subset(T, R).

%mountain(+L:list)

mountain(L):-
	mountain(L, 0).

%mountain(+L:list, +Direction:number),
%0 increasing, 1 decreasing

mountain([_], 1):-!.
mountain([H1, H2, H3|T], 0):-
	H1 < H2,
	H2 > H3,
	mountain([H3|T], 1).
mountain([H1, H2|T], 0):-
	H1 < H2,
	mountain([H2|T], 0).
mountain([H1, H2|T], 1):-
	H1 > H2,
	mountain([H2|T], 1).

%one_solution(+L:list, -R:list)

one_solution(L, P):-
	subset(L, R),
	permutation(R, P),
	mountain(P).

%all_solution(+L:list, -R:list)

all_solution(L, R):-
	findall(Mountain, one_solution(L, Mountain), R).w
