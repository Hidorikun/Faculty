;A character string S is given. Obtain the string D which contains all the digit characters of S.
;Exemple:
;S: '+', '4', '2', 'a', '8', '4', 'X', '5'
;D: '4', '2', '8', '4', '5'

assume ds:data, cs:code

data segment
	s db '+', '4', '2', 'a', '8', '4', 'X', '5'
	len equ $-s
	d db len dup(?)
data ends


code segment
	is_digit proc
		mov ah, 0
		push ax
		sub al, '0'
		cmp al, 9
		ja not_digit

		digit:
			pop ax
			mov ah, 01h
		jmp return
		not_digit:
			pop ax
		return:
		ret
	endp

start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s
	lea di, d
	cld

	mov cx, len

	repeat:
		lodsb
		call is_digit
		cmp ah, 0
		je dont_store

		store:
			stosb
		dont_store:

	loop repeat

	mov ax, 4c00h
	int 21h

code ends
end start
