%write a predicate that removes from a list all the elements that appear only once
%example: [1, 2, 1, 4, 1, 3, 4] => [1, 2, 4, 1, 4]

%count(+L:list, +V:atom, -R:number)
%count(l1..ln, v) = 0, n = 0
%                 = 1 + count(l2..ln, v), l1 = v
%                 = count(l2..ln, v), l1 != v

count([], _, 0).
count([V|T], V, R):-
    count(T, V, NR),
    R is NR + 1, !.
count([_|T], V, R):-
    count(T, V, R).

%main(+L:list, -R:list)
%main(l1..ln) = main(l1..ln, l1..ln)

main(L, R):-
    main(L, L, R).

%main(+L:list, +K:list, -R:list)
%main(l1..ln, k1..km) = [], m = 0
%                     = main(l1..ln, k2..km), count(l1..ln, k1) = 1
%                     = k1 U main(l1..ln, k2..km), otherwise

main(_, [], []):-!.
main(L, [H|T], R):-
    count(L, H, COUNT),
    COUNT =:= 1,
    main(L, T, R), !.
main(L, [H|T], [H|R]):-
    main(L, T, R).
