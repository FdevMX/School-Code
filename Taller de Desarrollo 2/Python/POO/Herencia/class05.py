# Taller de Desarrollo 2
# Sesion: 08 de Septiembre del 2023
# Introduccion a POO con Clases
# Archivo "class05.py"
# Identificador: Realizar un programa en el cual se declaren dos valores enteros por teclado utilizando el método _init_. Calcular después la suma, resta, multiplicación y división. Utilizar un método para cada una e imprimir los resultados obtenidos. Llamar a la clase Calculadora.
# Alfredo Lopez Mendez


class Calculadora:

    def __init__(self):
        self.valor1 = float(input("Introduce el primer valor: "))
        self.valor2 = float(input("Introduce el segundo valor: "))
        
        print("La suma de los valores es: ", self.suma())
        print("La resta de los valores es: ", self.resta())
        print("La multiplicación de los valores es: ", self.multiplicacion())
        print("La división de los valores es: ", self.division())

    def suma(self):
        return self.valor1 + self.valor2

    def resta(self):
        return self.valor1 - self.valor2

    def multiplicacion(self):
        return self.valor1 * self.valor2

    def division(self):
        if self.valor2 != 0:
            return self.valor1 / self.valor2
        else:
            return "Error: División entre cero no está definida"

# Creamos un objeto de la clase Calculadora
calc = Calculadora()
