;A byte string S is given. Build the string D whose elements represent the sum of each two consecutive bytes of S.
;S: 1, 2, 3, 4, 5, 6
;D: 3, 5, 7, 9, 11

assume ds:data, cs:code

data segment
	S db 1, 2, 3, 4, 5, 6
	len equ $-s
	d db len-1 dup(?)
data ends

code segment

start:

	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s
	lea di, d

	cld
	lodsb
	mov bl, al
	mov cx, len

	repeat:
		lodsb
		push ax
		add al, bl
		stosb
		pop bx

	loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
