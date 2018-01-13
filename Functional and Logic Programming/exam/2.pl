% check if a number X is prime in 2 methods and explain said methods.

%method 1: check if X has any divisors.

%prime1(+X:number)

prime1(X):-
	X > 1,
	prime1(X, 2).

%prime1(+X:number, +K:number)

prime1(X, X):-!.
prime1(X, K):-
	X mod K =\= 0,
	K1 is K + 1,
	prime1(X, K1).


%method 2 : generate all prime numbers from 2 to X and verify if X is among them.

%prime2(+X:number)

prime2(X):-
	range(2, X, Range),
	erathostenes(Range, Primes),
	member(Primes, X).

%range(+Low:number, +High:number, -R:list)

range(Low, High, []):-
	Low > High, !.
range(Low, High, [Low|R]):-
	NewLow is Low + 1,
	range(NewLow, High, R).

%erathostenes(+L:list, -R:list)

erathostenes([], []).
erathostenes([H|T], [H|R]):-
	remove_multiples(T, H, Aux),
	erathostenes(Aux, R).

%member(+L:list, +X:number)

member([X|_], X):-!.
member([_|T], X):-
	member(T, X).

%remove_multiples(+L:list, +X:number, -R:list)

remove_multiples([], _, []):-!.
remove_multiples([H|T], X, R):-
	X >= H,
	X mod H =:= 0,
	remove_multiples(T, X, R), !.
remove_multiples([H|T], X, [H|R]):-
	remove_multiples(T, X, R).
