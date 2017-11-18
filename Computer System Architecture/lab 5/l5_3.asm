; 3. The words A and B are given. Obtain the word C in the following way:
; - the bits 0-2 of C are the same as the bits 12-14 of A
; - the bits 3-8 of C are the same as the bits 0-5 of B
; - the bits 9-15 of C are the same as the bits 3-9 of A

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
	mov cl, 12
	shr ax, cl
	and ax, 0000000000000111b
	add c, ax

	mov ax, b
	mov cl, 3
	shl ax, cl
	and ax, 0000001111110000b
	add c, ax

	mov ax, a
	mov cl, 6
	shl ax, cl
	and ax, 1111110000000000b
	add c, ax

	mov ah, 4ch
	int 21h

code ends
end start
