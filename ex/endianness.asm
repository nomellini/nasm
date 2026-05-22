section .data


demo1:  dq 0X1122334455667788
demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
codes:  db '0123456789ABCDEF'
newline db 10

section .text
    global _start

_print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1 ; tamanho
    syscall
    ret

_print_hex:
    
    mov rax, rdi
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64

.loop:

    push rax
    sub rcx, 4

    sar rax, cl
    and rax, 0xf

    lea rsi, [codes + rax]
    mov rax, 1

    push rcx
    syscall
    pop rcx

    pop rax

    test rcx, rcx
    jnz .loop

    ret

_start:

    mov rdi, [demo1]
    call _print_hex
    call _print_newline

    mov rdi, [demo2]
    call _print_hex
    call _print_newline

    mov rax, 60
    xor rdi, rdi
    syscall

{"ClientId":"23DO38"}
{"ClientId":"23D038","NomeCliente":"Caroline","Email":"assistentesst@unicafacilities.com.br","Descricao":"Cliente inválido, abertura chamado administrativo."}