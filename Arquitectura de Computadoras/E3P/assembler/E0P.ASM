.model small
org 100h
.data
    ; Mensajes a mostrar
    mensaje db "Elige una opcion... $"
    op1 db "1. Factorial de un Numero$"
    op2 db "2. Serie de Fibonacci$"
    op3 db "3. Salir$"
    error db "Opcion invalida$"

    fac1 DB 10,13,'Ingresa un numero: $'
    fac2 DB 10,13,'El factorial es: $'
    newline DB '$' 
.code
print MACRO msg
    PUSH AX
    PUSH DX
    MOV AH,09H
    MOV DX,offset msg
    INT 21H
    POP DX
    POP AX
ENDM

mov bx, 0

menu:
    call opciones
    call ciclo
    call mostrar
    jmp menu
ret


; Ciclar el menú
ciclo proc near
    call mostrar
    mov ah,01
    int 21h
    cmp al,31h
    je call opcion1
    cmp al,32h
    je call opcion2
    cmp al,33h
    je call opcion3
    jne label error
    ret
ciclo endp

; Muestra las opciones disponibles
opciones proc near
    mov dx, offset mensaje
    mov ah,09
    int 21h

    call mostrar
    mov ah,09
    mov dx, offset op1
    int 21h

    call mostrar
    mov ah,09
    mov dx, offset op2
    int 21h

    call mostrar
    mov ah,09
    mov dx, offset op3
    int 21h
    ret
opciones endp

; Salta un renglón en pantalla
mostrar proc near
    inc bx
    mov ah,02
    mov dh, bl
    mov dl, 0
    int 10h
    ret
mostrar endp

; Respuestas
; Opción 1
opcion1 proc near
    call mostrar
    mov ah,09
    ;mov dx, offset msg1
    call calcularFactorial
    int 21h
    ret
opcion1 endp

; Opción 2
opcion2 proc near
    call mostrar
    mov ah,09
    ;mov dx, offset msg2
    int 21h
    ret
opcion2 endp

; Opción 3
opcion3 proc near
    int 20h
opcion3 endp

calcularFactorial proc near
    print newline
    print fac1
    print newline
    CALL readnumtoAX
    mov cx, ax
    mov ax, 01
ack1:
    mul cx
    dec cx
    jz done
    jmp ack1
    print newline
done:
    print fac2
    call displayAX
    .exit
calcularFactorial endp

readnumtoAX PROC NEAR
    PUSH BX
    PUSH CX
    MOV CX,10
    MOV BX,00
back:  MOV AH,01H
    INT 21H
    CMP AL,'0'
    JB skip
    CMP AL,'9'
    JA skip
    SUB AL,'0'
    PUSH AX
    MOV AX,BX
    MUL CX
    MOV BX,AX
    POP AX
    MOV AH,00
    ADD BX,AX
    JMP back
skip:
    MOV AX,BX
    POP CX
    POP BX
    RET
readnumtoAX ENDP

displayAX PROC NEAR
    PUSH DX
    PUSH CX
    PUSH BX
    PUSH AX
    MOV CX,0
    MOV BX,10
back1:  MOV DX,0
    DIV BX
    PUSH DX
    INC CX
    OR AX,AX
    JNZ back1
back2:
    POP DX
    ADD DL,30H
    MOV AH,02H
    INT 21H
    LOOP back2
    POP AX
    POP BX
    POP CX
    POP DX
    RET
displayAX ENDP
