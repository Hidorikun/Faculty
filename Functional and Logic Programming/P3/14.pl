% 14. Write a program to generate the list of all subsets of sum S with the elements of a list (S - given).
% Eg: [1,2,3,4,5,6,10] and S=10 => [[1,2,3,4], [1,4,5], [2,3,5], [4,6], [10]] (not necessary in this order)

%subset(+L:list, -R:list)

subset([], []):-!.
subset([H|T], [H|R]):-
	subset(T, R).
subset([_|T], R):-
	subset(T, R).

%sum(+L:list, -R:number)

sum([], 0).
sum([H|T], SUM):-
	sum(T, AUX),
	SUM is H + AUX.

%one_solution(+L:list, +N:number, -R:list)

one_solution(L, N, R):-
	subset(L, R),
	sum(R, N).

%all_solutions(+L:list, +N:number, -R:list)

all_solutions(L, N, R):-
	findall(Aux, one_solution(L, N, Aux), R).
