#!/usr/bin/env bash
set -e

if [ -z "$TELEGRAF_COLLECTION_INTERVAL" ]; then
    TELEGRAF_COLLECTION_INTERVAL=1m
fi

cat <<EOT > $TELEGRAF_CONFIG_FILE

[agent]

  ## Default data collection interval for all inputs
  interval = "$TELEGRAF_COLLECTION_INTERVAL"

  ## Rounds collection interval to 'interval'
  ## ie, if interval="10s" then always collect on :00, :10, :20, etc.
  round_interval = true

  ## Telegraf will cache metric_buffer_limit metrics for each output, and will
  ## flush this buffer on a successful write.
  metric_buffer_limit = 1000

  ## Flush the buffer whenever full, regardless of flush_interval.
  flush_buffer_when_full = true

  ## Collection jitter is used to jitter the collection by a random amount.
  ## Each plugin will sleep for a random time within jitter before collecting.
  ## This can be used to avoid many plugins querying things like sysfs at the
  ## same time, which can have a measurable effect on the system.
  collection_jitter = "0s"

  ## Default flushing interval for all outputs. You shouldn't set this below
  ## interval. Maximum flush_interval will be flush_interval + flush_jitter
  flush_interval = "$TELEGRAF_COLLECTION_INTERVAL"

  ## Jitter the flush interval by a random amount. This is primarily to avoid
  ## large write spikes for users running a large number of telegraf instances.
  ## ie, a jitter of 5s and interval 10s means flushes will happen every 10-15s
  flush_jitter = "0s"

  ## Run telegraf in debug mode
  debug = false

  ## Run telegraf in quiet mode
  quiet = false

  ## Override default hostname, if empty use os.Hostname()
  hostname = "$TELEGRAF_HOSTNAME"

EOT
