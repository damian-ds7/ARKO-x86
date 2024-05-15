; Leave characters with codes from a to b, a < b

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi

	mov eax, [ebp + 8]
	mov bl, [ebp + 12]
	mov cl, [ebp + 16]
	mov esi, eax

loop:
	mov dl, [eax]
	cmp dl, 0
	je end

	cmp dl, bl
	jl next

	cmp dl, cl
	jg next

	mov [esi], dl
	inc esi

next:
	inc eax
	jmp loop

end:
	mov byte [esi], 0

	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret