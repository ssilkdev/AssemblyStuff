;Program demonstrates changing eip
;_start calls proc1 and then proc1 calls proc2
;proc2 pops the stack twice to get the return address that would bring proc1 back to start
;It stores the offset into eax
;Then add 17 bytes to eax so that the offset it points to is the first mov instruct in proc1

BITS 32

section .text
global _start

_start:
	call proc1
	mov eax,1
	mov ebx,10
	int 0x80

proc1:
	call proc2
	mov eax,1
	mov ebx,20
	int 0x80

proc2:
	pop eax	
	pop eax
	add eax,17
	jmp eax
	mov eax,1
	mov ebx,30
	int 0x80

