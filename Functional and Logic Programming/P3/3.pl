% 3. Write a predicate to determine all decomposition of n (n given, positive), as sum of consecutive natural
% numbers.

%sublists(+L:list, -R:list)

sublists([], []).
sublists([H|T], [H|R]):-
	sublists(T, R).
sublists([_|T], R):-
	sublists(T, R).

%consecutive(+L:list)

consecutive([_]):-!.
consecutive([H1, H2|T]):-
	DIFF is H2 - H1,
	DIFF =:= 1,
	consecutive([H2|T]).

%sum(+L:list, -R:number)

sum([], 0).
sum([H|T], SUM):-
	sum(T, AUX),
	SUM is H + AUX.

%range_(+N:number, -R:list)

range_(0, []):-!.
range_(N, R):-
	M is N -1,
	range_(M, AUX),
	append(AUX, [N], R).

%range(+N:number, -R:list)

range(N, R):-
	M is N - 1,
	range_(M, R).

%process(+N:number, -R:list)

process(N, R):-
	range(N, RANGE),
	sublists(RANGE, R),
	consecutive(R),
	sum(R, N).

%allsolutions(+N:number, -R:list)

all_solutions(N, R):-
	findall(AUX, process(N, AUX), R).
