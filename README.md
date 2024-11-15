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







# Factorial Calculator in Assembly Language

## Overview
This program calculates the factorial of a number entered by the user. The user is prompted to input a number, and the program calculates its factorial using a loop. The result is displayed in ASCII format, with the program outputting the factorial value followed by a newline.

The program uses Linux system calls for reading input and writing output. The factorial calculation is done through a custom subroutine using assembly instructions and register manipulation.

### Key Features:
- Prompts the user to input a number.
- Calculates the factorial of the number.
- Outputs the result as a string (e.g., "Factorial is: 120").
- Displays the result using system calls.
- Handles edge cases like 0 and 1 (both return a factorial of 1).

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
     nasm -f elf32 -o factorial.o factorial.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o factorial factorial.o
     ```

3. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./factorial
     ```

4. **Example**:
   - When the program asks you to enter a number, if you type `5`, it will output:
     ```
     Factorial is: 120
     ```

### Program Flow

1. **Prompt the User for Input**:
   - The program displays the message "Enter a number: " using a system call (`sys_write`).
   
2. **Input Handling**:
   - The program reads the user’s input using another system call (`sys_read`), storing the input as an ASCII character in a buffer.

3. **Factorial Calculation**:
   - The number is converted from its ASCII representation to an integer (subtracting `'0'`).
   - The program uses a loop to calculate the factorial, starting from the number and multiplying it by each lower integer until reaching 1.

4. **Displaying the Result**:
   - The result is converted to a string by repeatedly dividing the result by 10 and extracting the remainder (the last digit).
   - The string is then displayed using another system call (`sys_write`), followed by a newline character.

5. **Edge Cases**:
   - If the user enters 0 or 1, the program correctly returns 1 as the factorial value.

### Insights and Challenges

#### Insights:
- **Low-level Input/Output**: The use of Linux system calls for reading input and writing output allows direct interaction with the operating system, which gives more control over the program execution.
- **Assembly Loops**: The factorial calculation loop demonstrated how to perform repeated operations and handle conditional checks using assembly instructions like `cmp`, `jmp`, and `dec`.

#### Challenges:
- **Handling ASCII Input**: Converting user input from ASCII characters to integer values required understanding how to manipulate characters in memory.
- **String Conversion**: Converting the factorial result to a string for display was a bit tricky, as it required handling division and storing individual digits in reverse order.
  
### Conclusion
This assembly program demonstrates the use of basic system calls, loops, and conditional statements to calculate and display the factorial of a number. While assembly language can be challenging, it provides a better understanding of how computers perform operations at the hardware level.

