; PRINT THE CONTENT OF A FILE TO THE SCREEN 

assume cs:code, ds:data
data segment
	msg db 'Name of the file: $'
	fileName db 12,?,13 dup (?)
	buffer db 210 dup (?)
	handler dw 0
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
		mov al, 0 ; open file for reading
		mov dx, offset fileName+2
		int 21h
	pop dx
endm

read_from_file macro handler, buffer
	push bx
	push dx

		mov ah, 3fh
		mov bx, handler		; BX must contain the handle of an open file
		mov dx, offset buffer	; read in buffer
		mov cx, 200; we read maxim 20 characters
		int 21h

	pop dx
	pop bx
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
	read_from_file handler, buffer

	mov si, ax
	mov buffer[si], '$'

	print_msg buffer

	mov ax,4c00h
	int 21h

code ends
end start
