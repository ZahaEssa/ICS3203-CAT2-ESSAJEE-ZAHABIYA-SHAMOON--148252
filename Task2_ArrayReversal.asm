section .data
    hello db "Hello, World!", 0xA  ; Define the message with a newline character
    hello_len equ $ - hello         ; Calculate the length of the message

section .text
    global _start

_start:
    ; Write the "Hello, World!" message to stdout
    mov eax, 4                      ; Syscall number for sys_write (Linux)
    mov ebx, 1                      ; File descriptor 1 (stdout)
    mov ecx, hello                  ; Pointer to the message
    mov edx, hello_len              ; Length of the message
    int 0x80                        ; Call the kernel

    ; Exit the program
    mov eax, 1                      ; Syscall number for sys_exit
    xor ebx, ebx                    ; Exit code 0
    int 0x80                        ; Call the kernel

