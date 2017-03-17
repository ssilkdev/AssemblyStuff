section .bss
	count resw 1
section .data
	msg db "Hello World!",0x0a
	len equ $ - msg
section .text

global _start
global _testLoop

;==============================================
; set ecx to loop amount and jmp to loop
;==============================================
_start:
	mov ecx, 2
	jmp _testLoop

;==============================================
;= Loop through and print Hello World n times =	
;==============================================
_testLoop:
	mov esi,ecx
	mov eax,4
	mov ebx,2
	mov ecx,msg
	mov edx,len
	int 0x80
	mov ecx,esi
	loop _testLoop
	mov eax,1
	mov ebx,0
	int 0x80
	
