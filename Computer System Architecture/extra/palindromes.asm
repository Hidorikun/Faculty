; PRINT ALL PALINDROMES FROM A GIVEN SENTENCE

assume ds:data, cs:code

data segment

	len equ 201
	string db 200, ?, len dup(?)
	doi_b db 2
	greeting db 'sentence: $'
	aux db ?

data ends

read_string macro location
	; macro that reads a string from the keyboard to location
	push ax
	push dx

		mov ah, 0ah
		lea dx, location
		int 21h

	pop dx
	pop ax
endm

check_palindrome macro string, siz
	push cx
	push si
	push di

		lea si, string ;2 3 4
		lea di, string

		mov al, siz
		mov ah, 0
		sub ax, 1
		add di,	ax

		mov al, siz
		mov ah, 0
		mov cx, ax
		jcxz palindrome

		repeat:

			mov al, [si]
			cmp al, [di]
			jne not_palindrome

			inc si
			dec di

		loop repeat

		palindrome:
			mov ax, 1
			jmp return

		not_palindrome:
			mov ax, 0
		return:

	pop di
	pop si
	pop cx

endm

print_message macro string
	push ax
	push dx

		mov ah, 09h
		lea dx, string
		int 21h

	pop dx
	pop ax
endm

print_char macro char
	push ax
	push dx

		mov ah, 02h
		mov dl, char
		int 21h

	pop dx
	pop ax
endm

code segment

convert_to_asciispace macro string
	push bx

		mov bl, string[1]
		mov bh, 0
		add bx, offset string
		add bx, 2
		mov byte ptr [bx], ' '

	pop bx

endm

start:
	mov ax, data
	mov ds, ax
	mov es, ax

	print_message greeting
	read_string string
	convert_to_asciispace string
	print_char 10


	mov cl, string[1]
	add cl, 1
	mov ch, 0

	lea si, string[2]
	lea di, string[2]

	repeat1:

		lodsb ; al := ds:si, si++
		cmp al, ' '
		jne negasit

		cuvant_gasit:

			sub si, 2
			mov ax, si
			sub ax, di
			inc ax
			check_palindrome string[di], al

				;check_palindrome string[2], string[1]
				cmp ax, 1
				je is_palindrome

				is_not_palindrome:
					jmp continue

				is_palindrome:
					inc si
					mov string[si], '$'
					print_message string[di]
					mov string[si], ' '
					dec si
					print_char ' '
				continue:

			add si, 2
			mov di, si
		negasit:

	loop repeat1

	exit:
	mov ax, 4c00h
	int 21h

code ends
end start
