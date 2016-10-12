#!/usr/bin/python

import urllib2 as url

sensor = BMP085.BMP085()
from gpiozero import LED

led = LED(17)

def check_status():
	myurl="http://52.16.112.87:82/api.php?function=getReading&team=a"
	status=url.urlopen(myurl).read()
	if status == "on":
		led.on()
	elif status == "off":
		led.off()
	else:
		return
