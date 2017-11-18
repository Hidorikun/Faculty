; 6. The word A is given. Obtain the integer number n represented on the bits 0-2 of A. Then obtain the word B by rotating A n positions to the right (without carry flag).

assume cs:code, ds:data

data segment

	a dw 1010010010111101b
	b dw ?

data ends

code segment
start:

	mov ax, data
	mov ds, ax

	mov ax, a
	and ax, 0000000000000111b

	mov cl, al
	mov ax, a
	mov b, ax

	ror b, cl

	mov ah, 4ch
	int 21h

code ends
end start
