section .data

    msg: db "abc", 10, 0
    len: equ $ - msg - 1 

section .text
    global _start

_start:
    mov rax, 0xf0da
    mov rbx, rax

    mov rbx, 0                  ; meu indice começa em zero
_toupper:

    mov al, [msg + rbx]         ; al recebe o conteudo de memória de [mensagem + indice]
    
    cmp al, 'a'                 ; compara com 'a'    
    jl _testafim                ; se for menor, vai para o próximo

    cmp al, 'z'                 ; compara com 'z'
    jg _testafim                ; se for maior, vai para o proximo

    ; esta entre 'a' e 'z'
    sub al, 32                  ; tira 32 de al
    mov [msg + rbx], al         ; altera [mem+indice] com o valor da letra - 32 

_testafim:
    inc rbx                     ; incremente o indice
    cmp rbx, len                ; compara com o comprimento da mensagem
    jne _toupper                ; se não for igual, volta para mudar a próxima letra

_print:                         ; syscall básico, imprime a mensagem toda.
    mov rax, 1
    mov rdi, 1
    lea rsi, msg
	mov rdx, len
	syscall

    

_exit:
    mov rax, 60
    mov rdi, rcx
    syscall


; i registers $rax $rbx
; x/3cb &msg
; x/s (char *)&msg