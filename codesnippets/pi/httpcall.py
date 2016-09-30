
defurl="http://google.com/api.php?function=aFunction&type=" + str(reading)

output=url.urlopen(defurl).read()
print(output)