# Programacion Distribuida y en Paralelo
# Sesion: 25 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "hilos9.py"
# Identificador: Escribe un programa en python que implemente el problema del productor-consumidor utilizando hilos. Hay un productor que produce elementos y los coloca en un bufer, y hay varios consumidores que toman elementos del bufer. Si el bufer esta lleno el productor debe esperar a que se consuman algunos elementos antes de agregar  mas al bufer.
# Alfredo Lopez Mendez


import threading
import time
import random

bufer = []
MAX_SIZE = 10
mutex = threading.Semaphore(1)
items = threading.Semaphore(0)
spaces = threading.Semaphore(MAX_SIZE)

# productor
def productor():
    while True:
        time.sleep(random.random()) # Espera aleatoria
        item = random.randint(1, 100) # Generar un elemento aleatorio
        spaces.acquire() # Espacio disponible en el búfer
        mutex.acquire() # Acceso al búfer
        bufer.append(item) # Agregar elemento al búfer
        print(f"Productor ha producido el elemento {item}")
        mutex.release()
        items.release() # Indicar que hay elementos disponibles

def consumidor(id):
    while True:
        items.acquire() # Esperar a que haya elementos disponibles
        mutex.acquire() # Acceso al búfer
        item = bufer.pop(0) # Tomar el primer elemento del búfer
        print(f"Consumidor {id} ha consumido el elemento {item}")
        mutex.release()
        spaces.release() # Liberar espacio en el búfer

# Crear y ejecutar hilos
productor_thread = threading.Thread(target=productor)
productor_thread.start()

consumidores = []
for i in range(5):
    consumidor_thread = threading.Thread(target=consumidor, args=(i+1,))
    consumidor_thread.start()
    consumidores.append(consumidor_thread)

# Esperar a que todos los hilos terminen
productor_thread.join()
for consumidor_thread in consumidores:
    consumidor_thread.join()
