section .data
    sensor_value db 5        ; Simulate a moderate water level (5)
    motor_status db 0        ; 0 = off, 1 = on (motor status)
    alarm_status db 0        ; 0 = no alarm, 1 = alarm triggered
    threshold db 10          ; Water level threshold for alarm (e.g., too high if > 10)
    moderate_threshold db 5  ; Moderate water level threshold (e.g., stop motor if between 5-10)
    motor_on_msg db "Motor is ON", 0xA, 0  ; Add newline (0xA) at the end
    motor_off_msg db "Motor is OFF", 0xA, 0  ; Add newline (0xA) at the end
    alarm_triggered_msg db "ALARM! Water level too high!", 0xA, 0  ; Add newline (0xA) at the end
    alarm_clear_msg db "No alarm. Water level is safe.", 0xA, 0  ; Add newline (0xA) at the end

section .text
    global _start

_start:
    ; Step 1: Read sensor value (simulate reading from a sensor).
    mov al, [sensor_value]        ; Load the sensor value into AL register (simulated input)

    ; Step 2: Compare the sensor value with the threshold to determine actions.
    cmp al, [threshold]           ; Compare sensor value with the threshold (e.g., 10)
    jg high_water_level           ; If the value is greater than the threshold (sensor > 10), go to high water level section.

    ; Step 3: Check if water level is below the moderate threshold (less than 5).
    cmp al, [moderate_threshold]  ; Compare the sensor value with the moderate threshold (e.g., 5)
    jl low_water_level            ; If the value is less than the moderate threshold (sensor < 5), go to low water level section.

    ; Step 4: If the sensor value is between the moderate threshold and the main threshold (5 <= sensor <= 10),
    ; it indicates the water level is moderate, so we stop the motor and ensure no alarm.
    mov byte [motor_status], 0    ; Turn off the motor by setting motor_status to 0
    mov byte [alarm_status], 0    ; Ensure the alarm is off (alarm_status = 0)
    jmp end_program               ; Jump to end of the program (to display the status)

high_water_level:
    ; Step 5: If the sensor value exceeds the threshold (sensor > 10), water level is too high.
    ; We trigger the alarm and stop the motor.
    mov byte [alarm_status], 1    ; Set the alarm status to 1 (trigger alarm)
    mov byte [motor_status], 0    ; Turn off the motor by setting motor_status to 0
    jmp end_program               ; Jump to end of the program (to display the status)

low_water_level:
    ; Step 6: If the sensor value is less than the moderate threshold (sensor < 5),
    ; water level is low, so we turn on the motor and ensure the alarm is off.
    mov byte [motor_status], 1    ; Set the motor status to 1 (turn on motor)
    mov byte [alarm_status], 0    ; Ensure the alarm is off (alarm_status = 0)
    jmp end_program               ; Jump to end of the program (to display the status)

end_program:
    ; Step 7: Display the motor status message.
    mov al, [motor_status]        ; Load the motor status into the AL register
    cmp al, 1                     ; Compare motor_status with 1
    je motor_on                   ; If motor_status is 1, jump to motor_on label to display "Motor is ON"
    mov ecx, motor_off_msg        ; If motor_status is 0, set ecx to the "Motor is OFF" message
    jmp print_message             ; Jump to print_message label to display the motor status message.

motor_on:
    mov ecx, motor_on_msg         ; If motor_status is 1, set ecx to the "Motor is ON" message.

print_message:
    ; Step 8: Display the motor status message using sys_write system call (stdout).
    mov eax, 4                    ; sys_write system call number (4) for writing output
    mov ebx, 1                    ; File descriptor for stdout (1)
    mov edx, 14                   ; Length of the "Motor is ON" or "Motor is OFF" message (including newline)
    int 0x80                      ; Interrupt to invoke system call and print the motor status message.

    ; Step 9: Display the alarm status message.
    mov al, [alarm_status]        ; Load the alarm status into the AL register
    cmp al, 1                     ; Compare alarm_status with 1
    je alarm_triggered            ; If alarm_status is 1, jump to alarm_triggered label to display alarm message.
    mov ecx, alarm_clear_msg      ; If alarm_status is 0, set ecx to the "No alarm" message.
    jmp print_alarm_message       ; Jump to print_alarm_message label to display the alarm status message.

alarm_triggered:
    mov ecx, alarm_triggered_msg  ; If alarm_status is 1, set ecx to the "ALARM!" message.

print_alarm_message:
    ; Step 10: Display the alarm status message using sys_write system call (stdout).
    mov eax, 4                    ; sys_write system call number (4) for writing output
    mov ebx, 1                    ; File descriptor for stdout (1)
    mov edx, 30                   ; Length of the "ALARM!" or "No alarm" message (including newline)
    int 0x80                      ; Interrupt to invoke system call and print the alarm status message.

    ; Step 11: Exit the program.
    mov eax, 1                    ; sys_exit system call number (1) for exiting the program
    xor ebx, ebx                  ; Return code 0 (indicates successful exit)
    int 0x80                      ; Interrupt to invoke system call and exit the program.

