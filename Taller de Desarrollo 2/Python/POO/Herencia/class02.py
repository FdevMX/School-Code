# Taller de Desarrollo 2
# Sesion: 08 de Septiembre del 2023
# Introduccion a POO con Clases
# Archivo "class02.py"
# Identificador: Realizar un programa que conste de una clase llamada Alumno que tenga como atributos el nombre y la nota del alumno. Definir los métodos para inicializar sus atributos, imprimirlos y mostrar un mensaje con el resultado de la palab nota y si ha aprobado o no.
# Alfredo Lopez Mendez


class Alumno:
    def __init__(self, nombre, calificacion):
        self.nombre = nombre;
        self.calificacion = calificacion;
        
    def imprimir(self):
        print("Nombre:", self.nombre);
        print("Calificacion: ", self.calificacion);

    def resultado(self):
        if self.calificacion >= 6:
            print("El alumno " + self.nombre + " aprobo\n");
        else:
            print("El alumno " + self.nombre + " reprobo");
            

alumno = Alumno("Owen", 9)
alumno.imprimir()
alumno.resultado()

alumno = Alumno("Alan", 5)
alumno.imprimir()
alumno.resultado()
