	section .data
    menu_prompt db 'User Menu:', 0
    singleplayer_option db '1. Singleplayer', 0
    multiplayer_option db '2. Multiplayer', 0
    options_option db '3. Options', 0
    exit_option db '4. Exit', 0
    invalid_option db 'Invalid option. Please try again.', 0
    newline db 10, 0
 
section .text
    global _start
_start:
    ; Display the user menu
    mov eax, 4
    mov ebx, 1
    mov ecx, menu_prompt
    mov edx, 11
    int 0x80
 
    ; Display the singleplayer option
    mov eax, 4
    mov ebx, 1
    mov ecx, singleplayer_option
    mov edx, 15
    int 0x80
 
    ; Display the multiplayer option
    mov eax, 4
    mov ebx, 1
    mov ecx, multiplayer_option
    mov edx, 14
    int 0x80
 
    ; Display the options option
    mov eax, 4
    mov ebx, 1
    mov ecx, options_option
    mov edx, 11
    int 0x80
 
    ; Display the exit option
    mov eax, 4
    mov ebx, 1
    mov ecx, exit_option
    mov edx, 8
    int 0x80
 
    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 2
    int 0x80
 
    ; Check the user input and perform the corresponding action
    cmp byte [input_buffer], '1'
    je singleplayer
    cmp byte [input_buffer], '2'
    je multiplayer
    cmp byte [input_buffer], '3'
    je options
    cmp byte [input_buffer], '4'
    je exit
    jmp invalid_option
singleplayer:
    ; Singleplayer logic goes here
    jmp end
multiplayer:
    ; Multiplayer logic goes here
    jmp end
options:
    ; Options logic goes here
    jmp end
exit:
    ; Exit logic goes here
    jmp end
invalid_option:
    ; Display invalid option message
    mov eax, 4
    mov ebx, 1
    mov ecx, invalid_option
    mov edx, 28
    int 0x80
    jmp _start
end:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
 
section .bss
    input_buffer resb 2