#!/usr/bin/python

#import logging
#logging.basicConfig(level=logging.DEBUG)

import Adafruit_BMP.BMP085 as BMP085
import urllib2 as url
import sys

sensor = BMP085.BMP085()

def upload(type):
	if type == "temperature":
		value = sensor.read_temperature()
	elif type == "pressure":
		value = sensor.read_pressure()
	else:
		print("type:" + type + " not supported!")
		return
	myurl="http://52.16.112.87/api.php?function=addReading&type=" + type + "&value=" + str(value)
	output=url.urlopen(myurl).read()
	#print(output)

upload("temperature")
upload("pressure")
