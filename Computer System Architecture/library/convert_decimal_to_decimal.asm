; CONVERT DECIMAL TO DECIMAL

assume cs:code, ds:data

data segment
	case1 db '1231'
	case2 db '321'
	case3 db '1233'
	case4 db '9999'
	_10w dw 10
data ends

code segment

convert_decimal_decimal macro string, string_size
	local repeat
	local end_convert
	local continue
	local cifra
	; a macro that converts a string decimal number into ax
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

		mov si, 0 ; keep the result safe from operations in ax
		repeat:
			mov al, [di]
			dec di
			sub al, '0'

			continue:
				mov ah, 0
				mul bx
				xchg bx, ax
				mul _10w
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

	convert_decimal_decimal case1, 4
	convert_decimal_decimal case2, 3
	convert_decimal_decimal case3, 2
	convert_decimal_decimal case4, 1


	mov ax, 4c00h
	int 21h
code ends
end start
