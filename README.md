# ICS3203-CAT2-Assembly-<YourName>

## Overview

This repository contains the Assembly language programs for the Control Flow and Conditional Logic task (Task 1). The program demonstrates the use of conditional and unconditional jumps to classify a number as "POSITIVE," "NEGATIVE," or "ZERO" based on user input. The logic is implemented with both conditional jumps (`je`, `jg`, `jl`) and an unconditional jump (`jmp`) to streamline the program flow.

### Task 1: Control Flow and Conditional Logic
- **Purpose**: This program prompts the user to input a number and then classifies the number as either "POSITIVE," "NEGATIVE," or "ZERO." The program demonstrates basic control flow in Assembly, using conditional and unconditional jumps to handle branching logic.
- **Key Instructions**: 
  - `cmp`: Compares the number with zero.
  - `je`, `jg`, `jl`: Conditional jumps used for handling different cases (equal, greater, less than).
  - `jmp`: Unconditional jump used to skip over certain parts of the program after printing the result.

## Compiling and Running the Code

### Prerequisites
Ensure you have the following tools installed:
- **NASM (Netwide Assembler)**: Used to assemble the Assembly code.
- **GCC (GNU Compiler Collection)**: Used to link the object files.
- **Linux-based System**: The code was written for a Linux environment, where syscalls (system calls) are used.

### Steps to Compile and Run

1. **Assemble the Code**:
   First, you need to assemble the Assembly code using NASM. This generates an object file.

   ```bash
   nasm -f elf32 -o Task1_ControlFlow.o Task1_ControlFlow.asm
 ```bash
  ld -m elf_i386 -s -o Task1_ControlFlow Task1_ControlFlow.o

 ```bash
./Task1_ControlFlow

