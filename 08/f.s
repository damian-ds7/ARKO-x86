; Scan first decimal number

section .text
global f

f:
    push ebp
    mov ebp, esp

	mov ecx, [ebp + 8]
	xor eax, eax
	xor edx, edx

	dec ecx

find_first_digit:
	inc ecx
	mov dl, [ecx]
	test dl, dl
	jz end

	cmp dl, '0'
	jl find_first_digit
	cmp dl, '9'
	jg find_first_digit

	sub dl, '0'
	add al, dl

read_num:
	inc ecx
	mov dl, [ecx]
	test dl, dl
	jz end

	cmp dl, '0'
	jl end
	cmp dl, '9'
	jg end

	sub dl, '0'
	lea eax, [eax + eax * 4]
	sal eax, 1
	add eax, edx
	jmp read_num

end:
	mov esp, ebp
	pop ebp
	ret