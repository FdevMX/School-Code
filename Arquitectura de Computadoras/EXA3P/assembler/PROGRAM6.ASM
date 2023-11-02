.model smALl  				; Establece el modelo de memoria en "small" (modelo de memoria pequeño)
org 100h      				; Establece el punto de entrada del programa en 100h
MOV BX, 0     				; Mueve el valor 0 AL registro BX, donde BX inicia con cero

.data
	; mensajes a mostrar
	mensaje db "Elige una opcion... $"     			; Mensaje principal del menú
	op1 db "1. Factorial de un Numero$"    			; Opción 1 del menú
	op2 db "2. Serie de Fibonacci$"        			; Opción 2 del menú
	op3 db "3. Salir$"                     			; Opción 3 del menú
	error db "Opcion invalida$"             			; Mensaje de error si se ingresa una opción no válida
	msgExit db "Saliste del programa$"				; Mensaje de salida para el programa

	facmsg db "FACTORIAL DE UN NUMERO (NUM DE 1-8)$"
	fac1 DB 10,13,'Ingresa un numero: $'   			; Mensaje para ingresar un número al calcular el factorial
	fac2 DB 10,13,'El factorial es: $'     			; Mensaje que muestra el resultado del cálculo del factorial
	newline DB '$'                         			; Carácter de nueva línea

	fibmsg db "SERIE DE FIBONACCI$"
	fib1 DB 10,13,'Ingresa un numero positivo: $'   	; Mensaje para ingresar un número positivo al calcular la serie de Fibonacci
	fib2 DB 10,13,'La serie de Fibonacci es:  $'    	; Mensaje que muestra la serie de Fibonacci calculada
	comma   DB ',$'                    				; Carácter de coma utilizado para separar elementos en la serie de Fibonacci
	DATO1 DW 1                        				; Variable de datos DATO1, inicializada en 1
	DATO2 DW 0                        				; Variable de datos DATO2, inicializada en 0
.code

;Se llama AL macro que se encuentra en otro archivo
INCLUDE MACROSP6.ASM

MENU:
	CALL OPCIONES                 ; Llama a la función que muestra las opciones del menú.
	CALL CICLOMENU                ; Llama a la función que maneja la entrada del usuario.
	CALL SALTOLINEA               ; Llama a la función para dar salto de linea en pantalla.
	JMP MENU                      ; salta de nuevo AL inicio del menú para repetir el ciclo.
RET                                 ; Instrucción de retorno


; Muestra las opciones disponibles
OPCIONES PROC NEAR
	MOV DX, offset mensaje        ; Carga la dirección de la cadena "mensaje" en DX, que es el mensaje principal.
	MOV AH, 09                    ; Establece la función de servicio de interrupción 21h para mostrar una cadena.
	INT 21h                       ; Llama a la interrupción 21h para mostrar el mensaje principal.

	CALL SALTOLINEA               ; Llama a la función "SALTOLINEA" para mostrar una separación en pantalla.
	MOV AH, 09                    ; Establece nuevamente la función de servicio de interrupción 21h para mostrar una cadena.
	MOV DX, offset op1            ; Carga la dirección de la cadena "op1" en DX, que es la opción 1 del menú.
	INT 21h                       ; Llama a la interrupción 21h para mostrar la opción 1 del menú.

	CALL SALTOLINEA               ; Llama a la función "SALTOLINEA" para mostrar una separación en pantalla.
	MOV AH, 09                    ; Establece la función de servicio de interrupción 21h para mostrar una cadena.
	MOV DX, offset op2            ; Carga la dirección de la cadena "op2" en DX, que es la opción 2 del menú.
	INT 21h                       ; Llama a la interrupción 21h para mostrar la opción 2 del menú.

	CALL SALTOLINEA               ; Llama a la función "SALTOLINEA" para mostrar una separación en pantalla.
	MOV AH, 09                    ; Establece la función de servicio de interrupción 21h para mostrar una cadena.
	MOV DX, offset op3            ; Carga la dirección de la cadena "op3" en DX, que es la opción 3 del menú.
	INT 21h                       ; Llama a la interrupción 21h para mostrar la opción 3 del menú.

	RET                           ; Retorna de la función "opciones".
