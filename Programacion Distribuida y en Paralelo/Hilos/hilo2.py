# Programacion Distribuida y en Paralelo
# Sesion: 29 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "Hilos2.py"
# Identificador: Introduccion a Hilos
# Alfredo Lopez Mendez

import threading

def function(i):
    print ("function called by thread %i\n" %i)
    return

threads = []

for i in range(5):
    t = threading.Thread(target=function , args=(i,))
    threads.append(t)
    t.start()
    t.join()
    
