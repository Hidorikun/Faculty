; 1. Being given two alphabetical ordered strings of characters, s1 and s2, build using merge sort the ordered string of bytes that contain all characters from s1 and s2.

assume ds:data, cs:code

data segment
	s1 db '0'
	len1 equ $-s1
	s2 db '0246'
	len2 equ $-s2
	d db len1+len2 dup(?)
	i dw 0
	j dw 0 ;indices for s1, s2 respectively obs the current indice in d will always be i + j
data ends


code segment
min_max proc
	; arguments al, ah the two numbers needed for comparison
	; returs - in al : min(al, ah) - in ah : max(al, ah)
	cmp al, ah
	jb .ok ;if it is indeed lower, then everything is ok and we can procede
	;else we swich them so it is ok
	xchg al, ah ; al will always be the smallest once we get here
	.ok:
	ret
endp

push_in_d proc
	;assumes that what we want to push in d is in al
	push di
	lea di, d
	add di, i
	add di, j
	stosb
	pop di
	ret
endp
start:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, s1
	lea di, s2
	cld
	mov al, len1
	mov ah, len2 ;we suppose that len1 is lower than len2, thus we put in in a low
	call min_max
	; now we have in al the smallest length

	mov ah, 0
	mov cx, ax

	repeat:
		cmpsb ; compare s1[i] with s2[j], si++, di++
		dec si
		dec di
		; we bring them to the current position again
		jb first

		second:
			xchg di, si
			lodsb
			xchg di, si
			call push_in_d
			inc j
			jmp continue
		first:
			lodsb
			call push_in_d
			inc i

		continue:
	cmp j, cx
	jb repeat

	mov al, len1
	mov ah, len2
	cmp al, ah
	ja	s1_bigger

	s2_bigger:
		lea si, s2
		add si, j
		jmp proceed
	s1_bigger:
		lea si, s1
		add si, i
	proceed:
	lea di, d
	add di, i
	add di, j

	mov cx, len1+len2
	sub cx, j
	sub cx, i
	rep movsb

	mov ax, 4c00h
	int 21h
code ends
end start
