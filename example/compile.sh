#!/bin/bash

# Compile to object file (.o)
riscv-none-elf-gcc -c Program.s -march=rv32i

# Convert object file to binary.
riscv-none-elf-objcopy -O binary Program.o Program.bin

# Convert binary to readable 32bit width hexadecimal numbers
od -t x4 Program.bin > Program.hex