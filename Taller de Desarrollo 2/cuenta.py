class Cuenta:

    def __init__(self, nombre, saldo):
        self.nombre = nombre
        if saldo > 0:
            self.saldo = saldo
        else:
            self.saldo = 0

    def depositar(self, montoDeposito):
        if montoDeposito > 0:
            self.saldo += montoDeposito

    def obtenerSaldo(self):
        return self.saldo

    def establecerNombre(self, nombre):
        self.nombre = nombre

    def obtenerNombre(self):
        return self.nombre


cuenta = Cuenta("Alfredo Lopez", 4000)

print(cuenta.obtenerSaldo())

cuenta.depositar(500)

print(cuenta.obtenerSaldo())
