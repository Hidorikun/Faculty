odd;A byte string S is given. Obtain the string D by concatenating the elements found on the even positions of S and then the elements found on the odd positions of S.
;Exemple:
;S: 1, 2, 3, 4, 5, 6, 7, 8
;D: 1, 3, 5, 7, 2, 4, 6, 8

assume ds:data, cs:code

data segment

	s db  1, 2, 3, 4, 5, 6, 7, 8, 9
	len equ $ - s
	d db len dup(?)
	aux dw ?

data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov si, 0
	mov di, 0

	mov ax, len
	mov bl, 2
	div bl
	add al, ah
	mov ah, 0 ; ax ne spune acum cate numere evene trebuie sa avem la inceputul sirului
	mov aux, ax ; acum ne zice aux

	executie:
		mov cx, len
		repeat:
			mov ax, si
			mov bl, 2
			div bl
			cmp ah, 0
			je even

			odd:
				mov al, s[si]
				mov bx, aux
				mov d[di + bx], al
				inc di
			jmp continue

			even:
				mov al, s[si]
				mov d[di], al

			continue:
				inc si
		loop repeat

	mov ax, 4c00h
	int 21h
code ends
end start
