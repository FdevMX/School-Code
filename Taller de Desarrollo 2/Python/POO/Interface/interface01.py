# Taller de Desarrollo 2
# Sesion: 05 de Octubre del 2023
# Introduccion a POO con Interface y AbstractMethod
# Archivo "interface01.py"
# Identificador: Con base al diagrama de clases, crear un programa que calcule el area de un circulo y rectangulo.
# Alfredo Lopez Mendez


from abc import ABC, abstractmethod
from math import pi

# Definir la intefaz forma con un metodo abstracto calcular_area()
class Forma(ABC):
    @abstractmethod
    def calcular_area(self):
        pass

# Implementar la intefaz Forma en la clase circulo
class Circulo(Forma):
    def __init__(self, radio):
        self.radio = radio
    
    def calcular_area(self):
        return pi * self.radio ** 2

# Implementar la interfaz Forma en la clase Rectangulo
class Rectangulo(Forma):
    def __init__(self, ancho, altura):
        self.ancho = ancho
        self.altura = altura
    
    def calcular_area(self):
        return self.ancho * self.altura

# Crear instancias de las clases Circulo y Rectangulo
circulo = Circulo(5)
rectangulo = Rectangulo(4, 6)

# Calcular y mostrar las areas de las formas
print("Area del circulo:", circulo.calcular_area())
print("Area del rectangulo:", rectangulo.calcular_area())