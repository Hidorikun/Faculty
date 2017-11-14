%9.
%a. Insert an element on the position n in a list.
%b. Define a predicate to determine the greatest common divisor of all numbers from a list.

%a.

%insert(+L:list, +E:number, +POS:number, -R:list)
%insert(l1..ln, e, pos) = e + [l1..ln], pos == 0 ( assuming 0 indexed )
%						= l1 + insert(l2..ln, e, pos-1), otherwise

insert(L, E, 0, [E|L]):-!.
insert([H|T], E, POS, [H|R]):-
    POS1 is POS -1,
    insert(T, E, POS1, R).

%b.

%gcd(+A:number, +B:number, -R:number)
%gcd(a, b) = a, b = 0
%		  = b, a = 0
%		  = gcd(a mod b, b), a >= b
%		  = gcd(a, b mod a), b < a

gcd(A, 0, A):-!.
gcd(0, B, B):-!.
gcd(A, B, R):- A >= B,
    A1 is A mod B,
    gcd(A1, B, R), !.
gcd(A, B, R):- A < B,
    B1 is B mod A,
    gcd(A, B1, R), !.

%gcdlist(+L:list, -R:number)
%gcdlist(l1..ln) = l1, n == 1
%				 = gcdlist(GCD(l1, l2), l3..ln), otherwise

gcd([H], H):-!.
gcd([H1, H2|T], R):-
    gcd(H1, H2, GCD),
    gcd([GCD|T], R).
