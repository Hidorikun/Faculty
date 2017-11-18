;A byte string S is given. Obtain the string D1 which contains all the positive numbers of S and the string D2 which contains all the negative numbers of S.
;Exemple:
;S: 1, 3, -2, -5, 3, -8, 5, 0
;D1: 1, 3, 3, 5, 0
;D2: -2, -5, -8

assume ds:data, cs:code

data segment
	S db 1, 3, -2, -5, 3, -8, 5, 0
	len equ $ - s
	d1 db len dup(?)
	d2 db len dup(?)
	l1 dw 0
	l2 dw 0
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
		lodsb  ; al, si++
		cmp al, 0
		jge positive

		negative:
			lea di, d2
			add di, l2
			stosb
			inc l2
		jmp continue

		positive:
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
