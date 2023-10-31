.model small
.stack 100h

.data
    msg1 db 'Ingresa un numero: $'
    msg2 db 'Su serie de Fibonacci es: $'
    num db 0
    fib1 db 0
    fib2 db 1
    fib3 db ?

.code
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje para ingresar un número
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Lee el numero ingresado por el usuario
    mov ah, 1
    int 21h
    sub al, 30h
    mov num, al

    ; Calcula la serie Fibonacci
    mov bl, num
    mov cl, 2
    mov ch, 0
    mov fib3, 0
    mov ah, 2
    lea dx, msg2
    int 21h
    mov dl, fib1
    int 21h
    mov dl, fib2
    int 21h
    add fib1, fib2
    mov fib3, fib1
    mov fib1, fib2
    mov fib2, fib3
    inc cl
    cmp cl, bl
    jle loop1

    mov ah, 4ch
    int 21h

loop1:
    mov dl, fib3
    int 21h
    add fib1, fib2
    mov fib3, fib1
    mov fib1, fib2
    mov fib2, fib3
    inc cl
    cmp cl, bl
    jle loop1

    mov ah, 4ch
    int 21h

end