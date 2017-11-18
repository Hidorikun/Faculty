;Two byte strings S1 and S2 are given, having the same length. Obtain the string D in the following way: each element found on the even positions of D is the sum of the corresponding elements from S1 and S2, and each element found on the odd positions of D is the difference of the corresponding elements from S1 and S2.
;Exemple:
;S1: 1, 2, 3, 4
;S2: 5, 6, 7, 8
;D: 6, -4, 10, -4

assume ds:data, cs:code

data segment

	s1 db 1, 2, 3, 4
	s2 db 5, 6, 7, 8
	len equ $ - s2
	d db len dup(?)

data ends


code segment
start:
	mov ax, data
	mov ds, ax

	mov si, 0

	mov cx, len
	cld

	repeat:
		mov bl, s1[si]
		mov bh, s2[si]

		mov ax, si
		mov dl, 2
		div dl
		cmp ah, 0
		jne odd

		eve:
			add bl, bh
			mov d[si], bl
		jmp to_end

		odd:
			sub bl, bh
			mov d[si], bl

		to_end:
		inc si
	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
