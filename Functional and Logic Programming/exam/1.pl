% we have the following program:

f([], 0).
f([H|T], S):-
	f(T, S1), !,
	H mod 2 =:= 1,
	S is S1 + H.
f([_|T], S):-
	f(T, S).

% 1. what does it return for [1, 2, 3, 4, 5, 6, 7] and why?
%	false, because the cut prevents the execution from ever reaching the third branch of the program,
% 	so whenever it reaches an even number, it will reutrn false.

% 2. how can it be modified to return the number of all odd elements in a list?

g([], 0):-!.
g([H|T], S):-
	g(T, S1),
	H mod 2 =:= 1,
	S is S1 + 1, !.
g([_|T], S):-
	g(T, S).
