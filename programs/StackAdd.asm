;Takes two integers from the stack and adds them together

BITS 32

section .data
section .text
global _start

_start:
	push 8d
	push 9d
	call addTwo

addTwo:
	push ebp
	mov ebp,esp
	mov edx, [ebp + 12]
	add edx, [ebp + 8]
	mov ebx,edx
	mov eax,1
	int 0x80
