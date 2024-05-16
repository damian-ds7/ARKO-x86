; Replace each sequence of digits with a specified single character.

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi
	push edx

	mov edx, [ebp + 8]
	mov bl, [ebp + 12]

	mov edi, edx
	mov eax, edx

	dec eax
	dec edi
	xor esi, esi

reset_vars:
	mov eax, edi
	xor esi, esi

find_num_seq:
	inc eax
	mov cl, [eax]
	test cl, cl
	setz ch ; set ch to 1 if it's the end of file
	jz insert_char

	cmp cl, '0'
	jl insert_char

	cmp cl, '9'
	jg insert_char

	inc esi
	jmp find_num_seq

insert_char:
	test esi, esi
	jz find_num_seq
	mov edx, eax
	sub edx, esi
	mov [edx], bl
	inc edx
	dec esi
	test ch, ch
	jnz save_null
	mov edi, edx

	test esi, esi
	jz find_num_seq

remove_seq:
	mov [edx], cl

	test cl, cl
	jz reset_vars

	inc eax
	inc edx
	mov cl, [eax]

	jmp remove_seq

save_null:
	mov [edx], cl

end:
	pop edx
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret