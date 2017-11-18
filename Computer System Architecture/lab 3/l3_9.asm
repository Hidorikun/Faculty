; 9. 3*[20*(b-a+2)-10*c]+2*(d-3)
assume ds:data, cs:code

data segment
	a db 30
	b db 40
	c db 1
	d dw 4

data ends

code segment
start:
	push data
	pop ds

	;(b - a + 2) -> al
	mov al, b
	sub al, a
	add al, 2

	; 20*(b-a+2) -> ax
	mov dh,20
	mul dh
	push ax

	; 10 * c -> ax
	mov al, c
	mov dh, 10
	mul dh

	;[20*(b-a+2)-10*c] -> ax
	mov bx, ax
	pop ax
	sub ax, bx

	;3*[20*(b-a+2)-10*c] -> dx:ax
	mov bh, 3
	mov dx, 0
	mul bh
	push dx
	push ax

	;2*(d-3) -> dx:ax
	mov ax, d
	sub ax, 3
	mov dx, 2
	mul dx

	;3*[20*(b-a+2)-10*c]+2*(d-3) ->dx:ax
	pop bx
	add ax, bx
	pop bx
	adc dx, bx

	mov ax, 4c00h
	int 21h
code ends
end start
