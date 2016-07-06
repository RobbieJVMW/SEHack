import Adafruit_BMP.BMP085 as BMP085
import urllib2 as url
import sys


sensor = BMP085.BMP085()

type=sys.argv[1]
if type == "temperature":
        reading=sensor.read_temperature()
elif type == "pressure":
        reading=sensor.read_pressure()
else:
        reading=sensor.read_temperature
        type="temperature"


print ("Reading: " + str(reading))
print ("Type: " + str(type))


defurl="http://52.50.60.213/api.php?function=addReading&type=" + type + "&value=" + str(reading)

output=url.urlopen(defurl).read()
print(output)