OPCIONES ENDP

; Ciclar el menú
CICLOMENU PROC NEAR
	CALL SALTOLINEA               ; Llama a la función "SALTOLINEA" para mostrar una separación en pantalla.
	MOV AH, 01                    ; Establece la función de servicio de interrupción 21h para leer un carácter desde el teclado.
	INT 21h                       ; Lee un carácter desde el teclado y almacena el resultado en AL.

	CMP AL, 31h                   ; Compara el valor en AL con '1' (el carácter '1').
	JE CALL OPCION1               ; Si AL es igual a '1', salta a la etiqueta "OPCION1".
	CMP AL, 32h                   ; Compara el valor en AL con '2' (el carácter '2').
	JE CALL OPCION2               ; Si AL es igual a '2', salta a la etiqueta "OPCION2".
	CMP AL, 33h                   ; Compara el valor en AL con '3' (el carácter '3').
	JE CALL OPCION3               ; Si AL es igual a '3', salta a la etiqueta "OPCION3".
	jne label error               ; Si AL no coincide con '1', '2' o '3, salta a la etiqueta "error".

	RET                           ; Retorna de la función "CICLOMENU".
CICLOMENU ENDP


; salta un renglón en pantalla
SALTOLINEA PROC NEAR
	INC BX                        ; Incrementa el valor del registro BX en 1.
	MOV AH, 02                    ; Establece la función de servicio de interrupción 21h para escribir un carácter en la pantalla.
	MOV DH, BL                    ; Establece el valor del registro DH AL valor actual del registro BX.
	MOV DL, 0                     ; Establece el valor del registro DL a 0.
	INT 10h                       ; Llama a la interrupción 21h.
	RET                           ; Retorna de la función "SALTOLINEA".
SALTOLINEA ENDP


; Respuestas
; Opción 1
OPCION1 PROC NEAR
	CALL SALTOLINEA               ; Llama a la funcion "SALTOLINEA" para actualizar la posición en la pantalla.
	CALL SALTOLINEA               ; Llama a la funcion "SALTOLINEA" para actualizar la posición en la pantalla.
	MOV AH,09                     ; Establece AH=09h para reALizar una llamada de servicio de DOS a la impresión de una cadena.
	MOV DX,offset facmsg		; Muestra encabezado
	INT 21h
	CALL CALCULARFACTORIAL        ; Llama a la funcion "CALCULARFACTORIAL" para reALizar el cálculo del factorial.
	CALL SALTOLINEA               ; Llama nuevamente a "SALTOLINEA" para avanzar una línea en la pantalla.
	RET                           ; Retorna al punto de llamada.
OPCION1 ENDP                        ; Fin de la funcion "OPCION1".

; Opción 2
OPCION2 PROC NEAR
	CALL SALTOLINEA               ; Llama a la funcion "SALTOLINEA" para actualizar la posición en la pantalla.
	CALL SALTOLINEA               ; Llama a la funcion "SALTOLINEA" para actualizar la posición en la pantalla.
	MOV AH,09                     ; Establece AH=09h para reALizar una llamada de servicio de DOS a la impresión de una cadena.
	MOV DX,offset fibmsg		; Muestra encabezado
	INT 21h
	CALL CALCULARFIBONACCI        ; Llama a la funcion "CALCULARFIBONACCI" para reALizar el cálculo de la serie de Fibonacci.
	CALL SALTOLINEA               ; Llama nuevamente a "SALTOLINEA" para avanzar una línea en la pantalla.
	CALL SALTOLINEA               ; Llama a "SALTOLINEA" tres veces adicionALes para avanzar tres líneas en total.
	CALL SALTOLINEA
	CALL SALTOLINEA
	RET                           ; Retorna al punto de llamada.
OPCION2 ENDP

; Opción 3
OPCION3 PROC NEAR
	CALL SALTOLINEA
	MOV AH,09
	MOV DX,offset msgExit		; Muestra mensaje de salida
	INT 21h                       ; Llama a la interrupción 20h para salir del programa.
	.exit					; Metodo para salir del programa
