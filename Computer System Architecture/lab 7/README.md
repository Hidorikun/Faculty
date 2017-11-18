The problems from this lab need to be solved using string specific instructions: LODSB, STOSB, MOVSB, SCASB, CMPSB, LODSW, STOSW, MOVSW, SCASW, CMPSW.

1. Being given two alphabetical ordered strings of characters, s1 and s2, build using merge sort the ordered string of bytes that contain all characters from s1 and s2

12. Being given a string of words, compute the longest substring of ordered words (in increasing order) from this string.

13. Being given a string of bytes and a substring of this string, eliminate all occurrences of this substring from the initial string.


<!-- 2. A string of doublewords is given. Order in decreasing order the string of the low words (least significant) from these doublewords. The high words (most significant) remain unchanged.
Ex: being given: sir DD 12345678h 1256ABCDh, 12AB4344h
the result will be 1234ABCDh, 12565678h, 12AB4344h.

3. A string of doublewords is given. Order in increasing order the string of the high words (most significant) from these doublewords. The low words (least significant) remain unchanged.
Ex: being given: sir DD 12AB5678h 1256ABCDh, 12344344h
the result will be 12345678h 1256ABCDh, 12AB4344h.

4. Being given two strings of bytes, compute all positions where the second string appears as a substring in the first string.

5. Being given a string of bytes representing a text (succession of words separated by spaces), determine which words are palindromes (meaning may be interpreted the same way in either forward or reverse direction); ex.: "cojoc", "capac" etc.

6. Being given a string of words, obtain the string (of bytes) of the digits in base 10 of each word from this string. Ex.: being given the string: sir DW 12345, 20778, 4596
the result will be 1, 2, 3, 4, 5, 2, 0, 7, 7, 8, 4, 5, 9, 6.

7. A string of bytes 'input' is given together with two additional strings of N bytes each, 'src' and 'dst'. Obtain a new string of bytes called 'output' from the 'input' string, but replacing all the bytes with the value src[i] with the new value dst[i], for all i between 1 and N.

8. Being given a string of bytes, build a string of words which contains in the low bytes of the words the set of distinct characters from the given string and in the high byte of a word it contains the number of occurrences of the low byte of the word in the given byte string.
Ex: given the string: sir DB 2, 4, 2, 5, 2, 2, 4, 4
we should have the result: rez DW 0402h, 0304h, 0105h.

9. Being given a string of doublewords, build another string of doublewords which will include only the doublewords from the given string which have an even number of bits with the value 1.

10. A string of bytes is given. Obtain the mirror image of the binary representation of this string of bytes.
Ex: The byte string is given: s db 01011100b, 10001001b, 11100101b
The result is the string: d db 10100111b, 10010001b, 00111010b.

11. A string of doublewords is given. Compute the string formed by the high bytes of the low words from the elements of the doubleword string and these bytes should be multiple of 10.
Ex: Being given the string: s dd 12345678h, 1A2B3C4Dh, FE98DC76h
The result is the string: d db 3Ch, DCh.

14. Two strings of bytes are given. Parse the shortest string of those two and build a third string which should contain the largest element of the same rank from the two strings and up to the length of the longest string the third string will be filled with 1 and 0, alternatively.

15. A string of words is given. Build two strings of bytes, s1 and s2, in the following way: for each word,
- if the number of bits 1 from the high byte of the word is larger than the number of bits 1 from its low byte, then s1 will contain the high byte and s2 will contain the low byte of the word
- if the number of bits 1 from the high byte of the word is equal to the number of bits 1 from its low byte, then s1 will contain the number of bits 1 from the low byte and s2 will contain 0
- otherwise, s1 will contain the low byte and s2 will contain the high byte of the word. -->
