section .data

    msg db "Fernando Nomellini"
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4          ; syscall: sys_write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, msg        ; pointer to message
    mov edx, len        ; message length
    int 0x80            ; call kernel

_exit:
    mov eax, 1          ; syscall: sys_exit
    mov ebx, len        ; exit code (using message length for demonstration)
    int 0x80            ; call kernel

