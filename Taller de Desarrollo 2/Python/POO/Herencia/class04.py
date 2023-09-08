# Taller de Desarrollo 2
# Sesion: 08 de Septiembre del 2023
# Introduccion a POO con Clases
# Archivo "class04.py"
# Identificador: Desarrollar un programa que cargue los datos de un triángulo. Implementar una clase con los métodos para inicializar los atributos, imprimir el valor del lado con un tamaño mayor y el tipo de triángulo que es (equilátero, isosceles o escaleno).
# Alfredo Lopez Mendez

class Triangulo:
    def __init__(self, lado1, lado2, lado3):
        self.lado1 = lado1
        self.lado2 = lado2
        self.lado3 = lado3

    def tipoTriangulo(self):
        lados = [self.lado1, self.lado2, self.lado3]
        ladoMayor = print("El lado mas largo del triangulo es: ", max(lados))

        if lados[0] == lados[1] == lados[2]:
            print("El triangulo es Equilátero\n")
        elif lados[0] == lados[1] or lados[0] == lados[2] or lados[1] == lados[2]:
            print("El triangulo es Isósceles\n")
        else:
            print("El triangulo es Escaleno\n")

triangulo = Triangulo(4, 4, 4);
triangulo.tipoTriangulo();

triangulo = Triangulo(6, 10, 10);
triangulo.tipoTriangulo();

triangulo = Triangulo(2, 7, 9);
triangulo.tipoTriangulo();


# ALTERNATIVE

# class Triangulo:
#     def __init__(self, lado1, lado2, lado3):
#         self.lado1 = lado1
#         self.lado2 = lado2
#         self.lado3 = lado3
        
    # def ladoMayor(self):
    #     print("El lado mas largo es: ", max(self.lado1, self.lado2, self.lado3))
        
    # def tipoTriangulo(self):
    #     if self.lado1 == self.lado2 == self.lado3:
    #         print("El triangulo es Equilátero\n")
    #     elif self.lado1 == self.lado2 or self.lado1 == self.lado3 or self.lado2 == self.lado3:
    #         print("El triangulo es Isósceles\n")
    #     else:
    #         print("El triangulo es Escaleno\n")
    
    
# triangulo = Triangulo(4, 4, 4);
# triangulo.ladoMayor();
# triangulo.tipoTriangulo();

# triangulo = Triangulo(6, 10, 10);
# triangulo.ladoMayor();
# triangulo.tipoTriangulo();

# triangulo = Triangulo(2, 7, 9);
# triangulo.ladoMayor();
# triangulo.tipoTriangulo();
