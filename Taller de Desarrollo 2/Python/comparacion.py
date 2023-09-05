# Taller de Desarrollo 2
# Sesion: 01 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "comparacion.py"
# Identificador: 
# Alfredo Lopez Mendez


def comparacion():
    # Primer número a comparar
    numero1 = float(input("Escriba el primer entero: "))

    # Segundo número a comparar
    numero2 = float(input("Escriba el segundo entero: "))

    # Compara los números
    if numero1 == numero2:
        print(f"{numero1} == {numero2} \nSon iguales")
    elif numero1 != numero2:
        print(f"{numero1} != {numero2} \nNo son iguales")
    elif numero1 < numero2:
        print(f"{numero1} < {numero2} \nEl numero {numero1} es menor que el numero {numero2}")

if __name__ == "__main__":
    comparacion()
