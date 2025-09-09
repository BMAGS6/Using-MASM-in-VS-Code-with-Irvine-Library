; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

; NOTE: This program will NOT produce output, as it does not call
; the OS to do so for it. It completes the operation, but it does not appear to the
; user that it does so.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code

main proc
	mov     eax,5				
	add	eax,6				

	invoke  ExitProcess,0
main endp

end main