;Two byte string S1 and S2 are given, having the same length. Obtain the string D by intercalating the elements of the two strings.
;Exemple:
;S1: 1, 3, 5, 7
;S2: 2, 6, 9, 4
;D: 1, 2, 3, 6, 5, 9, 7, 4

assume ds:data, cs:code

data segment

	S1 db 1, 3, 5, 7
	S2 db 2, 6, 9, 4
	len equ $ - s2
	d db len*2 dup(?)

data ends


code segment
start:

	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s1
	lea bx, s2
	lea di, d
	cld

	mov cx, len*2

	repeat:
		movsb
		xchg bx, si
	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
