.model small
.stack 64
.data
	msg db "El resultado de la operacion es: $"
	temp db 0
; 2 * 3 + (2 + 4) / 2 = 9

;2 = 0002
;3 = 0003
;4 = 0004
.code
	inicio proc
		mov ax, @data
		mov ds, ax
		
			;imprimir mensaje
			mov dx, offset msg
			mov ah, 09h
			int 21h
			
			;suma
			mov al, 0002
			mov bl, 0004
			add al, bl
			
			;division
			mov temp, al
			xor ax, ax
			mov al, temp
			mov bl, 0002
			div bl
			
			;multilplicacion
			mov temp, al
			xor ax, ax
			mov al, 0002
			mov bl, 0003
			mul bl
			
			;sumar
			mov bl, temp
			add al, bl
			
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