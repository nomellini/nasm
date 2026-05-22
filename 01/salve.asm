section .data

  msg db "Salve, simpatia!",10 	; 'msg' - rotulo dos dados definidos
								; 'db'  - os dados são definidos como
								;         uma cadeia de bytes.

  len equ $ - msg		; len - rótulo do tamanho da mensagem.
						; equ - pseudo-instrução para definir constantes.
						; $   - Último endereço ocupado na memória.
						; msg - Rótulo do endereço inicial da mensagem.

section .text

  global _start   		; A diretiva 'global' torna o rotulo '_start'
                  		; visível de qualquer parte do programa


_start:					; aqui está o inicio do programa

	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall

	mov rax, 60
	mov rdi, 0
	syscall