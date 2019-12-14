BITS 32

extern printf
extern scanf

section .rodata
	fmt: db "%d", 0
	output: db "the factorial is %d",10,0	

section .text
	global main
	global factorial

	factorial:
		push ebp
		mov ebp, esp
		sub esp,0x10		

		cmp eax, 0x0
		jne l2
		
		mov eax,1
		je l1
		
		l2:
		mov [ebp-0x4], eax
		sub eax,0x1
		
		push eax
		call factorial
		imul eax,[ebp-0x4]

		mov [ebp-0x4],eax

		l1:
			leave
			ret	

	main:
		push ebp
		mov ebp, esp
		sub esp, 0x10

		lea eax, [ebp-0x4]  ;entering the value
		push eax
		push fmt
		call scanf
    
		mov eax, [ebp-0x4]
		push eax
		call factorial

		push eax
		push output
		call printf
			
	leave
	ret
