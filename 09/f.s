; Scan first hex number

section .text
global f

f:
    push ebp
    mov ebp, esp

	mov ecx, [ebp + 8]
	xor eax, eax
	xor edx, edx

	dec ecx

first_digit:
	inc ecx
	mov dl, [ecx]
	test dl, dl
	jz end

	cmp dl, '0'
	jl first_digit
	cmp dl, '9'
	jg first_large

	sub dl, '0'
	add al, dl
	jmp calculate_remaining_value

first_large:
	cmp dl, 'A'
	jl first_digit
	cmp dl, 'F'
	jg first_small

	sub dl, 55
	add al, dl
	jmp calculate_remaining_value

first_small:
	cmp dl, 'a'
	jl first_digit
	cmp dl, 'f'
	jg first_digit

	sub dl, 87
	add al, dl

calculate_remaining_value:
	inc ecx
	mov dl, [ecx]
	test dl, dl
	jz end

check_digit:
	cmp dl, '0'
	jl end
	cmp dl, '9'
	jg check_large

	sub dl, '0'
	sal eax, 4
	add eax, edx
	jmp calculate_remaining_value

check_large:
	cmp dl, 'A'
	jl end
	cmp dl, 'F'
	jg check_small

	sub dl, 55
	sal eax, 4
	add eax, edx
	jmp calculate_remaining_value

check_small:
	cmp dl, 'a'
	jl end
	cmp dl, 'f'
	jg end

	sub dl, 87
	sal eax, 4
	add eax, edx
	jmp calculate_remaining_value

end:
	mov esp, ebp
	pop ebp
	ret