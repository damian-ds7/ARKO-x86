; Remove characters with codes from a to b, a < b

section .text
global f

f:
    push ebp
    mov ebp, esp

	push ebx
	push esi

    mov edx, [ebp + 8]
	mov eax, [ebp + 12]
	mov ebx, [ebp + 16]

	mov esi, edx

begin:
    mov cl, [edx]
	test cl, cl
	jz end

	cmp cl, al
	jl save

	cmp cl, bl
	jle next


save:
	mov [esi], cl
	inc esi

next:
	inc edx
    jmp begin

end:
	mov byte [esi], 0

	pop esi
	pop ebx

	mov esp, ebp
	pop ebp
	ret