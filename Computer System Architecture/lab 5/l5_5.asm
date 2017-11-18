; 5. The bytes A and B are given. Obtain the word C in the following way:
; - the bits 0-3 of C are the same as the bits 3-6 of B
; - the bits 4-7 of C have the value 0
; - the bits 8-10 of C have the value 110
; - the bits 11-15 of C are the same as the bits 0-4 of A

assume ds:data, cs:code

data segment

	a db 11010110b
	b db 11111000b
	c dw ?

data ends

code segment
start:

	mov ax, data
	mov ds, ax

	mov al, b
	mov ah, 0

	mov c, ax
	and c, 0000000001111000b
	mov cl, 3
	shr c, cl

	or c, 0000011000000000b

	mov al, a
	mov ah, 0

	mov cl, 11
	shl ax, cl

	or c, ax

	mov ah, 4ch
	int 21h
code ends
end start
