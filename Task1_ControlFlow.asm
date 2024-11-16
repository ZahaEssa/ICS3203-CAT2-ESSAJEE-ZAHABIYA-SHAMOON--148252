section .bss
    user_input resb 10      ; Reserve space for user input (maximum 10 bytes)

section .data
    prompt db "Enter a number: ", 0  ; Prompt message
    pos_msg db "POSITIVE", 0         ; Positive message
    neg_msg db "NEGATIVE", 0         ; Negative message
    zero_msg db "ZERO", 0           ; Zero message

section .text
    global _start

_start:
    ; Prompt the user for input
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, prompt       ; address of the prompt message
    mov edx, 15           ; message length
    int 0x80              ; interrupt to invoke syscall

    ; Read the user input
    mov eax, 3            ; syscall for sys_read
    mov ebx, 0            ; file descriptor 0 (stdin)
    mov ecx, user_input   ; buffer to store the user input
    mov edx, 10           ; max input length
    int 0x80              ; interrupt to invoke syscall

    ; Convert input (ASCII) to integer - assuming single character input for simplicity
    ; We'll assume input is a single byte between 0-9 (simple case)
    movzx eax, byte [user_input]  ; Load the first byte of input into eax (ASCII value)
    sub eax, '0'                ; Convert ASCII to integer (e.g., '5' -> 5)

    ; Compare the number to classify it
    cmp eax, 0            ; Compare the number with 0
    je zero_case          ; Jump to zero_case if equal to 0 (je = jump if equal)
    jg positive_case     ; Jump to positive_case if greater than 0 (jg = jump if greater)
    jl negative_case     ; Jump to negative_case if less than 0 (jl = jump if less)

positive_case:
    ; Print POSITIVE
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, pos_msg      ; message to print
    mov edx, 8            ; message length
    int 0x80              ; interrupt to invoke syscall
    jmp done              ; Unconditional jump to done (skip other checks)

negative_case:
    ; Print NEGATIVE
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, neg_msg      ; message to print
    mov edx, 8            ; message length
    int 0x80              ; interrupt to invoke syscall
    jmp done              ; Unconditional jump to done

zero_case:
    ; Print ZERO
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, zero_msg     ; message to print
    mov edx, 4            ; message length
    int 0x80              ; interrupt to invoke syscall

done:
    ; Exit the program
    mov eax, 1            ; syscall for sys_exit
    xor ebx, ebx          ; exit code 0
    int 0x80              ; interrupt to invoke syscall

; Task 1: Control Flow and Conditional Logic
; This program classifies a number as POSITIVE, NEGATIVE, or ZERO
; based on the user input using both conditional and unconditional jumps.

section .bss
    user_input resb 10      ; Reserve space for user input (maximum 10 bytes)

section .data
    prompt db "Enter a number: ", 0  ; Prompt message
    pos_msg db "POSITIVE", 0         ; Positive message
    neg_msg db "NEGATIVE", 0         ; Negative message
    zero_msg db "ZERO", 0           ; Zero message

section .text
    global _start

_start:
    ; Print the prompt asking the user for input
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, prompt       ; address of the prompt message
    mov edx, 15           ; message length
    int 0x80              ; interrupt to invoke syscall

    ; Read the user input
    mov eax, 3            ; syscall for sys_read
    mov ebx, 0            ; file descriptor 0 (stdin)
    mov ecx, user_input   ; buffer to store the user input
    mov edx, 10           ; max input length
    int 0x80              ; interrupt to invoke syscall

    ; Convert the input from ASCII to integer
    movzx eax, byte [user_input]  ; Load the input byte into eax (ASCII value)
    sub eax, '0'                ; Convert ASCII value to integer (e.g., '5' becomes 5)

    ; Compare the number to classify it
    cmp eax, 0            ; Compare the number with 0
    je zero_case          ; Jump to zero_case if the number is 0 (je = jump if equal)
    jg positive_case     ; Jump to positive_case if the number is greater than 0 (jg = jump if greater)
    jl negative_case     ; Jump to negative_case if the number is less than 0 (jl = jump if less)

positive_case:
    ; Print "POSITIVE"
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, pos_msg      ; message to print
    mov edx, 8            ; message length
    int 0x80              ; interrupt to invoke syscall
    jmp done              ; Jump to done to exit the program (skip other checks)

negative_case:
    ; Print "NEGATIVE"
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, neg_msg      ; message to print
    mov edx, 8            ; message length
    int 0x80              ; interrupt to invoke syscall
    jmp done              ; Jump to done to exit the program

zero_case:
    ; Print "ZERO"
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, zero_msg     ; message to print
    mov edx, 4            ; message length
    int 0x80              ; interrupt to invoke syscall

done:
    ; Exit the program
    mov eax, 1            ; syscall for sys_exit
    xor ebx, ebx          ; exit code 0
    int 0x80              ; interrupt to invoke syscall


; Documentation:
; Documentation:

; 1. The instruction `cmp eax, 0` compares the input number with 0.
;    This is essential because we need to categorize the number as either zero, positive, or negative.
;    The comparison sets the flags in the processor, which are used by subsequent conditional jumps.

; 2. `je zero_case` is a conditional jump that checks if the zero flag is set, 
;    which happens when the number is exactly 0. If the comparison `cmp eax, 0` results in equality, 
;    the program jumps to the `zero_case` label. This is used to print the "ZERO" message, 
;    indicating that the number is neither positive nor negative.
;    Using `je` ensures that if the number is zero, we immediately handle that case and skip checking for positivity or negativity.

; 3. `jg positive_case` is another conditional jump. It checks if the sign flag indicates that the number is greater than 0.
;    If `cmp eax, 0` results in the number being greater than zero, the jump is executed, 
;    and the program moves to the `positive_case` label to print the "POSITIVE" message.
;    The `jg` instruction ensures that we only handle numbers greater than zero here, skipping the other checks for negativity and zero.

; 4. `jl negative_case` checks if the number is less than 0. This occurs if the `cmp eax, 0` instruction 
;    results in a negative value (i.e., the sign flag is set to indicate a negative number).
;    If true, the program jumps to the `negative_case` label to print the "NEGATIVE" message. 
;    This ensures that if the number is negative, we don't go through unnecessary steps of checking positivity or zero.

; 5. After printing the corresponding message in both the `positive_case` and `negative_case` labels,
;    `jmp done` is used to skip over the remaining parts of the program and exit early.
;    This is an unconditional jump that ensures we don't go through redundant checks or print statements 
;    after we have already printed the appropriate message for positive, negative, or zero numbers.
;    Using `jmp` here ensures that the program flow is optimized and exits immediately after printing the message.

; 6. Finally, the program exits with the `sys_exit` system call after all cases have been handled. 
;    This is done in the `done` label, ensuring that regardless of the path taken (zero, positive, or negative), 
;    the program finishes execution properly without continuing to execute any additional code after the decision-making process.

