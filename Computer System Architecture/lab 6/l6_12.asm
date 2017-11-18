;A byte string S is given. Obtain the maximum of the elements found on the even positions and the minimum of the elements found on the odd positions of S.
;Exemple:
;S: 1, 4, 2, 3, 8, 4, 9, 5
;max_even_pos: 9
;min_odd_pos: 5

assume ds:data, cs:code

data segment
	S db 1, 4, 2, 3, 8, 4, 9, 5
	len equ $-s
	max_even_pos db ?
	min_odd_pos db ?
	pos dw 0
	doi db 2
data ends


code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s
	mov al, [si]
	mov max_even_pos, al
	mov al, [si+1]
	mov min_odd_pos, al

	cld
	mov cx, len

	repeat:
		lodsb
		mov bl, al
		mov ax, pos
		div doi
		cmp ah, 0
		je par

		odd:
			cmp bl, min_odd_pos
			ja continue
			mov min_odd_pos, bl
		jmp continue
		par:
			cmp bl, max_even_pos
			jb continue
			mov max_even_pos, bl
		continue:
		inc pos
	loop repeat

	mov ax, 4c00h
	int 21h

code ends
end start
