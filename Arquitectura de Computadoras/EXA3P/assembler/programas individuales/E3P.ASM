org 100h

mov bx,0

menu:
  call opciones
  call ciclo
  call mostrar
  jmp menu
    
ret

;Mensajes a mostrar
mensaje db "Elige una opcion... $"
op1 db "1. Factorial de un Numero$"
op2 db "2. Serie de Fibonacci$"
op3 db "3. Salir$"

msg1 db "Calculo de Factorial$"
msg2 db "Calculo de Fibonacci$"
error db "Opcion invalida$"

;Ciclar el menu
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

;Muestra las opciones disponibles
opciones proc near

mov dx,offset mensaje
mov ah,09
int 21h

call mostrar
mov ah,09
mov dx,offset op1
int 21h

call mostrar
mov ah,09
mov dx,offset op2
int 21h

call mostrar
mov ah,09
mov dx,offset op3
int 21h

ret
opciones endp

;salta un renglon en pantalla
mostrar proc near
inc bx
mov ah,02
mov dh,bl
mov dl,0
int 10h
ret
mostrar endp

;Respuestas
;opcion 1
opcion1 proc near
call mostrar
mov ah,09
mov dx,offset msg1
int 21h
ret
opcion1 endp

;opcion 2
opcion2 proc near
call mostrar
mov ah,09
mov dx,offset msg2
int 21h
ret
opcion2 endp

;opcion 4
opcion3 proc near
int 20h
opcion3 endp

