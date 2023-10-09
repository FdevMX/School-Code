# Programacion Distribuida y en Paralelo
# Sesion: 25 de Septiembre del 2023
# Codificacion de Clases y Objetos en Python
# Archivo "hilos7.py"
# Identificador: 
# Alfredo Lopez Mendez


import threading

# Función para sumar elementos en una lista
def sumar_elementos(lista, resultado_parcial, indice_inicio, indice_fin, i):
    suma_parcial = sum(lista[indice_inicio:indice_fin])
    resultado_parcial[i] = suma_parcial

# Lista grande de números
lista_numeros = list(range(1, 10001))

# Número de hilos a utilizar
num_hilos = 4
resultado_parcial = [0] * num_hilos
hilos = []

# Dividir la lista en partes iguales y crear hilos
for i in range(num_hilos):
    inicio = int(i * len(lista_numeros) / num_hilos)
    fin = int((i + 1) * len(lista_numeros) / num_hilos)
    print("inicio ",inicio," ",lista_numeros[inicio]," fin ",fin," ")
    hilo = threading.Thread(target=sumar_elementos, args=(lista_numeros, resultado_parcial, inicio, fin,i))
    hilos.append(hilo)

# Iniciar los hilos
for hilo in hilos:
    hilo.start()

# Esperar a que todos los hilos terminen
for hilo in hilos:
    hilo.join()

# Sumar los resultados parciales para obtener la suma total
print(resultado_parcial)
suma_total = sum(resultado_parcial)
print("La suma total de los elementos en la lista es:", suma_total)
print(sum(lista_numeros[0:10000]))