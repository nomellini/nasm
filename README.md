# NASM Assembly Examples

Este repositório contém exemplos e exercícios em NASM para Linux x86-64.

## Estrutura do repositório

- `hello.asm` — exemplo principal de programa em NASM no diretório raiz.
- `hello`, `a.out`, `hello.o` — arquivos compilados/gerados que existem no projeto.
- `01/` — exemplo com `salve.asm` e `makefile` para montagem e execução.
- `02/` — exemplos com `file.asm`, `teste.asm` e saída em `saida.txt`.
- `03/` — exemplo de flags em `flags.asm` e o executável `flags`.
- `04/` — exemplo de `hello.asm` e utilitário `printhex`.
- `ex/` — exemplos adicionais de montagem e de endianess, incluindo `build_asm.sh`.

## Documentação existente

- `leiame.txt` — mostra um comando básico para desassemblar `a.out`:
  ```sh
  objdump -d -Mintel ./a.out
  ```
- `ex/leiame.md` — fornece desafios e dicas para praticar NASM, focando em registradores, syscalls, loops e manipulação de dados.

## Como usar

Para montar e linkar um arquivo NASM típico:

```sh
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
```

Para desassemblar um executável (`a.out` ou outro):

```sh
objdump -d -Mintel ./a.out
```

## Próximos passos

- Adicionar mais READMEs específicos em cada subpasta com instruções de compilação e execução.
- Organizar os exemplos por tema: syscalls, loops, strings, flags e endianness.
- Remover ou regenerar binários (`*.o`, `a.out`, executáveis) se desejar manter o repositório limpo.

## Notas

Este repositório já contém arquivos binários compilados e executáveis. Se você quiser manter apenas o código-fonte, é recomendado adicionar um `.gitignore` para excluir `*.o`, `a.out` e nomes de executáveis como `hello`, `salve`, `flags`, `printhex`, `ex01`, etc.
