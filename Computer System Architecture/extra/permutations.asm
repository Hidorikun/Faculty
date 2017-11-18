; PRINT ALL PERMUTATIONS OF A

assume ds:data, cs:code

data segment
	a dw 0ABCDh
	Tabela db '0123456789ABCDEF'
data ends

code segment

PrintCharacter proc
	;	proc that prints the character in al to the screen
	;	args:
	;		al = the character to be printed to the screen
	; 	no side effects
	push dx

		mov dl, al
		mov ah, 02h
		int 21h

	pop dx
	ret
endp

PrintComma proc
	;	proc that prints a comma to the screen
	; 	no side effects
	push ax

		mov al, ','
		call PrintCharacter

	pop ax
	ret
endp

PrintSpace proc
	;	proc that prints a space to the screen
	; 	no side effects
	push ax

		mov al, ' '
		call PrintCharacter

	pop ax
	ret
endp



PrintBase16 proc
	;	proc that prints the content of ax ( in base 16 ) to the screen
	;	args:
	;		ax = number thata will be printed on the screen in base 16
	;	no side effects
	push cx
	push ax
	push bx

		mov cx, 4 ;	becausse ax register stores exactly 4 bytes

		repeat:	; .label marks the label as local, and will not raise errors if procedure is used multiple times

			mov dx, 0
			mov bx, 16
			div bx
			push dx

		loop repeat

		mov cx, 4

		lea bx, Tabela

		ia_de_pe_stiva:

			pop ax
			xlat	; al = the character of the digit we wish to convey
			call PrintCharacter

		loop ia_de_pe_stiva

		mov al, 'h'
		call PrintCharacter

	pop bx
	pop ax
	pop cx

	ret
endp

start:
	mov ax, data
	mov ds, ax

	mov	cx, 4 ;cx will not be destroyed by any procedure, as all of them are safe ( they don't modify any of the registers, not even the parameters, all the registers are after the proc call the same as they were before it )
	mov ax, a
	call PrintBase16
	call PrintComma
	call PrintSpace

	permutations:
		rol ax, 4
		call PrintBase16

		cmp cx, 1
		je do_not_print_comma

		print_comma:
			call PrintComma
			call PrintSpace
		do_not_print_comma:

	loop permutations

	mov ax, 4C00h
	int 21h
code ends
end start
