; PROGRAM THAT PRINTS THE CURRENT TIME TO THE SCREEN

assume ds:data, cs:code

data segment

	am db "AM$"
	pm db "PM$"
	zece db 10

data ends

print_char macro char
	; a macro that prints the ascii character passed by char
	; this macro does not have any side effects, cause at the end we restore the initial values
	push ax
	push dx
		mov ah, 02h
		mov dl, char
		int 21h
	pop dx
	pop ax
endm

print_nr macro number
	; macro that prints a 2 digit number ( in base 10 ) passed by number
	; no side effects
	push ax
	push bx
	push dx

		mov al, number
		mov ah, 0
		div zece ; ah restul, al catul - trebuie schimbate
		mov bx, ax

		add bl, '0'
		add bh, '0'

		print_char bl
		print_char bh


	pop dx
	pop bx
	pop ax
endm

code segment

print_time proc
	;procedure that prints the current time to the screen
	; no side effects
	push cx
	push dx
	push ax
	push si
		mov ah, 2ch
		int 21h
		; ch - hours
		; cl - minutes
		; dh - seconds
		; dl - hundreths of seconds

		cmp ch, 12
		ja .is_pm

		.is_am:
			lea si, am
		jmp .continue

		.is_pm:
			lea si, pm
			sub ch, 12
		.continue:

		print_nr ch
		print_char ':'
		print_nr cl
		print_char ' '
		mov dx, si
		mov ah, 09h
		int 21h

	pop si
	pop	ax
	pop dx
	pop cx
	ret
endp


start:
	mov ax, data
	mov ds, ax

	call print_time

	mov ax, 4c00h
	int 21h

code ends
end start
