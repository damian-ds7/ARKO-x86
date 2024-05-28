section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi
	push edx

	mov eax, [ebp + 8]

load:
	mov ebx, [eax]

	test bl, bl
	jz end

first:
	cmp bl, 'a'
	jl second
	sub bl, 0x20

second:
	cmp bh, 'Z'
	jg check_last_two
	add bh, 0x20

check_last_two:
	mov ecx, ebx
	shr ecx, 16
	mov esi, 0x2000

third:
	cmp ch, 'Z'
	jl modify_third
	mov esi, -0x2000

modify_third:
	add ecx, esi
	mov esi, 0x20

fourth:
	cmp cl, 'Z'
	jl modify_fourth
	mov esi, -0x20

modify_fourth:
	add ecx, esi

save:
	shl ecx, 16
	movsx ebx, bx
	add ecx, ebx
	mov [eax], ecx
	lea eax, [eax + 4]
	jmp load

end:
	pop edx
	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret