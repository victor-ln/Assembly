global _start

; inline data into the program.
section .data
    ; string of bytes named msg (msg is the label)
    ; db: define byte
    ; 0x0a byte is hex for 10 and its code for newline character '\n'
    msg db "Hello, world!", 0x0a
    ; equ (equate): convert a symbol into a constant
    ; subtract the location of the start of the string from the location after the string
    len equ $ - msg

section .text
_start:
    mov eax, 4      ; sys_write system call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, msg    ; bytes to write
    mov edx, len    ; number of bytes to write
    int 0x80        ; perform system call

    mov eax, 1      ; sys_exit system call
    mov ebx, 0      ; exit status is 0
    int 0x80
