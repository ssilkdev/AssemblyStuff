BITS 32

section .data
	msg db "Hello, World!",0x0a
	len equ $ - msg

section .text
	global _start

_start:
	mov eax,1
	mov ebx,99
	pushad
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80
	popad
	int 0x80
