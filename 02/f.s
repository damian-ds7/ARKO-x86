; Remove every n-th character

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi
	push edi

	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov ecx, eax
	mov edi, 0

begin:
    mov dl, [eax]
	cmp dl, 0
	jz end

	inc edi
	cmp edi, ebx
	jne save

reset_counter:
	mov edi, 0
	jmp next

save:
	mov byte [ecx], dl
	inc ecx

next:
	inc eax
    jmp begin

end:
	mov byte [ecx], 0

	pop edx
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret