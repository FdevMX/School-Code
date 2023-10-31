.model small
.stack 100h

.data
    msg db 'Ingresa un numero: $'
    res db 'El factorial es: $'
    num dw ?
    fact dw 1

.code
main proc
    mov ax, @data
    mov ds, ax

    ; mensaje en pantalla para ingresar un número
    mov ah, 9
    lea dx, msg
    int 21h

    ; leer el número desde el teclado
    mov ah, 1
    int 21h
    sub al, 30h ; convertir decimal a ASCII
    mov num, ax

    ; calcular factorial
    mov cx, num
    mov bx, num
    dec bx
    loop1:
        mul bx
        loop cx, loop1
    mov fact, ax

    ; mostrar resultado
    mov ah, 9
    lea dx, res
    int 21h
    mov ax, fact
    add ax, 30h ; convertir decimales a ASCII
    mov dl, al
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main