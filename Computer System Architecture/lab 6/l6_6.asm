;A byte string S is given. Obtain the string D1 which contains all the even numbers of S and the string S2 which contains all the odd numbers of S.
;Exemple:
;S: 1, 5, 3, 8, 2, 9
;D1: 8, 2
;D2: 1, 5, 3, 9

assume ds:data, cs:code

data segment

	s db 1, 5, 3, 8, 2, 9
	len equ $-s
	d1 db len dup(?)
	d2 db len dup(?)
	doi db 2
	l1 dw 0
	l2 dw 0

data ends

code segment
start:
	mov ax, data
	mov es, ax
	mov ds, ax

	lea si, s

	cld ; -->
	mov cx, len

	repeat:
		lodsb ; al <- ds:[si] , si++
		mov bl, al
		mov ah, 0
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

	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
