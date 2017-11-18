;Two character strings S1 and S2 are given. Obtain the string D by concatenating the elements found on the positions multiple of 3 from S1 and the elements of S2 in reverse order.
;Exemple:
;S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
;S2: 'a', '4', '5'
;D: '+', 'a', 'X', '5', '4', 'a'

assume ds:data, cs:code

data segment
	S1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
	len1 equ $-s1
	S2 db 'a', '4', '5'
	len2 equ $-s2
	d db len1+len2 dup(?)
	l dw 0
	pos dw 0
	trei db 3
data ends

code segment
start:

	mov ax, data
	mov ds, ax
	mov es, ax
	lea si, s1
	lea di, d
	cld

	mov cx, len1

	repeat:
	lodsb
	mov bl, al
	mov ax, pos
	div trei
	mov al, bl
	cmp ah, 0
	jne nu_pune

	pune:
		stosb
		inc l
	nu_pune:
		;nothing

	inc pos
	loop repeat

	lea si, s2
	add si, len2
	sub si, 1

	lea di, d
	add di, l
	add di, len2
	sub di, 1
	std
	mov cx, len2
	repeat2:
		movsb
	loop repeat2

	mov ax, 4c00h
	int 21h
code ends
end start
