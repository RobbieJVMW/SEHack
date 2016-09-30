
desiredtype=sys.argv[1]
if desiredtype == "temperature":
        sensorreading=sensor.read_temperature()
elif desiredtype == "pressure":
        sensorreading=sensor.read_pressure()
else:
        sensorreading=sensor.read_temperature
        desiredtype="temperature"