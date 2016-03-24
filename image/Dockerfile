FROM ubuntu:14.04
MAINTAINER Canadian Tire Innovations

ENV TELEGRAF_PATH /opt/telegraf

COPY telegraf $TELEGRAF_PATH/
COPY scripts/ $TELEGRAF_PATH/

WORKDIR $TELEGRAF_PATH

CMD [ "/opt/telegraf/start-telegraf.sh" ]
