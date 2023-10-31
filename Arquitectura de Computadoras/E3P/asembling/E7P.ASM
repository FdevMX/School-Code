.model small
.stack 64
.data
	msgEntrada db 0dh,0ah,'Ingresa un numero de un digito: $'
	void db 0dh, 0ah, '$'
	msgF db 0dh, 0ah, 'Serie de fibonacci:$'
	msgUno db 0dh, 0ah, '1$'
	dato db 0;
	fb1 db 0;
	fb2 db 1;
	fibo db 0;
	aux db 0
.code
	inicio proc
		mov ax,@data
		mov ds, ax
		
		mov cl, 0
		
		mov dx,offset msgEntrada
		mov ah,09h ;para imprimir cadenas;
		int 21h
		
		mov ah,01h      ;solicito un caracter
		int 21h
		sub al,30h      ; realizo el ajuste
		
		mov dx,offset msgF
		mov ah,09h ;para imprimir cadenas;
		int 21h
		
		mov dx,offset msgUno
		mov ah,09h ;para imprimir cadenas;
		int 21h
				
		mov dx,offset void
		mov ah,09h ;para imprimir cadenas;
		int 21h
    
		mov dato,al      
			
		ciclo:
			
			mov al, fb1
			mov bl, fb2
			
			add al,bl
			add fibo, al
			
			call imprime
			
			mov al, fb2
			mov bl, fibo
			
			mov fb1, al
			mov fb2, bl
			
			mov fibo,0
			
			mov dx,offset void
			mov ah,09h ;para imprimir cadenas;
			int 21h
		
			inc cl
			cmp cl, dato
		jb ciclo
		
		mov ax, 4c00h
		int 21h
	inicio endp
	
	imprime proc
		mov al, fibo
		aam
		mov bx, ax
			
		cmp bh, 0 ;Compara bh con 0
		je imprimeNumero ;Si son iguales salta a imprimeNumero, si no tiene 0 pasa de largo e imprime bh
					
			mov dl, bh
			add dl, 30h
			mov ah, 02h
			int 21h
					
		imprimeNumero: ;Utilizado si en alguna operacion resulta 09, o un 0 seguido de un nuemro solo imprime el numero
			mov dl, bl
			add dl, 30h
			mov ah, 02h
			int 21h
		ret
	imprime endp
	
end inicio