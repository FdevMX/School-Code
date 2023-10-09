# Programacion Distribuida y en Paralelo
# Sesion: 25 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "hilos8.py"
# Identificador: # Escribe un programa en python que utilice tres hilos para contar desde 1 hasta un numero especifico con incrementos de 1, 2 y 3 respectivamente. Cada hilo debe imprimir los numeros que cuenta su identificador de hilo.
# Alfredo Lopez Mendez

import threading

def contar(incremento, limite):
    for i in range(1, limite + 1, incremento):
        print(f"Hilo {threading.current_thread().name} - {threading.current_thread().ident}: {i}")

# Número hasta el cual contar
limite = 20

# Crear hilos con diferentes incrementos
hilo1 = threading.Thread(target=contar, args=(1, limite))
hilo2 = threading.Thread(target=contar, args=(2, limite))
hilo3 = threading.Thread(target=contar, args=(3, limite))

# Iniciar los hilos
hilo1.start()
hilo2.start()
hilo3.start()

# Esperar a que todos los hilos terminen
hilo1.join()
hilo2.join()
hilo3.join()

print("Conteo completado.")