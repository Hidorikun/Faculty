% 8. Generate all strings of n parenthesis correctly closed.
% Eg: n=4 => (()) and () ()

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

%validate(+L:list)

validate(L):-
	validate(L, 0, 0), !.

%validate_(+L:list, +NrOfOpenParanthesis:number, +NrOfClosedParanthesis:number)

validate([], NR, NR):-!.
validate([H|T], A, B):-
	A >= B,
	H = '(',
	C is A + 1,
	validate(T, C, B).
validate([H|T], A, B):-
	A >= B,
	H = ')',
	C is B + 1,
	validate(T, A, C).

%generate_paranthesis(+N:number, -R:list)

generate_paranthesis(N, R):-
	cartesian_product(['(',')'], N, R),
	validate(R).

%all_solutions(+N:number, -R:list)

all_solutions(N, R):-
	findall(Aux, generate_paranthesis(N, Aux) ,R).
