#!/usr/bin/env bash
set -e

TELEGRAF_CONFIG_PATH=$1

if [ -z "$TELEGRAF_OUTPUTS_KAFKA_BROKERS" ]; then
    echo "TELEGRAF_OUTPUTS_KAFKA_BROKERS must be configured"
    exit 254
fi

if [ -z "$TELEGRAF_KAFKA_TOPIC" ]; then
    TELEGRAF_KAFKA_TOPIC=telegraf
fi

cat <<EOT >> $TELEGRAF_CONFIG_PATH

[[outputs.kafka]]

  ## URLs of kafka brokers
  brokers = [$TELEGRAF_OUTPUTS_KAFKA_BROKERS]
  ## Kafka topic for producer messages
  topic = "$TELEGRAF_OUTPUTS_KAFKA_TOPIC"
  ## Telegraf tag to use as a routing key
  ##  ie, if this tag exists, it's value will be used as the routing key
  routing_tag = "$TELEGRAF_OUTPUTS_KAFKA_TAG"

  ## Optional SSL Config
  # ssl_ca = "/etc/telegraf/ca.pem"
  # ssl_cert = "/etc/telegraf/cert.pem"
  # ssl_key = "/etc/telegraf/key.pem"
  ## Use SSL but skip chain & host verification
  # insecure_skip_verify = false

  ## Data format to output. This can be "influx" or "graphite"
  ## Each data format has it's own unique set of configuration options, read
  ## more about them here:
  ## https://github.com/influxdata/telegraf/blob/master/docs/DATA_FORMATS_OUTPUT.md
  data_format = "influx"

EOT
