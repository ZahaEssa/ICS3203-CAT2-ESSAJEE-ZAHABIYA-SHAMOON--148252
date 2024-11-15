section .data
    arr db 1, 4, 3, 2, 6, 5   ; Original array (6 elements)
    n equ 6                    ; Length of the array

    prompt db "Reversed array: ", 0   ; Output message
    newline db 0xA, 0              ; Newline character for formatting

section .bss
    temp resb 6                   ; Temporary array to store reversed elements (6 bytes)

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4                  ; syscall for sys_write
    mov ebx, 1                  ; file descriptor 1 (stdout)
    mov ecx, prompt             ; address of the prompt message
    mov edx, 17                 ; length of the prompt message
    int 0x80                    ; invoke syscall

    ; Reverse the array using a temporary array
    mov esi, arr                ; esi points to the start of the original array
    mov edi, temp               ; edi points to the start of the temporary array
    mov ecx, n                  ; counter for the loop (n = 6)
    dec ecx                     ; counter = n-1, we use zero-based indexing

reverse_copy:
    mov al, [esi + ecx]         ; Load element from arr[n-i-1]
    mov [edi + ecx], al         ; Store it in temp[i]
    loop reverse_copy           ; Decrement ECX and repeat loop

    ; Copy the reversed array back to the original array
    mov esi, temp               ; esi points to the start of the temporary array
    mov edi, arr                ; edi points to the start of the original array
    mov ecx, n                  ; counter for the loop (n = 6)

copy_back:
    mov al, [esi]               ; Load element from temp[i]
    mov [edi], al               ; Store it in arr[i]
    inc esi                     ; Move to the next byte in temp
    inc edi                     ; Move to the next byte in arr
    loop copy_back              ; Decrement ECX and repeat loop

    ; Output the reversed array
    mov eax, 4                  ; syscall for sys_write
    mov ebx, 1                  ; file descriptor 1 (stdout)
    mov ecx, arr                ; address of the reversed array
    mov edx, 6                  ; number of bytes to print (6 bytes)
    int 0x80                    ; invoke syscall

    ; Print newline
    mov eax, 4                  ; syscall for sys_write
    mov ebx, 1                  ; file descriptor 1 (stdout)
    mov ecx, newline            ; address of newline character
    mov edx, 1                  ; length of newline (1 byte)
    int 0x80                    ; invoke syscall

    ; Exit the program
    mov eax, 1                  ; syscall for sys_exit
    xor ebx, ebx                ; exit code 0
    int 0x80                    ; invoke syscall

