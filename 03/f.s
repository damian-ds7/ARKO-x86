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
	xor edi, edi

	dec eax

count_digits:
	inc eax
	mov dl, [eax]
	test dl, dl
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
	test dl, dl
	jz end

	cmp dl, '0'
	jb next
	cmp dl, '9'
	ja next

	dec edi
	test edi, edi
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