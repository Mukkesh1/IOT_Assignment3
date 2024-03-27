import paho.mqtt.client as mqtt
import random
import time

mqtt_username = "PQkWKAsbOzMXPTkVDjsDFCw"
mqtt_password = "q1OHgnEFCV0IoFGY/tkT/m9t"
mqtt_client_id = "PQkWKAsbOzMXPTkVDjsDFCw"
channel_id = "2483177"
write_api_key = "WP9SEAZENHZGU3RU"
mqtt_host = "mqtt3.thingspeak.com"
topic = f"channels/{channel_id}/publish"

# Sensor Value Ranges
temperature_range = (-50, 50)
humidity_range = (0, 100)
co2_range = (300, 2000)

# Function for generating random sensor data
def generate_sensor_data():
    temperature = random.uniform(*temperature_range)
    humidity = random.uniform(*humidity_range)
    co2 = random.uniform(*co2_range)
    return temperature, humidity, co2


def on_connect(client, userdata, flags, rc, properties=None):
    if rc == 0:
        print("Connected to MQTT Broker!")
    else:
        print("Failed to connect, return code %d\n", rc)

# Function to create and configure the MQTT client
def create_mqtt_client():
    client = mqtt.Client(mqtt_client_id)
    client.username_pw_set(username=mqtt_username, password=mqtt_password)
    client.on_connect = on_connect
    client.connect(mqtt_host, port=1883, keepalive=60)
    return client

# Function to publish sensor data
def publish_sensor_data(client, temperature, humidity, co2):
    payload = f"field1={temperature}&field2={humidity}&field3={co2}"
    client.publish(topic, payload)


def main():
    client = create_mqtt_client()
    client.loop_start() 
    try:
        while True:
            temperature, humidity, co2 = generate_sensor_data()
            publish_sensor_data(client, temperature, humidity, co2)
            print(f"Published data - Temperature: {temperature:.2f}, Humidity: {humidity:.2f}, CO2: {co2:.2f}")
            time.sleep(20)  
    except KeyboardInterrupt:
        print("Sensor simulation stopped")
        client.loop_stop() 
main()
