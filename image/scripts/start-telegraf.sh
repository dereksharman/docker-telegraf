#!/usr/bin/env bash
set -e

if [ -z "$TELEGRAF_CONFIG_PATH" ]; then
    TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
    $TELEGRAF_PATH/configure-telegraf.sh $TELEGRAF_CONFIG_PATH
else
    echo "Using predefined config file: $TELEGRAF_CONFIG_PATH"
fi

$TELEGRAF_PATH/telegraf -config $TELEGRAF_CONFIG_PATH
