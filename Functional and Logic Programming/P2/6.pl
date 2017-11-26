% 6.
% a. Determine the product of a number represented as digits in a list to a given digit.
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to replace
% every sublist with the position of the maximum element from that sublist.
% [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

%a
%prod(+L:list, +V:number, -C:Number, -R:list)

prod([H], V, C, [DIGIT]):-
     PROD is H * V,
     C is PROD div 10,
     DIGIT is PROD mod 10.
prod([H|T], V, C, [DIGIT|R]):-
    prod(T, V, CARRY, R),
    PROD is H * V + CARRY,
   	C is PROD div 10,
    DIGIT is PROD mod 10.

%prod(+L:list, +V:number, -R:list)

prod(L, V, [1|R]):-
    prod(L, V, 1, R).
prod(L, V, R):-
    prod(L, V, 0, R).
