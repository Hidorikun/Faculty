; FIND NEEDLE IN THE HAISTACK

assume ds:data, cs:code

data segment
	msg1 db 'haistack: $'
	msg2 db 'needle: $'

	foundIt db 'occurence found $'
	notFound db 'not found $'

	s db 200, ?, 200 dup(?)
	d db 30, ?, 31 dup(?)
	true db 1
	false db 0
data ends

print_char macro char
	push ax
	push dx

		mov ah, 02h
		mov dl, char
		int 21h

	pop dx
	pop ax
endm

print_msg macro msg
	push ax
	push dx

		mov ah, 09h
		lea dx, msg
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
		print_char 10

	pop dx
	pop ax
endm

code segment
match proc
		push cx
		push si
		push di
			lea di, d[2]

			mov cl, d[1]
			mov ch, 0	; lenght of the needle

			cmp cx, cx ; we set the flags to equality so that repe can enter
			repe cmpsb ; while equal, compare string of bytes ( exit if cx 0 or not equal)
			cmp cx, 0 	; so if cx is above 0 when we exit
			ja .not_found	; there was something wrong and we didn't find it

			.found:
				mov ah, true
				jmp .return

			.not_found:
				mov ah, false
			.return:

		pop di
		pop si
		pop cx
	ret
endp

start:
	mov ax, data
	mov es, ax
	mov ds, ax

	print_msg msg1
	read_from_standard_input s
	print_msg msg2
	read_from_standard_input d

	lea si, s[2]
	lea di, s[2]
	cld

	mov cl, s[1]
	cmp cl, d[1]
	jb noot_found

	sub cl, d[1]
	mov ch, 0
	repeat:
		call match
		; ah 1 if found, 0 if not found
		cmp ah, false
		je not_found
		found:

			print_msg foundIt
			jmp exit

		not_found:
			inc si

	loop repeat
	noot_found:
	print_msg notFound
	exit:

	mov ax, 4c00h
	int 21h
code ends
end start
