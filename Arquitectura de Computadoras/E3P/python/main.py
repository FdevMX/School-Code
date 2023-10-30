#MENU GENERAL DE LAS DOS OPERACIONES
def factorial(num):
    if num < 0:
        return "No se puede calcular el factorial de un número negativo"
    elif num == 1 or num == 0:
        return 1
    else:
        return num * factorial(num - 1)

def serie_fibonacci(num):
    if num == 0:
        return [0]
    elif num == 1:
        return [0, 1]
    else:
        fib = [0, 1]
        for i in range(2, num + 1):
            fib.append(fib[i-1] + fib[i-2])
        return fib

print("** Menú **")
print("1. Factorial")
print("2. Serie de Fibonacci")
print("3. Salir")

opcion = input("Elige una opción: ")

while opcion != "3":
    if opcion == "1":
        num = int(input("Ingresa un número: "))
        print("El factorial es:", factorial(num))
    elif opcion == "2":
        num = int(input("Ingresa un número: "))
        print("La serie de Fibonacci es:", serie_fibonacci(num))
    else:
        print("Opción no válida.")

    print("\n** Menú **")
    print("1. Factorial")
    print("2. Serie de Fibonacci")
    print("3. Salir")
    opcion = input("Elige una opción: ")

print("¡Hasta la próxima!")
