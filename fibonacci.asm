BITS 32

extern printf
extern scanf

section .rodata
	output: db "The n-th term of the Fibnoacci series is %d", 10, 0
	input: db "%d", 0 

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
		mov ebx, 0
		je L2

		mov ecx, dword [ebp-0x4]
		cmp ecx, 2
		mov ebx, 1
		je L2

		mov edi, 0 ;a
		mov ebx, 1 ;b
		mov edx, 0

		sub ecx, 2 	

		L1:
			inc edx
			mov esi, ebx
			add ebx, edi
			mov edi, esi			
			cmp edx, ecx
			jne L1
		L2:
		push ebx
		push output
		call printf
				

		leave 
		ret
			