import network
import time
from machine import Pin
import dht
import ujson
from umqtt.simple import MQTTClient

# MQTT Server Parameters
MQTT_CLIENT_ID = "micropython-weather-demo"
MQTT_BROKER = "broker.mqttdashboard.com"
MQTT_USER = ""
MQTT_PASSWORD = ""
MQTT_TOPIC = "wokwi-clima"

sensor = dht.DHT22(Pin(15))

print("Conectando a WiFi", end="")
sta_if = network.WLAN(network.STA_IF)
sta_if.active(True)
sta_if.connect('Wokwi-GUEST', '')
while not sta_if.isconnected():
    print(".", end="")
    time.sleep(0.1)
print(" Conectado!")

print("Conectando al servidor MQTT... ", end="")
client = MQTTClient(MQTT_CLIENT_ID, MQTT_BROKER, user=MQTT_USER, password=MQTT_PASSWORD)
client.connect()
print("Conectado!")

prev_weather = ""

while True:
    print("Midiendo condiciones del clima... ", end="")
    sensor.measure()
    message = ujson.dumps({
        "temperatura": sensor.temperature(),
        "humedad": sensor.humidity(),
    })
    if message != prev_weather:
        print("Actualizado!")
        print("Reportando para el tópico MQTT : {}".format(MQTT_TOPIC))
        client.publish(MQTT_TOPIC, message)
        prev_weather = message
    else:
        print("Sin cambios")
    time.sleep(1)
