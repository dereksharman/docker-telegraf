FROM ubuntu:14.04
MAINTAINER Canadian Tire Innovations

RUN apt-get update && apt-get install -y wget
RUN wget http://get.influxdb.org/telegraf/telegraf_0.11.1-1_amd64.deb
RUN sudo dpkg -i telegraf_0.11.1-1_amd64.deb

COPY telegraf.conf /etc/telegraf/telegraf.conf

CMD [ "telegraf", "-config", "/etc/telegraf/telegraf.conf" ]
