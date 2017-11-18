;Two byte strings S1 and S2 are given, having the same length. Obtain the string D so that each element of D represents the maximum of the corresponding elements from S1 and S2.
;Exemple:
;S1: 1, 3, 6, 2, 3, 7
;S2: 6, 3, 8, 1, 2, 5
;D: 6, 3, 8, 2, 3, 7

assume ds:data, cs:code

data segment
	S1 db 1, 3, 6, 2, 3, 7
	S2 db 6, 3, 8, 1, 2, 5
	len equ $ - s2
	d db len dup(?)
	aux db ?
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
	mov cx, len

	repeat:
		lodsb
		mov aux, al
		xchg si, bx
		lodsb
		cmp al, aux
		ja continue

		xchg al, aux

	continue:
		stosb

	loop repeat

	mov ax, 4c00h
	int 21h

code ends
end start
