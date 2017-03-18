
;Demonstrates how to move through an array larger then a byte
section .data
arrayD dd 10d, 20d, 30d
section .text
global _start

_start:
	mov esi,3
	mov ebp,[arrayD+2*4] ;ebp = 30d
	mov ebx,ebp
	mov eax,1
	int 0x80
	
