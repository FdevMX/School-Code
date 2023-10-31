;CODIGO ENSAMBLADOR PARA CALCULAR LA SERIE DE FIBONACCI DE UN NUMERO

.model small
.stack 300H
.data
 msg1 DB 10,13,'Ingresa un numero positivo: $'
 msg2 DB 10,13,'La serie de Fibonacci es:  $'
 newline DB 10,13,'$'
 comma   DB ',$'
 prev1 DW 1
 prev2 DW 0
.code
   print MACRO msg                    ;definicion de macro
        PUSH AX
        PUSH DX
        MOV AH,09H
        MOV DX,offset msg
        INT 21H
        POP DX
        POP AX
        ENDM
.startup
       print msg1
       call readnumtoAX
       mov cx,ax                    ;inicia procesos del programa
       mov ax,0                   
       print newline
       print msg2
       call displayAX
       print comma
       dec cx
       jz done
       mov ax,1
       call displayAX
       print comma
       dec cx
       jz done
repeat1:
       mov ax,prev1
       add ax,prev2
       call displayAX
       print comma
       mov bx,prev1
       mov prev2,bx
       mov prev1,ax
       loop repeat1
 done:
.exit
 readnumtoAX PROC NEAR ;GUARDAR NUM Y AX EN EL PROCEDURE DEF
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
displayAX PROC NEAR                       ;PROCEDIMIENTO DE VISUALIZACIÓN DEL CONTENIDO DE AXE
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
back2:  POP DX
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