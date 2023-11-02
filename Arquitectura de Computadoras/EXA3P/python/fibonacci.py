#FACTORIAL
###### FUNCION RECURSIVA ######
num = int(input("Ingresa un número: "))

# Manejo de casos base
if num == 0:
    print("La serie de Fibonacci es: 0")
elif num == 1:
    print("La serie de Fibonacci es: 0, 1")
else:
    # Inicialización de variables
    fib = [0, 1]
    # [0,1,1,2,3,5,8,13,21]

    i = 2

    # Cálculo de la serie de Fibonacci
    while i <= num:
        fib.append(fib[i-1] + fib[i-2])
        print("Paso", i-1, ":", fib[i-2], "+", fib[i-3], "=", fib[i-1], "\n")
        i += 1

    # Impresión de la serie de Fibonacci
    print("Ultimo paso:", fib[i-3], "+", fib[i-2], "=", fib[i-1], "\n")
    print("La serie de Fibonacci es:", fib)