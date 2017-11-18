;Two byte strings S1 and S2 are given. Obtain the string D by concatenating the elements of S1 from the left hand side to the right hand side and the elements of S2 from the right hand side to the left hand side.
;Exemple:
;S1: 1, 2, 3, 4
;S2: 5, 6, 7
;D: 1, 2, 3, 4, 7, 6, 5

assume ds:data, cs:code

data segment

	s1 db 1, 2, 3, 4
	len1 equ $ - s1
	s2 db 5, 6, 7
	len2 equ $ - s2
	len3 equ len1 + len2
	d db len3 dup(?)

data ends

code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s1
	lea di, d
	mov cx, len1
	cld

	repeat:
		movsb
	loop repeat

	lea si, s2
	lea di, d[len3 - 1]
	mov cx, len2

	repeat2:
		cld
		lodsb
		std
		stosb
	loop repeat2

	mov ax, 4c00h
	int 21h
code ends
end start
