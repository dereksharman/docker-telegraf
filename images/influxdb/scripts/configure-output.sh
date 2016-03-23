#!/usr/bin/env bash
set -e

if [ -z "$TELEGRAF_INFLUXDB_URLS" ]; then
    echo "TELEGRAF_INFLUXDB_URLS must be configured"
    exit 254
fi

if [ -z "$TELEGRAF_INFLUXDB_DATABASE" ]; then
    TELEGRAF_INFLUXDB_DATABASE=telegraf
fi

cat <<EOT >> $TELEGRAF_CONFIG_FILE

[[outputs.influxdb]]
  urls = [$TELEGRAF_INFLUXDB_URLS]
  database = "$TELEGRAF_INFLUXDB_DATABASE"
  retention_policy = "default"
  precision = "s"
  timeout = "5s"

  # username = "telegraf"
  # password = "metricsmetricsmetricsmetrics"
  ## Set the user agent for HTTP POSTs (can be useful for log differentiation)
  # user_agent = "telegraf"
  ## Set UDP payload size, defaults to InfluxDB UDP Client default (512 bytes)
  # udp_payload = 512

  ## Optional SSL Config
  # ssl_ca = "/etc/telegraf/ca.pem"
  # ssl_cert = "/etc/telegraf/cert.pem"
  # ssl_key = "/etc/telegraf/key.pem"
  ## Use SSL but skip chain & host verification
  # insecure_skip_verify = false

EOT
