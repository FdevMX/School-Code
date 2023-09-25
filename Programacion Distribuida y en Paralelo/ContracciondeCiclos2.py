import numpy as np
import threading

def operacion_en_paralelo(matriz, inicio, fin):
    for i in range(inicio, fin):
        matriz[i] *= 2

def main():
    matriz = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    num_hilos = 2
    tamaño_porcion = len(matriz) // num_hilos
    hilos = []
    
    for i in range(num_hilos):
        inicio = i * tamaño_porcion
        fin = (i + 1) * tamaño_porcion if i < num_hilos - 1 else len(matriz)
        hilo = threading.Thread(target=operacion_en_paralelo, args=(matriz, inicio, fin))
        hilos.append(hilo)
        hilo.start()

    for hilo in hilos:
        hilo.join()

    print("Matriz después de la operación en paralelo:")
    print(matriz)
    
if __name__ == "__main__":
    main()
