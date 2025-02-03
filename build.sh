#!/bin/bash

nasm -f elf32 -g -F dwarf "$1" -o "$1.o"

ld -m elf_i386 "$1.o" -o "$1.run"

echo "Executable: $1.run"

