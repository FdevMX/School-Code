;MACROS QUE SE IMPORTARAN EN EL ARCHIVO PRINCIPAL PROGRAMA6.ASM

print MACRO msg
    PUSH AX                 ; Guarda el valor del registro AX en la pila
    PUSH DX                 ; Guarda el valor del registro DX en la pila
    MOV AH,09H              ; Configura AH con la función de servicio para mostrar un mensaje
    MOV DX,offset msg       ; Carga DX con la dirección del mensaje a mostrar
    INT 21H                 ; Llama a la interrupción 21H para mostrar el mensaje
    POP DX                  ; Restaura el valor original del registro DX desde la pila
    POP AX                  ; Restaura el valor original del registro AX desde la pila
ENDM                        ; Fin del macro "print"
