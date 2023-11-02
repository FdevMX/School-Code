###### BUCLU FOR ######
# num = int(input("Ingresa un número: "))
# factorial = 1
# for i in range(1, num + 1):
#     factorial *= i
# print("El factorial es:", factorial)


###### FUNCION RECURSIVA ###### 
def factorial(num):
    if num < 0:
        return "No se puede calcular el factorial de un número negativo"
    elif num == 1 or num == 0:
        return 1
    else:
        return num * factorial(num - 1)

num = int(input("Ingresa un número: "))
print("El factorial es:", factorial(num))

