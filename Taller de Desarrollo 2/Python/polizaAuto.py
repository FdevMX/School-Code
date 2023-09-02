# Taller de Desarrollo 2
# Sesion: 01 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "polizaAuto.py"
# Identificador: 
# Alfredo Lopez Mendez


class PolizaAuto:

    def __init__(self, numeroCuenta, marcaYmodelo, estado):
        self.numeroCuenta = numeroCuenta
        self.marcaYmodelo = marcaYmodelo
        self.estado = estado

    def establecerNumeroCuenta(self, numeroCuenta):
        self.numeroCuenta = numeroCuenta

    def obtenerNumeroCuenta(self):
        return self.numeroCuenta

    def establecerMarcaYmodelo(self, marcaYmodelo):
        self.marcaYmodelo = marcaYmodelo

    def obtenerMarcaYmodelo(self):
        return self.marcaYmodelo

    def establecerEstado(self, estado):
        self.estado = estado

    def obtenerEstado(self):
        return self.estado

    def estadoSinCulpa(self):
        estadoSinCulpa = False

        if self.obtener_estado() in ("MA", "NJ", "NY", "PA"):
            estadoSinCulpa = True

        return estadoSinCulpa


poliza_auto = PolizaAuto(123456, "Toyota Corolla", "MA")

print(poliza_auto.estadoSinCulpa())
