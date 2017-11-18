;13. Being given a string of bytes and a substring of this string, eliminate all occurrences of this substring from the initial string.
assume ds:data, cs:code

data segment
	s db 'ana are mere, mere are ana ananana'
	len1 equ $-s
	d db 'ana'
	len2 equ $-d
	i dw 0
	true db 1
	false db 0
data ends

code segment
match proc
	;si - offset of the haystack
	;di - offset of the needle
		push cx
		push si
		push di
			lea di, d
			mov cx, len2
			cmp cx, cx ; we make sure that the flags are set for equality
			repe cmpsb
			cmp cx, 0
			ja .not_found

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

clear proc
	; clears a given string - puts '' everywhere
	push cx
	mov al, ''
	mov cx, len1
	sub cx, i
	rep stosb
	pop cx
	ret

endp
start:
	mov ax, data
	mov es, ax
	mov ds, ax

	lea si, s
	lea di, s
	cld

	mov cx, len1-len2

	repeat:
		call match
		; ah 1 if found, 0 if not found
		cmp ah, false
		je not_found
		found:
			add si, len2
			sub cx, len2
			inc cx
			jmp continue
		not_found:
			movsb
			inc i
		continue:

	loop repeat

	call clear

	mov ax, 4c00h
	int 21h
code ends
end start
