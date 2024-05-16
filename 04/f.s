; Remove repetitions of characters

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi

	mov eax, [ebp + 8]

	dec eax

next_char:
	inc eax
    mov dl, [eax]
	test dl, dl
	jz end
	mov ebx, eax
	inc ebx

loop:
	mov cl, [ebx]
	test cl, cl
	jz next_char
	cmp cl, dl
	mov esi, ebx
	je shift
	inc ebx
	jmp loop

shift:
	mov dh, [esi + 1]
	mov byte [esi], dh
	test dh, dh
	jz loop
	inc esi
	jmp shift

end:
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret