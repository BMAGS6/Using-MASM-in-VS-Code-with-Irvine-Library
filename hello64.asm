; 64-bit "Hello, world" with no CRT: call Kernel32 directly
; Windows x64 calling convention:
;   RCX, RDX, R8, R9 are the first 4 args
;   Caller must reserve 32 bytes of shadow space and keep 16B stack alignment

option casemap:none
EXTERN  GetStdHandle:PROC
EXTERN  WriteFile:PROC

STD_OUTPUT_HANDLE equ -11            ; constant defined by Windows headers

.data
msg db "Hello from x64 MASM!", 13, 10, 0
msg_len equ ($ - msg) - 1            ; don't count the trailing 0

.code
main PROC
    ; Reserve 32 bytes shadow + fix alignment (RSP enters at 16n+8)
    sub         rsp, 28h                 ; 40 bytes → aligned, provides shadow space

    ; HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
    mov         ecx, STD_OUTPUT_HANDLE   ; RCX = STD_OUTPUT_HANDLE
    call        GetStdHandle
    mov         rbx, rax                 ; save handle (RBX is callee-saved)

    ; Prepare WriteFile(h, msg, msg_len, &written, NULL)
    ; We'll use shadow space as temporary storage for 'written' (DWORD)
    lea         rdx, msg                 ; RDX = lpBuffer
    mov         r8d, msg_len             ; R8D = nNumberOfBytesToWrite
    lea         r9,  [rsp+8]             ; R9  = LPDWORD lpNumberOfBytesWritten (use shadow space)
    mov         qword ptr [rsp+20h], 0   ; 5th arg (LPOVERLAPPED) on stack = NULL
    mov         rcx, rbx                 ; RCX = hFile
    call        WriteFile

    xor         eax, eax                 ; return 0
    add         rsp, 28h
    ret
main ENDP

END
