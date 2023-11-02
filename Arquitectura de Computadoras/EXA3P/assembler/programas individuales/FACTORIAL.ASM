;CODIGO ENSAMBLADOR PARA CALCULAR EL FACTORIAL DE UN NUMERO

.model small
.stack 200H
.data
 fmsg1 DB 10,13,'Ingresa un numero: $'
 fmsg2 DB 10,13,'El factorial es: $'
 newline DB '$' 
.code
print MACRO msg                ;Definir macros
        PUSH AX
        PUSH DX
        MOV AH,09H
        MOV DX,offset msg
        INT 21H
        POP DX
        POP AX
ENDM
.startup
       print fmsg1
       print newline
       CALL readnumtoAX
       mov cx,ax
       mov ax,01
ack1:    mul cx
    dec cx
    jz done
    jmp ack1
    print newline
done:
    print fmsg2
     call displayAX
    .exit
 readnumtoAX PROC NEAR        ;Procedimiento de definición. para leer char a ax reg.
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
displayAX PROC NEAR    ;Procedimiento de definición. para mostrar char en ax reg.
     PUSH DX
     PUSH CX
     PUSH BX
     PUSH AX
        MOV CX,0
        MOV BX,10
back1:        MOV DX,0
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

END
