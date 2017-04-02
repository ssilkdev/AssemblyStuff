BITS 32

section .data
;=====================STRINGS=========
	msg db "Hello World!",0x0a
	len equ $ - msg
;=====================================


;=====================CONSTANTS=======
	LOOPCOUNT	equ	4	

	SYS_EXIT 	equ 	1
	SYS_WRITE 	equ 	4
	STDOUT 		equ 	1
	
	TRAP		equ	0x80

	EXIT_OK		equ	0
;=====================================
	
;=====================================
;		START
;=====================================
section .text
global _start

_start:
	push msg
	push len
	mov ecx,LOOPCOUNT
L1:
	push ecx
	call PrintString
	pop ecx
loop L1
	
push EXIT_OK
call ExitProgram

;======================================
;		PRINTSTRING
;======================================
;======================================
;		PARAMETERS
;======================================
section .data
	CHARMSG		equ	16
	LEN		equ	12

;======================================
;		CODE
;======================================
section .text
PrintString:
	push ebp	
	mov ebp,esp

	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,[ebp + CHARMSG]
	mov edx,[ebp + LEN]
	int TRAP

	pop ebp
	ret

;=======================================
;		EXITPROGRAM
;=======================================
;=======================================
;		PARAMETERS
;=======================================
section .data
	EXITCODE	equ	8

;=======================================
;		CODE
;=======================================
section .text
ExitProgram:
	push ebp
	mov ebp,esp
	
	mov eax,SYS_EXIT
	mov ebx,[ebp + EXITCODE]
	int TRAP
	
