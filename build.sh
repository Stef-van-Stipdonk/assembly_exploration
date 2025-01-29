#!/bin/bash

nasm -g -f elf64 $1 -o $1.o
ld $1.o -o $1.run

rm *.o

echo "Executable: $1.run"
