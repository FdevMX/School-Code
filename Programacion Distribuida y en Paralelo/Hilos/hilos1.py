# PRACTICA01.PY
# NOMBRE:  Alfredo Lopez Mendez
# FECHA:  27 de Septiembre de 2023
# HORA: 08:00 A.M

## ## Para usar hilos, necesitas importar Thread utilizando el siguiente código:
from threading import Thread

## ## También usamos la función sleep para hacer que el hilo "duerma"
from time import sleep

##  ## Para crear un hilo en Python, debes hacer que tu clase funcione como un hilo.
##  ## Para ello, debes heredar tu clase de la clase Thread.
class CookBook(Thread):
    def __init__(self):
        Thread.__init__(self)
        self.message = "Hello Parallel Python !!\n"

    ## ## Este método imprime solo el mensaje
    def print_message(self):
        print (self.message)

    ## ## El método run imprime el mensaje diez veces
    def run(self):
        print ("Thread Starting\n")
        x=0
        while (x < 10):
            self.print_message()
            sleep(2)
            x += 1
        print ("Thread Ended\n")

# # Inicia el proceso principal
print ("Process Started")
# # Crea una instancia de la clase LibroDeCocina
hello_Python = CookBook()
# # Imprime el mensaje...iniciando el hilo
hello_Python.start()
# # Finaliza el proceso principal
print ("Process Ended")











from threading import Thread
from time import sleep

class CookBook(Thread):
    def __init__(self):
        Thread.__init__(self)
        self.message = "Hello Parallel Python !!\n"

    def print_message(self):
        print (self.message)

    def run(self):
        print ("Thread Starting\n")
        x=0
        while (x < 10):
            self.print_message()
            sleep(2)
            x += 1
        print ("Thread Ended\n")

print ("Process Started")
hello_Python = CookBook()
hello_Python.start()
print ("Process Ended")



public class Hilo extends Thread {

    public Hilo(String nombre) {
        super(nombre);
    }

    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteración " + (i + 1) + " de " + getName());
        }
        System.out.println("Termina el " + getName());
    }

    public static void main(String[] args) {
        new Hilo("Primer hilo").start();
        new Hilo("Segundo hilo").start();
        System.out.println("Termina el hilo principal");
    }
}





