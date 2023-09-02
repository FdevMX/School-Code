# Taller de Desarrollo 2
# Sesion: 01 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "estudiante.py"
# Identificador: 
# Alfredo Lopez Mendez


class Estudiante:

    def __init__(self, nombre, promedio):
        self.nombre = nombre
        self.promedio = promedio

    def establecerNombre(self, nombre):
        self.nombre = nombre

    def obtenerNombre(self):
        return self.nombre

    def establecerPromedio(self, promedio):
        if promedio > 0.0 and promedio <= 100.0:
            self.promedio = promedio
        else:
            self.promedio = 0.0

    def obtener_promedio(self):
        return self.promedio

    def obtenerCalificacionEstudiante(self):
        calificacion_estudiante = ""

        if self.promedio >= 90.0:
            calificacion_estudiante = "A"
        elif self.promedio >= 80.0:
            calificacion_estudiante = "B"
        elif self.promedio >= 70.0:
            calificacion_estudiante = "C"
        elif self.promedio >= 60.0:
            calificacion_estudiante = "D"
        else:
            calificacion_estudiante = "F"

        return calificacion_estudiante


estudiante = Estudiante("Alfredo Lopez", 98.0)

print(estudiante.obtenerCalificacionEstudiante())

estudiante = Estudiante("Leonardo Galvez", 28.0)

print(estudiante.obtenerCalificacionEstudiante())
