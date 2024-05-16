; remove the last sequence of decimal digits

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi

	mov eax, [ebp + 8]
	mov esi, eax
	xor ebx, ebx
	xor edx, edx

	dec eax

find_last_seq:
	inc eax
	mov cl, [eax]
	test cl, cl
	jz str_end

	cmp cl, '0'
	jl next

	cmp cl, '9'
	jg next

	inc ebx
	jmp find_last_seq

next:
	mov esi, eax
	sub esi, ebx
	mov edx, ebx
	xor ebx, ebx
	jmp find_last_seq

str_end:
	test ebx, ebx
	jz load_first_num
	mov esi, eax
	sub esi, ebx
	mov edx, ebx

load_first_num:
	mov eax, esi
	add eax, edx
	mov cl, [eax]

remove_last_seq:
	mov [esi], cl
	test cl, cl
	je end

	inc eax
	inc esi
	mov cl, [eax]
	jmp remove_last_seq

end:
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret