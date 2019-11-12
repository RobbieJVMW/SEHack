FROM balenalib/rpi-raspbian


RUN apt-get update \
    &&  apt-get -qy install \
	curl ca-certificates \
	python python-pip python-rpi.gpio \
        python-dev git python-smbus git build-essential python-dev python-smbus python-setuptools \
	gcc make \
	i2c-tools \
    &&  apt-get -y autoremove \
    &&  apt-get -y clean \
    &&  apt-get -y purge \
    &&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN cd /home; git clone https://github.com/adafruit/Adafruit_Python_BMP.git

RUN cd /home/Adafruit_Python_BMP; sudo python setup.py install
RUN cd /home/; mv Adafruit_Python_BMP/examples/simpletest.py /home/
RUN cd /home/; rm -rf Adafruit_Python_BMP

CMD ["/bin/bash"]