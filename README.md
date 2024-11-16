# Task One-Number Classifier Program

## Overview
This program asks the user to enter a number and then classifies it as either **POSITIVE**, **NEGATIVE**, or **ZERO**. It uses assembly language to handle the input, process the number, and print out the correct message. The program relies on system calls to interact with the user and makes decisions using jumps like `cmp`, `je`, `jg`, `jl`, and `jmp`.

### Key Features:
- Prompts the user to input a number.
- Classifies the number as **POSITIVE**, **NEGATIVE**, or **ZERO**.
- Uses conditional and unconditional jumps to decide the output.
- Uses system calls to read input and print messages.

## Instructions

### How to Compile and Run

1. **Assemble and Link the Code**:
   - First, assemble the program with NASM:
     ```bash
     nasm -f elf32 -o Task1_ControlFlow.o Task1_ControlFlowr.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o Task1_ControlFlow Task1_ControlFlow.o
     ```

2. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./Task1_ControlFlow
     ```

## Insights and Challenges

### Insights:
- **Control Flow:** The program makes decisions using conditional jumps (like `je`, `jg`, and `jl`) to check if the number is positive, negative, or zero. This helped me understand how decisions are made in low-level programming.
  
- **System Calls:** Using system calls like `sys_write` (for output) and `sys_read` (for input) is pretty interesting since it's a low-level way to interact with the computer’s operating system.

### Challenges:
- **Converting Input:** Converting the input from ASCII to an integer required subtracting `'0'` from the input character, which was a bit tricky but made sense once I understood it.
  
- **Flow Control:** Managing the program flow using jumps can get confusing. It took a bit of trial and error to make sure the program exits correctly after printing the right message.

- **Error Handling:** This version doesn’t handle errors like invalid input (e.g., if the user types letters instead of numbers). In a more complex version, I would add that.

# Task Two-Reverse Array Program 

## Overview
This program reads five digits (0-9) from the user, stores them in an array, and then reverses the array in place. If the user enters an invalid input (anything other than a digit from 0 to 9), the program will prompt the user to enter a valid digit. The program utilizes Linux system calls to handle input/output.

### Key Features:
- Prompts the user to enter a single digit (0-9).
- Validates the input to ensure it is a digit.
- Stores valid digits in an array.
- Reverses the array in place using two pointers (left and right indices).
- Displays the reversed array to the user.

## Instructions

### How to Compile and Run

1. **Assemble and Link the Code**:
   - First, assemble the program with NASM:
     ```bash
     nasm -f elf64 -o Task2_Arrays.o Task2_Arrays.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o Task2_Arrays Task2_Arrays.o
     ```

2. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./Task2_Arrays
     ```

### Insights and Challenges

#### Insights:
- **Memory Management**: This program demonstrates how assembly can be used to manage memory manually. The array is created in the `.bss` section, and input is handled in a buffer.
- **User Input Validation**: The program includes input validation to ensure that only digits are stored in the array, which helps avoid errors during processing.
- **Array Reversal Logic**: The reversal of the array is done in place using two indices (left and right) and manual memory access, which is a key concept in understanding array manipulation in assembly language.

#### Challenges:
- **Handling Input Errors**: Validating user input and managing the input buffer correctly can be tricky, especially when dealing with raw memory.
- **Memory Boundaries**: The program has to be careful when accessing the array to avoid memory overflows or accessing out-of-bounds memory locations.


# Task Three-Factorial Calculator 

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

1. **Assemble and Link the Code**:
   - First, assemble the program with NASM:
     ```bash
     nasm -f elf32 -o Task3_Factorial.o Task3_Factorial.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o Task3_Factorial Task3_Factorial.o
     ```

2. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./Task3_Factorial
     ```

### Insights and Challenges

#### Insights:
- **Low-level Input/Output**: The use of Linux system calls for reading input and writing output allows direct interaction with the operating system, which gives more control over the program execution.
- **Assembly Loops**: The factorial calculation loop demonstrated how to perform repeated operations and handle conditional checks using assembly instructions like `cmp`, `jmp`, and `dec`.

#### Challenges:
- **Handling ASCII Input**: Converting user input from ASCII characters to integer values required understanding how to manipulate characters in memory.
- **String Conversion**: Converting the factorial result to a string for display was a bit tricky, as it required handling division and storing individual digits in reverse order.
  



# Task Four-Water Level Monitoring System 

## Overview
This program simulates a water level monitoring system that reads a water level sensor value and performs actions such as turning on a motor, triggering an alarm, or stopping the motor based on predefined thresholds. The result is displayed using Linux system calls, and the program outputs status messages for both the motor and the alarm.

The program uses assembly language to simulate hardware-based control logic, utilizing Linux system calls for output.

### Key Features:
- Simulates reading a water level from a sensor.
- Controls a motor based on water level:
  - Turns on the motor if the water level is low.
  - Turns off the motor if the water level is moderate or high.
- Triggers an alarm if the water level exceeds a high threshold.
- Displays messages indicating the motor and alarm statuses.
- Handles water levels below, within, and above safe thresholds.

## Instructions

### How to Compile and Run

1. **Assemble and Link the Code**:
   - First, assemble the program with NASM:
     ```bash
     nasm -f elf32 -o Task4_Control.o Task4_Control.asm
     ```
   - Then, link the object file to create an executable:
     ```bash
     ld -m elf_i386 -o Task4_Control Task4_Control.o
     ```

2. **Run the Program**:
   - Once it's assembled and linked, you can run the program with:
     ```bash
     ./Task4_Control
     ```


### Insights and Challenges

#### Insights:
- **Low-level Control**: This program demonstrates how low-level assembly language can be used to control hardware-like systems (such as motors and alarms) based on sensor input.
- **Using System Calls**: The program utilizes Linux system calls to output information to the terminal, giving insight into how the operating system interacts with assembly code.
- **Conditional Logic**: The program uses `cmp` and conditional jumps (`jg`, `jl`, `je`) to perform different actions based on the sensor value.

#### Challenges:
- **Sensor Simulation**: Simulating sensor input and triggering different actions based on the value required careful use of memory locations to store and compare values.
- **Output Management**: Converting numeric values to meaningful text messages for display required manual management of memory and registers to ensure the output is correct.



