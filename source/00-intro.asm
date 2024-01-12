; About assembly:
; Each assembly language only works on a specific CPU architecture, like ARM or x86
; Assembler: nasm (the netwide assembler) for x86 chips
; Assembly program is divided into three sections:
; - text:
;       Contains the actual logic for the program.
;       By convention, it contains an entrypoint called start which is where the code start executing
; - bss (block starting symbol):
;       Contains variables that might change throughout the lifecycle of the app
; - data:
;       Where we can initialize constants or data that does not change    

; Program entrypoint
; global keyword is used to make an identifier accessible to the linker
; the identifier followed by a colon will create a label
; label are used to name location in our code
global _start
_start:
	mov eax, 1
    mov ebx, 42
    int 0x80
