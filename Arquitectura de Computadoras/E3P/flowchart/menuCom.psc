Algoritmo assembler
	Escribir '                          LENGUAJE ENSAMBLADOR                          '
	Escribir '                 Elija la operacion que desea realizar:                  '
	Escribir '1). Factorial'
	Escribir '2). Fibonacci'
	Escribir '3). Salir'
	Escribir ''
	Escribir 'Elige un inciso:'
	Leer menu
	Si (menu=1) Entonces
		Definir num, var Como Entero
		Escribir 'Escribe un numero'
		Leer num
		data <- num
		var <- 1
		Si num>=0 Entonces
			Mientras num>1 Hacer
				var <- var*num
				num <- num-1
			FinMientras
			Escribir 'El factorial de ', data, ' es igual a ', var
		SiNo
			Escribir 'No se permiten valores negativos'
		FinSi
	SiNo
		Si (menu=2) Entonces
			Escribir 'Ingresa un numero'
			Leer num
			a <- 0
			b <- 1
			Para i<-1 Hasta num+1 Hacer
				Escribir a
				c <- a+b
				a <- b
				b <- c
			FinPara
		SiNo
			Si (menu=3) Entonces
				Limpiar Pantalla
				Escribir 'Presione enter para salir'
				Esperar Tecla
			FinSi
		FinSi
	FinSi
FinAlgoritmo
