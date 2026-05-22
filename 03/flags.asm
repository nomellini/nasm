; Aprendicados sobe o registador de flags (RFLAGS).
; O RFLAGS é um registador de 64 bits que contém várias flags de estado e controle do processador.
; Ele é atualizado automaticamente pelo processador em resposta a várias operações, como aritmética,
; controle de fluxo, e outras instruções. O RFLAGS é usado para determinar o resultado de operações e para controlar o comportamento do processador.
; Algumas das flags mais comuns no RFLAGS incluem:
; - CF (Carry Flag): Indica se houve um carry (transbordo) em uma operação aritmética.
; - ZF (Zero Flag): Indica se o resultado de uma operação é zero.
; - SF (Sign Flag): Indica o sinal do resultado de uma operação (positivo ou negativo).
; - OF (Overflow Flag): Indica se houve um overflow em uma operação aritmética.
; - IF (Interrupt Flag): Controla se as interrupções estão habilitadas ou desabilitadas.
; - DF (Direction Flag): Controla a direção de operações de string (incrementar ou decrementar os índices).
; - TF (Trap Flag): Permite a execução passo a passo para depuração.
; - IOPL (I/O Privilege Level): Indica o nível de privilégio para operações de I/O.
; - NT (Nested Task): Indica se a tarefa atual é uma tarefa aninhada.
; - RF (Resume Flag): Usada para controlar a retomada de exceções.
; - VM (Virtual-8086 Mode): Indica se o processador está em modo virtual 8086.
; Neste exemplo, vamos apenas ler o valor do RFLAGS e armazená-lo em um registrador para posterior uso.
; i registers $rax $eax $ax $ah $al

section .data

section .text
    global _start

_start:

    mov rax, 123
    shl rax, 2
    shl rax, 2 
    shl rax, 2
    shl rax, 3
    shl rax, 4
    shl rax, 5
    shl rax, 4    
shl rax, 5
shl rax, 5
shl rax, 5
shl rax, 5
shl rax, 5

    

_exit:
    mov rax, 60             ; syscall 60 = exit
    mov rdi, rax            ; status 0 = sucesso
    syscall