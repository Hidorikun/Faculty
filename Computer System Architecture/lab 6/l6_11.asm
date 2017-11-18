;Two character strings S1 and S2 are given. Obtain the string D which contains all the elements of S1 that do not appear in S2.
;Exemple:
;S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
;S2: 'a', '4', '5'
;D: '+', '2', '8', 'X'

assume ds:data, cs:code

data segment
	S1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
	len1 equ $ - s1
	S2 db 'a', '4', '5'
	len2 equ $ - s2
	d db len1 dup(?)
	l dw 0
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s1
	cld

	mov cx, len1

	repeat:
		lodsb
		push cx
		mov cx, len2
		lea di, s2

		repeat2:
			scasb
			je found
		loop repeat2

		not_found:
			lea di, d
			add di, l
			stosb
			inc l
		found:
			;nothing, move on
	pop cx
	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
