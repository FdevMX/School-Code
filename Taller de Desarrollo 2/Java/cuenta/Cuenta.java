package cuenta;

import java.util.Date;

// La clase Cuenta representa una cuenta bancaria
public class Cuenta {

    private String nombre;
    private double saldo;
    private Date fechaApertura;

    // Constructor de la clase Cuenta
    public Cuenta(String nombre, double saldoInicial) {
        if (nombre == null || nombre.isEmpty()) {
            throw new IllegalArgumentException("El nombre de la cuenta no debe estar vacío");
        }
        if (saldoInicial < 0.0) {
            throw new IllegalArgumentException("El saldo no debe ser negativo");
        }
        
        this.nombre = nombre;
        this.saldo = saldoInicial;
        this.fechaApertura = new Date();
    }

    // Método para depositar dinero en la cuenta
    public void depositar(double montoDeposito) {
        if (montoDeposito <= 0.0) {
            throw new IllegalArgumentException("El monto de depósito debe ser mayor que cero");
        }
        saldo += montoDeposito;
    }

    // Método para retirar dinero de la cuenta
    public void retirar(double montoRetiro) {
        if (montoRetiro <= 0.0) {
            throw new IllegalArgumentException("El monto de retiro debe ser mayor que cero");
        }
        if (saldo < montoRetiro) {
            throw new IllegalArgumentException("No hay suficiente saldo para realizar el retiro");
        }
        saldo -= montoRetiro;
    }

    // Método para verificar si la cuenta está vacía
    public boolean estaVacia() {
        return saldo == 0.0;
    }

    // Método para obtener la fecha de apertura de la cuenta
    public Date obtenerFechaApertura() {
        return fechaApertura;
    }

    // Método toString para obtener una representación en cadena de la cuenta
    @Override
    public String toString() {
        return "Cuenta [nombre=" + nombre + ", saldo=" + saldo + ", fechaApertura=" + fechaApertura + "]";
    }

    // Getters y setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSaldo() {
        return saldo;
    }
}
