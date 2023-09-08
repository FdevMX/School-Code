# Taller de Desarrollo 2
# Sesion: 07 de Septiembre del 2023
# Introduccion a POO con Clases
# Archivo "clase01.py"
# Identificador: 
# Alfredo Lopez Mendez


# Definimos una clse padre
class Animal:
    """
    Esta clase define un animal.

    Propiedades:
        especie: El tipo de animal.
        edad: La edad del animal.
    """

    def __init__(self, especie, edad):
        """
        Inicializa un nuevo animal.

        Args:
            especie: El tipo de animal.
            edad: La edad del animal.
        """
        self.especie = especie
        self.edad = edad

    # Metodo generico pero con implementacion particular
    def hablar(self):
        """
        Imprime un sonido que hace el animal.
        """
        # Metodo vacio
        pass

    # Metodo generico pero con implementacion particular
    def moverse(self):
        """
        Imprime cómo se mueve el animal.
        """
        # metodo vacio
        pass

    def describeme(self):
        """
        Imprime una descripción del animal.
        """
        print("Soy un Animal del tipo", type(self).__name__)


# Creamos una clase hija que hereda de la padre
class Perro(Animal):
    """
    Esta clase hereda de la clase Animal.

    Sobrescribe los métodos hablar() y moverse() para imprimir sonidos y movimientos específicos de los perros.
    """

    def hablar(self):
        print("Guau!")

    def moverse(self):
        print("Caminando con 4 patas")


class Vaca(Animal):
    """
    Esta clase hereda de la clase Animal.

    Sobrescribe los métodos hablar() y moverse() para imprimir sonidos y movimientos específicos de las vacas.
    """

    def hablar(self):
        print("Muuu!")

    def moverse(self):
        print("Caminando con 4 patas")


class Abeja(Animal):
    """
    Esta clase hereda de la clase Animal.

    Sobrescribe el método hablar() para imprimir un sonido específico de las abejas. También define un nuevo método picar() que imprime un sonido que hace una abeja al picar.
    """

    def hablar(self):
        print("Bzzzzz!")

    def moverse(self):
        print("Volando")

    def picar(self):
        print("Picar!")


# Creamos instancias de las clases
mi_perro = Perro('mamifero', 10)
mi_vaca = Vaca('mamifero', 23)
mi_abeja = Abeja('insecto', 1)

# Llamamos a los métodos
mi_perro.describeme()
mi_vaca.describeme()
mi_abeja.describeme()

mi_perro.hablar()
mi_abeja.hablar()

mi_abeja.picar()

# Imprimimos las clases padre e hija
print(Perro.__bases__)
print(Animal.__subclasses__())
