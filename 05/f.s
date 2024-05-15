; Leave only the longest sequence of decimal digits

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi

	mov eax, [ebp + 8]

	mov ebx, 0
	mov ecx, 0

get_num_seq:
	mov dl, [eax + ecx]

	cmp dl, '0'
	jl reset_counter
	cmp dl, '9'
	jg reset_counter

	inc ecx
	jmp get_num_seq

reset_counter:
	add eax, ecx
	mov esi, eax
	inc eax
	sub esi, ecx
	cmp ecx, ebx
	jle reset_counter_end
	mov ebx, ecx

reset_counter_end:
	mov ecx, 0
	cmp dl, 0
	je string_end
	jmp get_num_seq

string_end:
	mov eax, [ebp + 8]

save_seq:
	dec ebx
	mov cl, [esi]
	mov [eax], cl
	inc esi
	inc eax
	cmp ebx, 0
	jne save_seq

end:
	mov byte [eax], 0

	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret