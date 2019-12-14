BITS 32

extern printf
extern scanf

section .rodata
	fmt: db "%d", 0
	output: db "factorial is %d",10,0	

section .text
	global main

	main:
		push ebp
		mov ebp, esp
		sub esp, 0x10

		lea eax, [ebp-0x4]  #entering the value
		push eax
		push fmt
		call scanf
    
		mov ecx, 1	
		mov ebx, 0			
		mov edx, dword [ebp-0x4]	; moving the entered value to edx for comparison
		L1:
			add ebx, 1
			imul ecx, ebx		; the quotient is stored in ecx
			cmp ebx, edx		; to make sure that we multiply till ebx reaches the value entered.
			jl L1
	
		push ecx
		push output
		call printf
	
	leave
	ret
	