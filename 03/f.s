; Leave last n digits removing all other characters

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

	dec eax

count_digits:
	inc eax
	mov dl, [eax]
	cmp dl, 0
	jz count_removed_digits

	cmp dl, '0'
	jb count_digits
	cmp dl, '9'
	ja count_digits

	inc edi
	jmp count_digits

count_removed_digits:
	sub edi, ebx
	mov eax, ecx

begin:
    mov dl, [eax]
	cmp dl, 0
	jz end

	cmp dl, '0'
	jb next
	cmp dl, '9'
	ja next

	dec edi
	cmp edi, 0
	jge next

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