section .data
	oneBin db '1',0x0a
	zeroBin db '0',0x0a
	len equ 2

section .text
global _start

_start:
	mov ebp,0xFFFFFFF0		;binary string to write
	mov ecx,32			;Len of binary string
	L1:				;Loop for writing string
		push ecx		;Push current loop index to stack 
		shl ebp,1
		jc L3
		call _writeZeroBin
		pop ecx
		loop L1

	mov eax,1
	mov ebx,0
	int 0x80	

L3:
	call _writeOneBin
	pop ecx
	loop L1
	
;Writes one to stdout
_writeOneBin:
	push eax
	push ebx
	push ecx
	push edx 		
	mov eax,4	;Sys_write
	mov ebx,1	;stdin
	mov ecx,oneBin	;Write 1
	mov edx,len	;len = 1
	int 0x80	;interrupt
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
;Writes zero to stdout
_writeZeroBin:
	push eax
	push ebx
	push ecx
	push edx
	mov eax,4
	mov ebx,1
	mov ecx,zeroBin
	mov edx,len
	int 0x80
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
;Write to Binary
	
