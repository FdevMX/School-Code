import numpy as np # pip install numpy
import threading # pip install threading

# Función para aplicar una operación a un conjunto de elementos de la matriz
def operacion_en_paralelo(matriz, inicio, fin):
    for i in range(inicio, fin):
        # Realizar alguna operación en el elemento matriz[i]
        matriz[i] *= 2  # Ejemplo: duplicar el valor del elemento

# Función principal
def main():
    # Crear una matriz de ejemplo
    matriz = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

    # Definir la cantidad de hilos (threads) para la paralelización
    num_hilos = 2  # Puedes ajustar esto según tu CPU y la cantidad de elementos

    # Calcular el tamaño de la porción de la matriz para cada hilo
    tamaño_porcion = len(matriz) // num_hilos

    # Crear una lista de hilos
    hilos = []

    # Iniciar los hilos
    for i in range(num_hilos):
        inicio = i * tamaño_porcion
        fin = (i + 1) * tamaño_porcion if i < num_hilos - 1 else len(matriz)
        hilo = threading.Thread(target=operacion_en_paralelo, args=(matriz, inicio, fin))
        hilos.append(hilo)
        hilo.start()

    # Esperar a que todos los hilos terminen
    for hilo in hilos:
        hilo.join()

    # Mostrar el resultado
    print("Matriz después de la operación en paralelo:")
    print(matriz)

if __name__ == "__main__":
    main()
