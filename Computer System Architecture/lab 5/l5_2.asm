; 2. The words A and B are given. Obtain the word C in the following way:
; - the bits 0-3 of C are the same as the bits 5-8 of B
; - the bits 4-8 of C are the same as the bits 0-4 of A
; - the bits 9-15 of C are the same as the bits 6-12 of A

assume cs:code, ds:data

data segment

	a dw 1010010010111000b
	b dw 1010111101010110b
	c dw ?

data ends

code segment
start:

	mov ax, data
	mov ds, ax

	mov c, 0

	mov ax, b
	mov cl, 5
	shr ax, cl
	and ax, 000000000001111b
	add c, ax

	mov ax, a
	mov cl, 4
	shl ax, cl
	and ax, 000000111110000b
	add c, ax

	mov ax, a
	mov cl, 3
	shl ax, cl
	and ax, 111111000000000b
	add c, ax

	mov ah, 4ch
	int 21h

code ends
end start
