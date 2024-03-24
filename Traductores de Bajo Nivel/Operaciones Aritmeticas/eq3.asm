.model small
.stack 64
.data
	msg db "El resultado es: $"
	num1 db 0
	num2 db 0
	cen db 0
	dece db 0
	uni db 0
.code
	inicio proc
		mov ax, @data
		mov ds, ax
		
			;imprimir mensaje
			mov dx, offset msg
			mov ah, 09h
			int 21h
			
			;((30 + 10) (3 * 2))/ 2 = 120
			
			;suma
			mov al, 1Eh
			mov bl, 0Ah
			add al, bl
			
			;multiplicacion
			mov num1, al
			mov al, 0003
			mov bl, 0002
			mul bl
			mov num2, al
			
			;multiplicamos num1 por num2
			mov al, num1
			mov bl, num2
			mul bl
			
			;dividimos
			mov bl, 0002
			div bl
			
			aam
			mov uni, al
			mov al, ah
			
			aam
			mov cen, ah
			mov dece, al
			
			mov ah, 02h
			mov dl, cen
			add dl, 30h
			int 21h
			
			mov dl, dece
			add dl, 30h
			int 21h
			
			mov dl, uni
			add dl, 30h
			int 21h

		mov ax, 04c00h
		int 21h
	inicio endp
end inicio
