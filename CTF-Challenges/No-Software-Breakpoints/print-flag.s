; This program was written to compute the flag of the challenge 'No Software Breakpoints' of root-me.org

BITS 32

extern printf

section .bss
	flag resb 30
	reversedflag resb 30 

section .rodata

	printflag : db "flag : %s",10, 0
	printreversedflag : db "the flag, reversed : %s", 0

	keys:
	db		0xe0,0x32,0x4f,0x26,0x79,0xda,0x96,0xaf,0x99,0x97,0xac,0x15,0xde,0xec,0x9d
	db 		0x35,0x64,0x78,0xfc,0x87,0x34,0xd5,0x2a,0xcd,0x1e

section .text

	global main

	main:
		push ebp
		mov ebp, esp
		mov edi,0xac77e166
		lea ecx, [keys]
		mov ebx,0

	compute_flag:
		ror edi,1
		mov edx, [ecx+ebx]		
		xor edx,edi 
		mov [flag+ebx],edx
		inc ebx ;a counter
		cmp ebx,25
		jb compute_flag
		
		push flag
		push printflag
		call printf

		lea edi, [flag]
	
	reversing_the_string:
		mov eax, [edi+ebx]
		mov [reversedflag+ecx],eax
		inc ecx
		dec ebx
		cmp ecx,26
		jb reversing_the_string

		push reversedflag
		push printreversedflag
		call printf


	leave 
	ret
