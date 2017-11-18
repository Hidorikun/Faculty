; FILE WRITING WITH MACROS

assume cs:code, ds:data
data segment
	msg db 'Name of the file: $'
	fileName db 12,?,13 dup (?)
	buffer db 200, ?, 210 dup (?)
	handler dw 0
	aux db ?, 1, ?
data ends

print_msg macro msg
	; print message at offset msg, '$'
	push ax
	push dx
		mov ah, 09h
		mov dx, offset msg
		int 21h
	pop dx
	pop ax

endm

read_from_standard_input macro string
	; read from keyboard a string
	push ax
	push dx

		mov ah, 0ah
		mov dx, offset string
		int 21h

	pop dx
	pop ax
endm

transform_to_asciiz macro string
	; stringu trebuie sa fie de forma nr, siz, buff
	push bx
		mov bl, string[1]
		mov bh, 0
		add bx, offset string
		add bx, 2
		mov byte ptr [bx], 0
	pop bx
endm

open_file macro fileName
	; returns: ax- handler
	push dx
		mov ah, 3dh
		mov al, 1 ; open file for writing
		mov dx, offset fileName+2
		int 21h
	pop dx
endm

read_from_file macro handler, buffer
	push bx
	push dx

		mov ah, 3fh
		mov bx, handler
		mov dx, offset buffer
		mov cx, 200; we read a maximum of 200 characters
		int 21h

	pop dx
	pop bx
endm


write_to_file macro handler, buffer
	push bx
	push dx
	push cx

		mov ah, 40h
		mov bx, handler
		mov cl, buffer[1]
		mov ch, 0
		mov dx, offset buffer[2]
		int 21h

	pop cx
	pop dx
	pop bx
endm

write_char_to_file macro handler, char, aux
	push ax

		mov al, char
		mov aux[2], al
		mov ax, handler
		write_to_file handler, aux

	pop ax
endm

close_file macro handler
	push ax
	push bx
		mov ah, 3eh
		mov bx, handler
		int 21h
	pop bx
	pop ax
endm


print_char macro char
	push dx
	push ax

		mov dl, char
		mov ah, 02h
		int 21h

	pop ax
	pop dx

endm

code segment
start:
	mov ax, data
	mov ds, ax

	print_msg msg
	read_from_standard_input fileName
	transform_to_asciiz	fileName
	open_file fileName

	mov handler, ax
	rept 200
		write_char_to_file handler, ' ', aux
	endm
	close_file handler
	open_file fileName
	mov handler, ax

	print_char 10
	read_from_standard_input buffer

	write_to_file handler, buffer


	mov ax,4c00h
	int 21h

code ends
end start
