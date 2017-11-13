%1.
%a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.

%a
%gcd(+a:number, +b:number, -r:number)
%gcd(a, b) = a, b = 0
%			 b, a = 0
%			 gcd(a mod b, b), a >= b
%			 gcd(a, b mod a), b < a

gcd(A, 0, A).
gcd(0, B, B).
gcd(A, B, R):- A >= B,
    A1 is A mod B,
    gcd(A1, B, R).
gcd(A, B, R):- A < B,
    B1 is B mod A,
    gcd(A, B1, R).

%lcm(+a:number, +b:number, -r:number)
%lcm(a, b) = a * b / gcd

lcm(A, B, R):-
    gcd(A, B, GCD),
    R is A * B / GCD.

%b
%insert_helper(+l:list, +v:number, +pos:number, +index:number, -r:list)
%insert_helper(l1..ln, v, pos, index) = [], n = 0
%								 l1 + v + insert_helper(l2..ln, v, pos*2, index+1), index = pos
%								 l1 + insert_helper(l2..ln, v, pos, index+1), pos != index
insert_helper([], _, _, _, []).
insert_helper([H|T], V, POS, INDEX, [H,V|R]):- INDEX =:= POS,
    NEW_POS is POS * 2,
    NEW_INDEX is INDEX + 1,
    insert_helper(T, V, NEW_POS, NEW_INDEX, R).

insert_helper([H|T], V, POS, INDEX, [H|R]):- INDEX =\= POS,
    NEW_INDEX is INDEX + 1,
    insert_helper(T, V, POS, NEW_INDEX, R).

%insert(+l:list, +v:number, -r:list)
%insert(l1..ln, v) = insert_helper(l1..ln, v, 1, 1)

insert(L, V, R):-insert_helper(L, V, 1, 1, R).
