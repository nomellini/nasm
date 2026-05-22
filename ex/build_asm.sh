#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Uso: $0 <arquivo.asm> [saida]"
  echo "Exemplo: $0 ex/endianness.asm"
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
  usage
  exit 1
fi

asm_file="$1"

if [[ ! -f "$asm_file" ]]; then
  echo "Erro: arquivo nao encontrado: $asm_file"
  exit 1
fi

if [[ "${asm_file##*.}" != "asm" ]]; then
  echo "Erro: o arquivo precisa ter extensao .asm"
  exit 1
fi

if ! command -v nasm >/dev/null 2>&1; then
  echo "Erro: nasm nao esta instalado ou nao esta no PATH"
  exit 1
fi

if ! command -v ld >/dev/null 2>&1; then
  echo "Erro: ld nao esta instalado ou nao esta no PATH"
  exit 1
fi

obj_file="${asm_file%.asm}.o"
output_file="${2:-${asm_file%.asm}}"

echo "[1/2] Compilando: $asm_file -> $obj_file"
nasm -f elf64 "$asm_file" -o "$obj_file"

echo "[2/2] Linkando: $obj_file -> $output_file"
ld "$obj_file" -o "$output_file"

echo "Pronto: $output_file"
