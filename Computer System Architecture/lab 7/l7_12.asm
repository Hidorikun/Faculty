; 12. Being given a string of words, compute the longest substring of ordered words (in increasing order) from this string.

assume ds:data, cs:code

data segment
	s db '130123'
	reserved_space db 0
	len equ $ - s
	d db len dup(?)
	max dw 0
	i dw 0
	aux db 0
	k dw 1
data ends

code segment
store_sir proc
	push cx
	push si

	lea di, d
	sub si, max
	dec si
	mov cx, max
	rep movsb

	pop si
	pop cx
	ret
endp
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s
	cld

	mov cx, len
	lodsb
	dec si
	mov aux, al

	repeat:
		lodsb ;
		mov bl, al
		cmp aux, al
		jbe continue

		check_maxim:
			mov ax, k
			sub ax, 1
			cmp max, ax
			ja not_greater

			greater:
				mov max, ax
				call store_sir
			not_greater:
				mov k, 0

		continue:
			inc k
			mov aux, bl
			inc i

	loop repeat

	mov ax, 4c00h
	int 21h

code ends
end start
