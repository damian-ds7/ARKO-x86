; Remove repetitions of characters

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx

	mov eax, [ebp + 8]

	dec eax
	inc ecx

next_char:
	inc eax
    mov dl, [eax]
	cmp dl, 0
	jz end
	mov ebx, eax
	inc ebx

loop:
	cmp byte [ebx], dl
	je shift
	inc ebx
	jmp loop

shift:
	mov dh, [ebx + 1]
	mov byte [ebx], dh
	cmp dh, 0
	jz next_char
	inc ebx
	jmp shift

end:
	pop ebx

	mov esp, ebp
	pop ebp
	ret