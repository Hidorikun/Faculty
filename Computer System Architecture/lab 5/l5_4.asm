; 4. The byte A is given. Obtain the integer number n represented on the bits 2-4 of A. Then obtain the byte B by rotating A n positions to the right.

assume cs:code, ds:data

data segment

	a db 10101110b
	b db ?

data ends

code segment
start:

	mov ax, data ; we want DATA to be in Ds, but we can't mov ds, data because they are both segments
	mov ds, ax   ; so we go through register ax

	mov al, a ; we create a copy of a in al
	mov cl, 2 ; we are interested in bits 2 - 4 so we bring them to the right by 2 positions
	shr al, cl ; aka cl must be 2(as shifting requires cl as an argument or the constant 1 )
	and al, 00000111b  ; now that bits 2 - 4 are the lowest bits, we isolate them

	mov cl, al		  ; now we move in cl the number obtained from bits 2-4
					  ; as we need to shift a by this exact amount
	mov al, a		  ; we want the shifted value of a to be in b, so we have 2 posibilities - shift a and then move value in b or move a in b then shift value, they are the same , so i chose the latter
	mov b, al 	      ; we put a in b

	ror b, cl		  ; and then b will be shifted cl times, but b = a, so it's what we wanted, and the result is already in b

	mov ah, 4ch       ;we tell the assembler that we want to return control to the operating sistem
	int 21h           ;we apply the intrerupt

code ends
end start
