
import RPi.GPIO as GPIO
import re
import time
import argparse

from luma.led_matrix.device import max7219
from luma.core.interface.serial import spi, noop
from luma.core.render import canvas
from luma.core.virtual import viewport
from luma.core.legacy import text, show_message
from flask import Flask, jsonify
from luma.core.legacy.font import proportional, CP437_FONT, TINY_FONT, SINCLAIR_FONT, LCD_FONT
app = Flask(__name__)
relay = 18
lockingSensor = 27
goodsSensor = 22

@app.route('/registlock')
def registlock():
    try:
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(relay, GPIO.OUT)
        GPIO.setup(lockingSensor, GPIO.IN)
        GPIO.setup(goodsSensor, GPIO.IN)
        GPIO.output(relay, GPIO.HIGH)

        time.sleep(10)
        while True:
            time.sleep(0.2)

            if GPIO.input(goodsSensor):
                if not GPIO.input(lockingSensor):
                    GPIO.output(relay, GPIO.LOW)
                    return jsonify({"result": True})
                    break

    except KeyboardInterrupt:
        GPIO.cleanup()
        return jsonify({"result": False})
    finally:
        GPIO.cleanup()


@app.route('/receivelock')
def receivelock():
    try:
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(relay, GPIO.OUT)
        GPIO.setup(lockingSensor, GPIO.IN)
        GPIO.setup(goodsSensor, GPIO.IN)
        GPIO.output(relay, GPIO.HIGH)

        time.sleep(10)
        while True:
            time.sleep(0.2)

            if not GPIO.input(goodsSensor):
                if not GPIO.input(lockingSensor):
                    GPIO.output(relay, GPIO.LOW)
                    return jsonify({"result": True})
                    break

    except KeyboardInterrupt:
        GPIO.cleanup()
        return jsonify({"result": False})
    finally:
        GPIO.cleanup()


@app.route('/matrix/<price>')
def matrix(price):
    serial = spi(port=0, device=0, gpio=noop())
    device = max7219(serial, width=32, height=8, block_orientation=90)

    with canvas(device) as draw:
        # 숫자 하나당 4
        digits = len(price) * 4
        text(draw, (32 - digits, 0), price, fill="white", font=TINY_FONT)
    return jsonify({"result" : True})


if __name__ == '__main__':
    app.run(debug=True, port=80, host='0.0.0.0')

