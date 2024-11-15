section .data
    sensor_value db 75         ; Simulating the water level sensor value (value between 0 and 100)
    motor_status db 0          ; Motor status (0 = OFF, 1 = ON)
    alarm_status db 0          ; Alarm status (0 = OFF, 1 = ON)

section .text
    global _start

_start:
    ; Read the sensor value (simulated by the 'sensor_value' byte)
    mov al, [sensor_value]    ; Load the sensor value into register AL

    ; Check if the water level is too high (e.g., greater than 90)
    cmp al, 90                 ; Compare the sensor value with 90
    jg high_water_level        ; If greater, jump to high water level action

    ; Check if the water level is too low (e.g., less than 30)
    cmp al, 30                 ; Compare the sensor value with 30
    jl low_water_level         ; If less, jump to low water level action

    ; Water level is moderate (between 30 and 90)
    ; Stop the motor if it's running (Motor is OFF by default)
    mov byte [motor_status], 0 ; Set motor status to OFF
    jmp end_program            ; Jump to end of program

high_water_level:
    ; Water level is high (greater than 90)
    ; Trigger the alarm
    mov byte [alarm_status], 1 ; Set alarm status to ON
    jmp end_program            ; Jump to end of program

low_water_level:
    ; Water level is low (less than 30)
    ; Turn the motor ON
    mov byte [motor_status], 1 ; Set motor status to ON

end_program:
    ; End of program (could include a loop or halt here)
    nop                        ; No operation (infinite loop can be placed here if desired)

