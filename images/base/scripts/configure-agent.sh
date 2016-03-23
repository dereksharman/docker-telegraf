#!/usr/bin/env bash
set -e

if [ -z "$TELEGRAF_COLLECTION_INTERVAL" ]; then
    TELEGRAF_COLLECTION_INTERVAL=1m
fi

cat <<EOT > $TELEGRAF_CONFIG_FILE

[agent]
  interval = "$TELEGRAF_COLLECTION_INTERVAL"
  round_interval = true
  metric_buffer_limit = 1000
  flush_buffer_when_full = true
  collection_jitter = "0s"
  flush_interval = "$TELEGRAF_COLLECTION_INTERVAL"
  flush_jitter = "0s"
  debug = false
  quiet = false
  hostname = "$TELEGRAF_HOSTNAME"

EOT
