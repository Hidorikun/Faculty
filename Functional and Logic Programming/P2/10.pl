% 10.
% a. For a list of integer numbers, define a predicate to write twice in list every prime number.
% b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to write in
% every sublist twice every prime number.
% Eg.: [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5] =>
% [1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]

%a
%divisors(+N:number, +K:number, -R:list)

divisors(N, K, []):-
	K >= N, !.
divisors(N, K, [K|R]):-
	N mod K =:= 0,
	K1 is K+1,
	divisors(N, K1, R).
divisors(N, K, R):-
	N mod K =\= 0,
	K1 is K+1,
	divisors(N, K1, R).

%divisors(+N:number, -R:list)

divisors(N, R):-
		 divisors(N, 2, R).

%prime(+Number):

prime(N):-
    divisors(N, DIV),
    length(DIV, 0).

%duplicate(+L:list, -R:list)

duplicate([], []).
duplicate([H|T], [H, H|R]):-
    prime(H),
    duplicate(T, R).
duplicate([H|T], [H|R]):-
    not(prime(H)),
    duplicate(T, R).

%b
%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [DUP|R]):-
	is_list(H),
	duplicate(H, DUP),
	main(T, R).
