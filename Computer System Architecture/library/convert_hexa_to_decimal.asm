; CONVERT HEXA TO DECIMAL

assume cs:code, ds:data

data segment
	case1 db 'ABC9'
	case2 db 'CAF'
	case3 db 'A4'
	case4 db '1'
	_16w dw 16
data ends

code segment

convert_hexa_decimal macro string, string_size
	local repeat
	local end_convert
	local continue
	local cifra
	; a macro that converts a hexadecimal number into ax 
	push bx
	push di
	push cx
	push si

		mov bx, 1
		mov di, offset string
		add di, string_size
		dec di

		mov cx, string_size
		cmp cx, 0
		je end_convert

		mov si, 0
		repeat:
			mov al, [di]
			dec di
			cmp al, '9'
			jbe cifra

				sub al, 'A' - 10

			jmp continue
			cifra:
				sub al, '0'

			continue:
				mov ah, 0
				mul bx
				xchg bx, ax
				mul _16w
				xchg bx, ax
				add si, ax

			loop repeat

		end_convert:
			mov ax, si

	pop si
	pop cx
	pop di
	pop dx
endm

start:

	mov ax, data
	mov ds, ax

	convert_hexa_decimal case1, 4
	convert_hexa_decimal case2, 3
	convert_hexa_decimal case3, 2
	convert_hexa_decimal case4, 1


	mov ax, 4c00h
	int 21h
code ends
end start
