; Swap characters in pairs.

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx

	mov ebx, [ebp + 8]
	mov ecx, ebx

	sub ebx, 2
	dec ecx

loop:
	add ebx, 2
	add ecx, 2

	mov dl, [ebx]
	test dl, dl
	jz end

	mov dh, [ecx]
	test dh, dh
	jz end

swap:
	mov [ecx], dl
	mov [ebx], dh
	jmp loop

end:
	pop ebx

	mov esp, ebp
	pop ebp
	ret