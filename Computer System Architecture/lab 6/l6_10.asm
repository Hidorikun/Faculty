;A byte string S is given. Obtain in the string D the set of the elements of S.
;Exemple:
;S: 1, 4, 2, 4, 8, 2, 1, 1
;D: 1, 4, 2, 8

assume ds:data, cs:code

data segment
	S db 1, 4, 2, 4, 8, 2, 1, 1
	len equ $-s
	d db len dup(?)
	l dw 0
data ends


code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s
	cld

	mov cx, len

	repeat:
		lodsb
		lea di, d
		lea bx, d
		add bx, l 
		compare:
			cmp di, bx
			je not_found
			scasb
			je found
			jmp compare

		not_found:
			lea di, d
			add di, l
			stosb
			inc l
		jmp continue
		found:
			; nothing happens when found, we move on
		continue:

	loop repeat

	mov ax, 4c00h
	int 21h

code ends
end start
