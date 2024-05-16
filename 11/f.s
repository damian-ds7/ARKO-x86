; Reverse the order of letters, leaving the other characters in their places.

%macro m_check_large 3 ; 1 - register, 2 - current_label, 3 - next_label
	cmp %1, 'A'
	jl %2
	cmp %1, 'Z'
	jg %3
%endmacro

%macro m_check_small 2 ; 1 - register, 2 - check_large label
	cmp %1, 'a'
	jl %2
	cmp %1, 'z'
	jg %2
%endmacro


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

f_check_large:
	m_check_large dl, inc_front, f_check_small

f_check_small:
	m_check_small dl, inc_front

dec_back:
	dec ecx
	cmp ecx, ebx
	jle inc_front
	mov dh, [ecx]

b_check_large:
	m_check_large dh, dec_back, b_check_small

b_check_small:
	m_check_small dh, dec_back

swap:
	mov [ecx], dl
	mov [ebx], dh
	jmp inc_front

end:
	pop ebx

	mov esp, ebp
	pop ebp
	ret