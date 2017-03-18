;Calls 2 procs from _start then adds 4 bytes to esp and jumps to esp
;esp should now point to _start and program will exit with 10
section .text
global _start

_start:
	call test
	mov eax,1
	mov ebx,10
	int 0x80

test:
	call test2
	mov eax,1
	mov ebx,20
	int 0x80

test2:
	mov eax,1
	add esp,4
	jmp [esp]
	int 0x80
