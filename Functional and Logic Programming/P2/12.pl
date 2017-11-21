%12.
%a. Define a predicate to add after every element from a list, the divisors of that number.
%b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to add in
%every sublist the divisors of every element.
%Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, 2, [6, 2, 1], 4, [7, 2, 8, 1], 2] =>
%[1, [2, 5, 7], 4, 5, [1, 4, 2], 3, 2, [6, 2, 3, 2, 1], 4, [7, 2, 8, 2, 4, 1], 2]

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

%b
%insert(+L:list, +AUX:list, -R:list)

insert([], AUX, AUX).
insert([H|T], AUX, R):-
	divisors(H, DIV),
	append(AUX, [H|DIV], AUX2),
	insert(T, AUX2, R).

%insert(+L:list, -R:list)

insert(L, R):-
	insert(L, [], R).

%main(+L:list, -R:list)

main([], []).
main([H|T], [H|R]):-
	not(is_list(H)),
	main(T, R).
main([H|T], [INS|R]):-
	is_list(H),
	insert(H, INS),
	main(T, R).
