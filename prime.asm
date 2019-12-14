BITS 32

extern printf
extern scanf

section .rodata
	isprime: db "It's a prime number", 10, 0
	notprime: db "It's not a prime number", 10, 0
	input: db "%d", 0
	output: db "%d", 10, 0

section .text
	global main

	main:
		push ebp
		mov ebp, esp
		sub esp, 0x10

		lea eax, [ebp-0x4]
		push eax
		push input
		call scanf

		mov ecx, dword [ebp-0x4]	
		cmp ecx, 1
		je exitcomposite

		mov ecx, dword [ebp-0x4]	
		cmp ecx, 2
		je exitprime
		
		mov ebx, 1
		L1:
			mov ecx, dword [ebp-0x4]

			inc ebx
			mov edx, 0
			mov eax, ecx
			div ebx

			cmp edx, 0
			je exitcomposite

			dec ecx

			cmp ebx, ecx
			jne L1
			je exitprime
		
		exitcomposite:
			push notprime
			call printf
			jmp L2
		exitprime:
			push isprime
			call printf
	L2:	
	leave
	ret
	