INCLUDE Irvine32.inc

.data
msg BYTE "Hello from MASM in VS Code!", 0

.code
main PROC
        call        Clrscr
        mov         edx, OFFSET msg
        call        WriteString
        call        Crlf
        exit
main ENDP

END main
