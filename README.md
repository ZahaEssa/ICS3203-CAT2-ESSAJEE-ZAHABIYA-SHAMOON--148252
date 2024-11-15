# Number Classifier Program

## Overview
This program asks the user to enter a number and then classifies it as either **POSITIVE**, **NEGATIVE**, or **ZERO**. It uses assembly language to handle the input, process the number, and print out the correct message. The program relies on system calls to interact with the user and makes decisions using jumps like `cmp`, `je`, `jg`, `jl`, and `jmp`.

### Key Features:
- Prompts the user to input a number.
- Classifies the number as **POSITIVE**, **NEGATIVE**, or **ZERO**.
- Uses conditional and unconditional jumps to decide the output.
- Uses system calls to read input and print messages.

## Instructions

### How to Compile and Run

1. **Install NASM (Netwide Assembler)**:
   - You need to have NASM installed to assemble the code. On Linux, you can install it like this:
     ```bash
     sudo apt install nasm
     ```

2. **Assemble and Link the Code**:
   - First, assemble the program with NASM:
     ```bash
     nasm -f elf32 -o number_classifier.o number_classifier.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o number_classifier number_classifier.o
     ```

3. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./number_classifier
     ```

4. **Example**:
   - When the program asks you to enter a number, if you type `5`, it will output:
     ```
     POSITIVE
     ```

## Insights and Challenges

### Insights:
- **Control Flow:** The program makes decisions using conditional jumps (like `je`, `jg`, and `jl`) to check if the number is positive, negative, or zero. This helped me understand how decisions are made in low-level programming.
  
- **System Calls:** Using system calls like `sys_write` (for output) and `sys_read` (for input) is pretty interesting since it's a low-level way to interact with the computer’s operating system.

### Challenges:
- **Converting Input:** Converting the input from ASCII to an integer required subtracting `'0'` from the input character, which was a bit tricky but made sense once I understood it.
  
- **Flow Control:** Managing the program flow using jumps can get confusing. It took a bit of trial and error to make sure the program exits correctly after printing the right message.

- **Error Handling:** This version doesn’t handle errors like invalid input (e.g., if the user types letters instead of numbers). In a more complex version, I would add that.

## Conclusion
This program is a basic example of how to classify numbers using assembly language. Even though assembly is tough at first, it gave me a deeper understanding of how computers process instructions and interact with the operating system. The program is simple but shows the power of control flow and system calls in assembly.
