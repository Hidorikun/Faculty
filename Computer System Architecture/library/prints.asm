;PRINTS

assume ds:data, cs:code

data segment

	tablee db '0123456789ABCDEF'
	zece_w dw 10
	saispe_w dw 16
	case1 dw 15
	case2 dw 16
	case3 dw 0AFCEh

data ends

print_char macro char
	; print <char> to the screen
	push ax
	push dx

		mov ah, 02h
		mov dl, char
		int 21h

	pop dx
	pop ax
endm

print_msg macro msg
	; print <msg> to screen
	push ax
	push dx

		mov ah, 09h
		lea dx, msg
		int 21h

	pop dx
	pop ax
endm

code segment

printBase10 proc
	;procedure that prints to the screen the positive number in ax in base 10
	push dx
	push cx
	push ax

	mov cx, 0

	.dividee:
		mov dx, 0
		div zece_w
		push dx
		inc cx
	cmp ax, 0
	jne .dividee

	.restore_and_print:
		pop dx
		add dl, '0'
		print_char dl
	loop .restore_and_print

	pop ax
	pop cx
	pop dx
	ret
endp


printBase16 proc
	;procedure that prints to the screen the positive number in ax in base 16
	push dx
	push cx
	push ax
	push bx

	mov cx, 0

	.divideee:
		mov dx, 0
		div saispe_w
		push dx
		inc cx
	cmp ax, 0
	jne .divideee

	.restore_and_printt:
		pop ax
		lea bx, tablee
		xlat
		print_char al
	loop .restore_and_printt

	pop bx
	pop ax
	pop cx
	pop dx
	ret
endp

printBase2 proc
	;procedure that prints to the screen the positive number in ax in base 2
	push cx
	push ax

	mov cx, 16
	.repeataa:
		shl ax, 1
		jc .print_one

		.print_zero:
			print_char '0'

		jmp .continuee
		.print_one:
			print_char '1'
		.continuee:
	loop .repeataa

	pop ax
	pop cx
	ret
endp


start:

	mov ax, data
	mov ds, ax

	mov ax, 32222
	call printBase16

	mov ax, 4c00h
	int 21h

code ends
end start
