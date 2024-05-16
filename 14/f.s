; Capitalize the first character of each word in a string.

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
	push esi
	push edx

	mov eax, [ebp + 8]

	xor ch, ch
	dec eax

reset_ctrl:
	xor ch, ch

loop:
	inc eax
	mov cl, [eax]
	test cl, cl
	jz end

check_large:
	m_check_large cl, reset_ctrl, check_small
	test ch, ch
	setz ch

check_small:
	test ch, ch
	jnz loop
	m_check_small cl, reset_ctrl

capitalize:
	mov ch, 1
	sub cl, 32
	mov [eax], cl
	jmp loop

end:
	pop edx
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret