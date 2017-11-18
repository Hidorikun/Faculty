; CONVERT BINARY TO DECIMAL

assume cs:code, ds:data

data segment
	case1 db '101'
	case2 db '1'
	case3 db '111'
	case4 db '1010'
	_2w dw 2
data ends

code segment

convert_binary_decimal macro string, string_size
	local repeat
	local end_convert
	local continue
	local cifra
	; macro that converts a string binary number into ax
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
			sub al, '0'

			continue:
				mov ah, 0
				mul bx
				xchg bx, ax
				mul _2w
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

	convert_binary_decimal case1, 3
	convert_binary_decimal case2, 1
	convert_binary_decimal case3, 3
	convert_binary_decimal case4, 4

	mov ax, 4c00h
	int 21h
code ends
end start
