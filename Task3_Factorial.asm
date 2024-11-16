section .data
    prompt db "Enter a number between 1-9: ", 0
    prompt_len equ $ - prompt
    result_msg db "Factorial is: ", 0
    result_len equ $ - result_msg
    newline db 10, 0                              ; Newline character

section .bss
    input resb 2                                  ; Buffer for input (1 digit + newline)
    result_str resb 32                            ; Buffer for result string

section .text
    global _start

_start:
    ; Display prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 2                                    ; Read 2 bytes (number + newline)
    int 0x80

    ; Convert ASCII input to number
    movzx eax, byte [input]                       ; Load first byte
    sub eax, '0'                                  ; Convert ASCII to number

    ; Call factorial subroutine
    call factorial                                ; Result will be in EAX

    ; Save factorial result
    push eax                                      ; Save factorial result

    ; Display result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_len
    int 0x80

    ; Convert result to string and display
    pop eax                                       ; Restore factorial result
    call number_to_string

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

factorial:
    ; Input: eax = number to calculate factorial
    ; Output: eax = factorial result
    ; Preserves: ebx, ecx, edx
    push ebx
    push ecx
    push edx                                      ; Save registers

    mov ebx, eax                                  ; Store original number
    cmp eax, 0                                    ; Check if input is 0
    je factorial_zero
    cmp eax, 1                                    ; Check if input is 1
    je factorial_done                             ; If 1, result is already in eax

factorial_loop:
    dec ebx                                       ; Decrease counter
    cmp ebx, 1                                    ; Check if we reached 1
    jle factorial_done                            ; If <= 1, we're done
    mul ebx                                       ; Multiply eax by ebx
    jmp factorial_loop                            ; Continue loop

factorial_zero:
    mov eax, 1                                    ; Factorial of 0 is 1
    jmp factorial_done

factorial_done:
    pop edx                                       ; Restore registers
    pop ecx
    pop ebx
    ret

number_to_string:
    ; Input: eax = number to convert
    ; Converts number to ASCII and displays it
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov esi, result_str
    add esi, 31                                   ; Point to end of buffer
    mov byte [esi], 0                             ; Null terminate
    mov ebx, 10                                   ; Divisor

convert_loop:
    dec esi                                       ; Move buffer pointer
    xor edx, edx                                  ; Clear edx for div
    div ebx                                       ; Divide by 10
    add dl, '0'                                   ; Convert remainder to ASCII
    mov [esi], dl                                 ; Store digit
    test eax, eax                                 ; Check if more digits
    jnz convert_loop                              ; Continue if more digits

    ; Display the result string
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, result_str
    add edx, 31
    sub edx, esi
    int 0x80

    ; Display newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
; Documentation:

; 1. The program computes the factorial of a number input by the user.
;    - The factorial is calculated by calling a subroutine (function-like code block) to do the math.

; 2. We use the stack to preserve the values of certain registers that are modified in the subroutine.
;    - Before making any changes in the subroutine, we "push" registers (e.g., `eax`, `ebx`) onto the stack.
;    - After the subroutine finishes, we "pop" the registers back from the stack, restoring their original values.
;    - This ensures that the main program continues with the same register values that it had before the subroutine call.

; 3. The `push` and `pop` instructions are used for preserving and restoring register values:
;    - `push eax` stores the value of the `eax` register onto the stack, ensuring that any changes in the subroutine do not affect its value.
;    - `pop eax` restores the original value of the `eax` register from the stack, allowing the main program to continue as expected.
;    - This same process applies to any other registers (such as `ebx`, `ecx`, etc.) that are used in the subroutine, ensuring that all modified registers are safely preserved.

; 4. The subroutine calculates the factorial by using recursion or a loop (depending on the implementation).
;    - The input value is passed to the subroutine, and the result is returned in a general-purpose register (e.g., `eax`).
;    - Since registers like `eax` are used to store intermediate results, we must preserve and restore them to maintain the integrity of the program's flow.

; 5. The use of the stack is crucial in modular programming because it allows different parts of the program (main code and subroutines) to operate independently.
;    - By saving register values on the stack and restoring them afterward, we ensure that subroutines do not interfere with the main program's execution.
;    - This is especially important in **recursive subroutine calls**, where each call needs to operate with its own preserved state.

; 6. In summary:
;    - The program calculates the factorial using a subroutine. Registers like `eax` and `ebx` are pushed and popped to preserve their values.
;    - The stack temporarily holds these register values, ensuring that after the subroutine call, the program continues with the same state as before.
;    - This preservation mechanism allows the program to function correctly even with complex calculations, modularity, and recursion.

