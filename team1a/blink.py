#!/usr/bin/python

from gpiozero import LED
from time import sleep
import sys

sleeptime=float(sys.argv[1])

led = LED(17)

while True:
    led.on()
    sleep(sleeptime)
    led.off()
    sleep(sleeptime)
