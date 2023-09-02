package cuenta;

public class Main {
    public static void main(String[] args) {
        // Crear una cuenta de ahorros con saldo inicial de 1000.0
        Cuenta cuenta = new Cuenta("Cuenta de ahorros", 1000.0);

        // Mostrar información de la cuenta
        System.out.println("Nombre de la cuenta: " + cuenta.getNombre());
        System.out.println("Saldo de la cuenta: " + cuenta.getSaldo());
        System.out.println("Fecha de apertura: " + cuenta.obtenerFechaApertura());

        // Realizar un depósito de 500.0
        cuenta.depositar(500.0);

        // Realizar un retiro de 200.0
        cuenta.retirar(200.0);

        // Mostrar el saldo actual
        System.out.println("Saldo actual: " + cuenta.getSaldo());
    }
}
