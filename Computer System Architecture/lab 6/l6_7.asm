;A byte string S is given. Obtain the string D1 which contains the elements found on the even positions of S and the string D2 which contains the elements found on the odd positions of S.
;Exemple:
;S: 1, 5, 3, 8, 2, 9
;D1: 1, 3, 2
;D2: 5, 8, 9

assume ds:data, cs:code

data segment

	S db 1, 5, 3, 8, 2, 9
	len equ $ - s
	d1 db len dup(?)
	d2 db len dup(?)
	doi db 2
	poz dw 0; the current position in the loop
	l1 dw 0	; actual length of d1
	l2 dw 0 ; actual length of d2

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
		mov bl, al
		mov ax, poz
		div doi
		cmp ah, 0
		mov al, bl
		je par

		odd:
			lea di, d2
			add di, l2
			stosb
			inc l2
		jmp continue

		par:
			lea di, d1
			add di, l1
			stosb
			inc l1

		continue:
		inc poz
	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
