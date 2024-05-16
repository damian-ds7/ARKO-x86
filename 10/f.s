; Reverse the order of digits, leaving the other characters in their original places.

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx

	mov ebx, [ebp + 8]
	mov ecx, ebx

	dec ebx
	dec ecx

get_ptr_to_end:
	inc ecx
	mov dl, [ecx]
	test dl, dl
	jnz get_ptr_to_end

inc_front:
	inc ebx
	cmp ebx, ecx
	jge end
	mov dl, [ebx]

	cmp dl, '0'
	jl inc_front
	cmp dl, '9'
	jg inc_front

dec_back:
	dec ecx
	mov dh, [ecx]

	cmp dh, '0'
	jl dec_back
	cmp dh, '9'
	jg dec_back

swap:
	mov [ecx], dl
	mov [ebx], dh
	jmp inc_front

end:
	pop ebx

	mov esp, ebp
	pop ebp
	ret