section .data
    filename db 'saida.txt', 0      ; nome do arquivo (null terminated)
    msg      db 'Olá, arquivo!', 10 ; 10 = newline
             db 'Texto a ser escrito no arquivo', 10
    msg_len  equ $ - msg

section .bss
    fd resq 1                        ; reserva espaço para guardar o fd

section .text
    global _start

_start:
    ; === open('saida.txt', O_WRONLY|O_CREAT|O_TRUNC, 0644) ===
    mov rax, 2              ; syscall 2 = open
    mov rdi, filename       ; pathname
    mov rsi, 0x241          ; flags: O_WRONLY(1) | O_CREAT(0x40) | O_TRUNC(0x200)
    mov rdx, 0o644          ; permissões: rw-r--r--
    syscall

    mov [fd], rax           ; kernel retornou o fd em rax — guarda ele

    ; === write(fd, msg, msg_len) ===
    mov rax, 1              ; syscall 1 = write
    mov rdi, [fd]           ; fd que acabamos de abrir
    mov rsi, msg            ; buffer
    mov rdx, msg_len        ; tamanho
    syscall

    mov eax, 4              ; 
    mov ebx, 1              ; 
    mov ecx, msg            ; 
    mov edx, msg_len        ; 
    int 0x80

    ; === write(fd, msg, msg_len) ===
    mov rax, 1              ; syscall 1 = write
    mov rdi, 1              ; fd que acabamos de abrir
    mov rsi, msg            ; buffer
    mov rdx, msg_len        ; tamanho
    syscall    


    ; === close(fd) ===
    mov rax, 3              ; syscall 3 = close
    mov rdi, [fd]           ; fd a fechar
    syscall

    ; === exit(0) ===
    mov rax, 60             ; syscall 60 = exit
    mov rdi, 0              ; status 0 = sucesso
    syscall