OPCION3 ENDP


; Procedimiento para cALcular el factorial de un número.
CALCULARFACTORIAL PROC NEAR
	PRINT newline                 ; Imprime una línea en blanco para una mejor presentación.
	PRINT fac1                    ; Imprime el mensaje "Ingresa un número:".
	PRINT newline                 ; Imprime una línea en blanco.
	CALL leerNumeroEnAX     	; Llama a la rutina para leer un número desde el teclado y lo almacena en AX.
	MOV CX, AX           		; Mueve el número ingresado a CX para reALizar el cálculo.
	MOV AX, 01           		; Inicializa AX en 1 para reALizar el cálculo del factorial.
ProcedimientoFac:                   ; Primer bucle
	mul CX              		; Multiplica AX por el valor en CX.
	dec CX              		; Decrementa CX en 1.
	JZ ResultadoFac          	; Si CX es igual a cero (es decir, se ha cALculado el factorial), salta a "ResultadoFac".
	JMP ProcedimientoFac          ; Si no, vuelve a "ProcedimientoFac" para continuar multiplicando.
	PRINT newline        		; Imprime una línea en blanco (esto puede estar fuera de lugar).
ResultadoFac:                 	; Etiqueta para indicar que se ha completado el cálculo.
	PRINT fac2          		; Imprime el mensaje "El factorial es:".
	CALL mostrarAX      		; Llama a la rutina para mostrar el resultado en AX en la pantalla.
	CALL SALTOLINEA        		; Llama a "SALTOLINEA" para avanzar dos líneas en la pantalla.
	CALL SALTOLINEA
	RET                  		; Retorna al punto de llamada.
CALCULARFACTORIAL ENDP   		; Fin del procedimiento "CALCULARFACTORIAL".

; Procedimiento para cALcular la serie de Fibonacci.
CALCULARFIBONACCI PROC NEAR
	PRINT fib1                  	; Imprime "Ingresa un numero positivo:".
	CALL leerNumeroEnAX           ; Llama a la rutina para leer un número y almacena el resultado en AX.
	MOV CX, AX                 	; Mueve el número ingresado a CX para determinar la cantidad de términos de la serie.
	MOV AX, 0                  	; Inicializa AX en 0 para el primer término de la serie.
	PRINT newline              	; Imprime una línea en blanco.
	PRINT fib2                 	; Imprime "La serie de Fibonacci es:".
	CALL mostrarAX             	; Llama a la rutina para mostrar el valor en AX en la pantalla.
	PRINT comma                	; Imprime una coma después del primer término.
	DEC CX                     	; Decrementa CX en 1 para llevar el conteo de términos.
	JZ ResultadoFib               ; Si CX llega a cero, salta a "ResultadoFib" ya que no hay más términos.
	MOV AX, 1                  	; Restablece AX en 1 para el segundo término.
	CALL mostrarAX             	; Llama a la rutina para mostrar el segundo término en la pantalla.
	PRINT comma                	; Imprime una coma después del segundo término.
	; DEC CX                  	; Comentario eliminado para mostrar todos los términos.
	JZ ResultadoFib                 ; Si CX llega a cero, salta a "ResultadoFib".

	; Restablecer los valores iniciales de DATO1 y DATO2.
	MOV DATO1, 1
	MOV DATO2, 0

ProcedimientoFib:
	MOV AX, DATO1               	; Carga DATO1 en AX.
	ADD AX, DATO2               	; Suma DATO1 y DATO2.
	CALL mostrarAX              	; Llama a la rutina para mostrar el resultado en pantalla.
	PRINT comma                 	; Imprime una coma después del término.
	MOV BX, DATO1               	; Guarda DATO1 en BX.
	MOV DATO2, BX               	; Actualiza DATO2 con el valor DATO1 anterior.
	MOV DATO1, AX               	; Actualiza DATO1 con el nuevo resultado.
	LOOP ProcedimientoFib         ; Repite el bucle hasta que se muestren todos los términos.

