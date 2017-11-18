; 1. The words A and B are given. Obtain the word C in the following way:
; - the bits 0-4 of C are the same as the bits 11-15 of A
; - the bits 5-11 of C have the value 1
; - the bits 12-15 of C are the same as the bits 8-11 of B

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

	mov ax, a
	mov cl, 11
	shr ax, cl
	and ax, 000000000011111b
	add c, ax

	or c, 0000111111100000b

	mov ax, b
	mov cl, 4
	shl ax, cl
	and ax, 1111000000000000b
	add c, ax

	mov ah, 4ch
	int 21h

code ends
end start
