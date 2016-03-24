#!/usr/bin/env bash
set -e

TELEGRAF_CONFIG_PATH=$1

if [ -z "$TELEGRAF_OUTPUTS_INFLUXDB_URLS" ]; then
    echo "TELEGRAF_OUTPUTS_INFLUXDB_URLS must be configured"
    exit 254
fi

if [ -z "$TELEGRAF_OUTPUTS_INFLUXDB_DATABASE" ]; then
    TELEGRAF_OUTPUTS_INFLUXDB_DATABASE=telegraf
fi

cat <<EOT >> $TELEGRAF_CONFIG_PATH

[[outputs.influxdb]]

  ## The full HTTP or UDP endpoint URL for your InfluxDB instance.
  ## Multiple urls can be specified as part of the same cluster,
  ## this means that only ONE of the urls will be written to each interval.
  # urls = ["udp://localhost:8089"] # UDP endpoint example
  urls = [$TELEGRAF_OUTPUTS_INFLUXDB_URLS]

  ## The target database for metrics (telegraf will create it if not exists).
  database = "$TELEGRAF_OUTPUTS_INFLUXDB_DATABASE"

  ## Retention policy to write to.
  retention_policy = "default"

  ## Precision of writes, valid values are "ns", "us" (or "µs"), "ms", "s", "m", "h".
  ## note: using "s" precision greatly improves InfluxDB compression.
  precision = "s"

  ## Write timeout (for the InfluxDB client), formatted as a string.
  ## If not provided, will default to 5s. 0s means no timeout (not recommended).
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
