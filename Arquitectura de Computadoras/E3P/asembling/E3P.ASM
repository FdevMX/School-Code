.MODEL SMALL
.STACK 100H
.DATA
MENSAJE1 DB '1. Calcular factorial de un numero',0AH,0DH,'$'
MENSAJE2 DB '2. Serie de Fibonacci',0AH,0DH,'$'
MENSAJE3 DB '3. Salir',0AH,0DH,'$'
MENSAJE4 DB 'Ingrese la opcion: $'
NUMERO DB ?
RESDB 10 DUP(?)
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

MENU:
    ; Mostrar el menú
    CALL MOSTRARMENU
    ; Leer la opción del usuario
    CALL LEER

    CMP AL,'1'
    JE CALCULAR_FACTORIAL
    CMP AL,'2'
    JE CALCULAR_FIBONACCI
    CMP AL,'3'
    JE SALIR

    JMP MENU

CALCULAR_FACTORIAL:
    ; Solicitar un número para calcular el factorial
    MOV AH, 09H
    LEA DX, MENSAJE4
    INT 21H
    ; Leer el número
    CALL LEER
    ; Llamar a la macro para calcular el factorial
    CALL CALCULAR_FACTORIAL
    ; Mostrar el resultado
    MOV AH, 02H
    LEA DX, RESDB
    INT 21H
    JMP MENU

CALCULAR_FIBONACCI:
    ; Solicitar el término de la serie de Fibonacci
    MOV AH, 09H
    LEA DX, MENSAJE4
    INT 21H
    ; Leer el término
    CALL LEER
    ; Llamar a la macro para calcular Fibonacci
    CALL CALCULAR_FIBONACCI
    ; Mostrar el resultado
    MOV AH, 02H
    LEA DX, RESDB
    INT 21H
    JMP MENU

SALIR:
    MOV AH, 4CH
    INT 21H

MAIN ENDP

; Macro para mostrar el menú
MOSTRARMENU PROC
    MOV AH, 09H
    LEA DX, MENSAJE1
    INT 21H
    MOV AH, 09H
    LEA DX, MENSAJE2
    INT 21H
    MOV AH, 09H
    LEA DX, MENSAJE3
    INT 21H
    RET
MOSTRARMENU ENDP

; Macro para leer un dígito
LEER PROC
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    RET
LEER ENDP

; Macro para calcular el factorial
CALCULAR_FACTORIAL MACRO
    ; Código para calcular el factorial
    MOV CX, NUMERO
    MOV AX, 1

    FACTORIAL_LOOP:
        MUL CX
        LOOP FACTORIAL_LOOP

    ; Guardar el resultado en RESDB
    MOV DI, OFFSET RESDB
    MOV BX, 10

    STORE_RESULT:
        XOR DX, DX
        DIV BX
        ADD DL, '0'
        DEC DI
        MOV [DI], DL
        CMP AX, 0
        JNZ STORE_RESULT

    ENDM

; Macro para calcular Fibonacci
CALCULAR_FIBONACCI MACRO
    ; Código para calcular Fibonacci
    MOV CX, NUMERO
    MOV AX, 0
    MOV BX, 1

    FIBONACCI_LOOP:
        ADD AX, BX
        MOV DX, AX
        MOV AX, BX
        MOV BX, DX
        LOOP FIBONACCI_LOOP

    ; Guardar el resultado en RESDB
    MOV DI, OFFSET RESDB
    MOV BX, 10

    STORE_RESULT:
        XOR DX, DX
        DIV BX
        ADD DL, '0'
        DEC DI
        MOV [DI], DL
        CMP AX, 0
        JNZ STORE_RESULT

    ENDM

END MAIN
