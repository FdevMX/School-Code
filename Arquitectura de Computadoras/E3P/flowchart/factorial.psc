Algoritmo factorial
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
FinAlgoritmo
