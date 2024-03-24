.model small
.stack 64
.data
	msg db "El resultado de la operacion es: $"
	temp db 0

.code
	inicio proc
		mov ax, @data
		mov ds, ax
		
			;imprimir mensaje
			mov dx, offset msg
			mov ah, 09h
			int 21h
			
			;division
			mov al, 0Ah
			mov temp, al
			xor ax, ax
			mov al, temp
			mov bl, 0002
			div bl
			
			;suma
			mov bl, 0005
			add al, bl
			
			;resta
			mov bl, 0001
			sub al, bl
			
			;multiplicacion
			mov bl, 0005
			mul bl
			
			aam
			mov bh, ah
			mov bl, al
			
			mov dl, bh
			add dl, 30h
			mov ah, 02h
			int 21h
			
			mov dl, bl
			add dl, 30h
			mov ah, 02h
			int 21h
		
		mov ax, 04c00h
		int 21h
	inicio endp
end inicio