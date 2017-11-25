Laboratory 6 - problems

1. Two byte strings S1 and S2 are given. Obtain the string D by concatenating the elements of S1 from the left hand side to the right hand side and the elements of S2 from the right hand side to the left hand side.
Exemple:
S1: 1, 2, 3, 4
S2: 5, 6, 7
D: 1, 2, 3, 4, 7, 6, 5

2. Two byte strings S1 and S2 are given, having the same length. Obtain the string D in the following way: each element found on the even positions of D is the sum of the corresponding elements from S1 and S2, and each element found on the odd positions of D is the difference of the corresponding elements from S1 and S2.
Exemple:
S1: 1, 2, 3, 4
S2: 5, 6, 7, 8
D: 6, -4, 10, -4

3. A byte string S is given. Obtain the string D by concatenating the elements found on the even positions of S and then the elements found on the odd positions of S.
Exemple:
S: 1, 2, 3, 4, 5, 6, 7, 8
D: 1, 3, 5, 7, 2, 4, 6, 8

4. A byte string S of length l is given. Obtain the string D of length l-1 so that the elements of D represent the difference between every two consecutive elements of S.
Exemple:
S: 1, 2, 4, 6, 10, 20, 25
D: 1, 2, 2, 4, 10, 5

5. Two byte string S1 and S2 are given, having the same length. Obtain the string D by intercalating the elements of the two strings.
Exemple:
S1: 1, 3, 5, 7
S2: 2, 6, 9, 4
D: 1, 2, 3, 6, 5, 9, 7, 4

6. A byte string S is given. Obtain the string D1 which contains all the even numbers of S and the string S2 which contains all the odd numbers of S.
Exemple:
S: 1, 5, 3, 8, 2, 9
D1: 8, 2
D2: 1, 5, 3, 9

7. A byte string S is given. Obtain the string D1 which contains the elements found on the even positions of S and the string D2 which contains the elements found on the odd positions of S.
Exemple:
S: 1, 5, 3, 8, 2, 9
D1: 1, 3, 2
D2: 5, 8, 9

8. Two byte strings S1 and S2 are given, having the same length. Obtain the string D so that each element of D represents the maximum of the corresponding elements from S1 and S2.
Exemple:
S1: 1, 3, 6, 2, 3, 7
S2: 6, 3, 8, 1, 2, 5
D: 6, 3, 8, 2, 3, 7

9. A byte string S is given. Obtain the string D1 which contains all the positive numbers of S and the string D2 which contains all the negative numbers of S.
Exemple:
S: 1, 3, -2, -5, 3, -8, 5, 0
D1: 1, 3, 3, 5, 0
D2: -2, -5, -8

10. A byte string S is given. Obtain in the string D the set of the elements of S.
Exemple:
S: 1, 4, 2, 4, 8, 2, 1, 1
D: 1, 4, 2, 8

11. Two character strings S1 and S2 are given. Obtain the string D which contains all the elements of S1 that do not appear in S2.
Exemple:
S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
S2: 'a', '4', '5'
D: '+', '2', '8', 'X'

12. A byte string S is given. Obtain the maximum of the elements found on the even positions and the minimum of the elements found on the odd positions of S.
Exemple:
S: 1, 4, 2, 3, 8, 4, 9, 5
max_even_pos: 9
min_odd_pos: 5

13. A character string S is given. Obtain the string D which contains all the digit characters of S.
Exemple:
S: '+', '4', '2', 'a', '8', '4', 'X', '5'
D: '4', '2', '8', '4', '5'

14. Two character strings S1 and S2 are given. Obtain the string D by concatenating the elements found on the positions multiple of 3 from S1 and the elements of S2 in reverse order.
Exemple:
S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
S2: 'a', '4', '5'
D: '+', 'a', 'X', '5', '4', 'a'

15. A byte string S is given. Build the string D whose elements represent the sum of each two consecutive bytes of S.
S: 1, 2, 3, 4, 5, 6
D: 3, 5, 7, 9, 11
