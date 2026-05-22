section .data

    msg1 db "Olá, escreva aqui seu nome: ", 10,0
    msg1_len equ $ - msg1

    msg2 db "Olá, "
    msg2_len equ $ - msg2

section .bss
    name resb 50        ; reserva espaço para o nome do usuário (50 bytes é mais do que suficiente)

section .text
    global _start

_start:
    ; Escreve msg1
    mov rsi, msg1           ; buffer
    mov rdx, msg1_len        ; tamanho
    call _print_str


    ; Lê o nome do usuário
    mov rax, 0              ; syscall 0 = read
    mov rdi, 0              ; fd que acabamos de abrir
    mov rsi, name           ; buffer
    mov rdx, 50            ; número máximo de bytes a ler
    syscall    

    ; Escreve msg2
    mov rax, 1              ; syscall 1 = write
    mov rdi, 1               ; fd que acabamos de abrir
    mov rsi, msg2           ; buffer
    mov rdx, msg2_len        ; tamanho
    syscall    

    ; ; Escreve o nome do usuário
    ; mov rax, 1          ; syscall: sys_write
    ; mov rdi, 1          ; file descriptor: stdout
    ; mov rsi, name       ; pointer para o nome do usuário
    ; mov rdx, 50        ; número máximo de bytes a escrever (pode ser menor que 50, mas garantimos que não ultrapasse)
    ; syscall   


    mov r8, name          ; r8 aponta para o início do nome do usuário       
_loop:
    call _print_char     ; escreve o caractere atual

    inc r8              ; avança para o próximo caractere
    cmp byte [r8], 0    ; verifica se chegamos ao final da string
    jne _loop     ; se não for o final, continua escrevendo

_exit:
    mov eax, 60          ; syscall: sys_exit
    xor edi, edi        ; status: 0
    syscall


_print_str:
    mov rax, 1          ; syscall: sys_write
    mov rdi, 1          ; file descriptor: stdout
    syscall
    ret;

_print_char:
    mov rax, 1          ; syscall: sys_write
    mov rdi, rax          ; file descriptor: stdout
    mov rdx, rax          ; escrevemos um caractere por vez
    mov rsi, r8       ; pointer para o caractere a escrever
    syscall
    ret;    