ResultadoFib:
	CALL SALTOLINEA               ; Llama a la rutina "SALTOLINEA" para avanzar dos líneas en la pantalla.
	CALL SALTOLINEA
	CALL SALTOLINEA
	RET                         	; Retorna al punto de llamada.
CALCULARFIBONACCI ENDP           	; Fin del procedimiento "CALCULARFIBONACCI".


; Leer un número desde la entrada estándar y almacenarlo en AX
leerNumeroEnAX PROC NEAR
	PUSH BX          			; Guardar el valor actual de BX en la pila
	PUSH CX          			; Guardar el valor actual de CX en la pila
	MOV CX, 10      			; Inicializar el registro CX en 10, se usará para la división por 10
	MOV BX, 0        			; Inicializar el registro BX en 0, se usará para almacenar los dígitos

; Inicio del bucle de lectura
iniciarLectura:
	MOV AH, 01H     			; Leer un carácter desde la entrada estándar y almacenarlo en AL
	INT 21H
	CMP AL, '0'
	JB finLectura       		; Comprobar si el carácter leído es menor que '0' (fuera del rango de dígitos)
	CMP AL, '9'
	JA finLectura         		; Comprobar si el carácter leído es mayor que '9' (fuera del rango de dígitos)
	SUB AL, '0'     			; Convertir el carácter en dígito numérico
	PUSH AX     			; Guardar el valor del dígito en la pila
	MOV AX, BX
	MUL CX           			; Multiplicar BX por 10 para hacer espacio para el nuevo dígito
	MOV BX, AX       			; Almacenar el resultado en BX
	POP AX           			; Recuperar el valor del dígito
	MOV AH, 00       			; Limpiar AH
	ADD BX, AX      			; Sumar el dígito a BX
	JMP iniciarLectura

; Fin del bucle de lectura
finLectura:
	MOV AX, BX       			; Mover el número finAL de BX a AX
	POP CX           			; Restaurar el valor original de CX desde la pila
	POP BX           			; Restaurar el valor original de BX desde la pila
	RET              			; Devolver el control al punto de llamada
leerNumeroEnAX ENDP

; Mostrar el contenido de AX en la pantalla
mostrarAX PROC NEAR
	PUSH DX          			; Guardar el valor actuAL de DX en la pila
	PUSH CX          			; Guardar el valor actuAL de CX en la pila
	PUSH BX          			; Guardar el valor actuAL de BX en la pila
	PUSH AX         	 		; Guardar el valor actuAL de AX en la pila
	MOV CX, 0        			; Inicializar CX en 0 para contar el número de dígitos
	MOV BX, 10       			; Inicializar BX en 10 para la división y conversión
iniciarDivision:
	MOV DX, 0        			; Limpiar el registro DX para la división
	DIV BX           			; Dividir AX por 10, el cociente se almacena en AX, el residuo en DX
	PUSH DX          			; Guardar el residuo (un dígito) en la pila
	INC CX           			; Incrementar el contador de dígitos en CX
	OR AX, AX        			; Verificar si el cociente en AX es cero (indicando que no hay más dígitos)
	JNZ iniciarDivision 		; Si el cociente no es cero, repetir la división
mostrarDigitos:
	POP DX           			; Sacar un dígito de la pila y almacenarlo en DX
	ADD DL, 30H      			; Convertir el dígito en un carácter ASCII sumando 30H
	MOV AH, 02H      			; Función 02H del servicio de interrupción 21H (para mostrar un carácter)
	INT 21H          			; Llamar a la interrupción 21H para mostrar el carácter en pantalla
	LOOP mostrarDigitos 		; Repetir hasta que se muestren todos los dígitos
	POP AX           			; Restaurar el valor original de AX desde la pila
	POP BX           			; Restaurar el valor original de BX desde la pila
	POP CX           			; Restaurar el valor original de CX desde la pila
	POP DX           			; Restaurar el valor original de DX desde la pila
	RET              			; Devolver el control al punto de llamada
mostrarAX ENDP
