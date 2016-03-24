#!/usr/bin/env bash
set -e

export TELEGRAF_CONFIG_FILE=$TELEGRAF_PATH/telegraf.conf

if [ -z "$TELEGRAF_EXTERNAL_CONFIG" ]; then
    echo "Configuring Telegraf..."
    $TELEGRAF_PATH/create-config-file.sh &&
        $TELEGRAF_PATH/append-agent-config.sh &&
        $TELEGRAF_PATH/append-input-config.sh

    if [ "$TELEGRAF_INFLUXDB_OUTPUT_ENABLED" == "true" ]; then
        $TELEGRAF_PATH/append-output-influxdb-config.sh
    fi

    if [ "$TELEGRAF_KAFKA_OUTPUT_ENABLED" == "true" ]; then
        $TELEGRAF_PATH/append-output-kafka-config.sh
    fi
else
    echo "Using external config file: $TELEGRAF_EXTERNAL_CONFIG"
    TELEGRAF_CONFIG_FILE=$TELEGRAF_EXTERNAL_CONFIG
fi

cat $TELEGRAF_CONFIG_FILE

$TELEGRAF_PATH/telegraf -config $TELEGRAF_CONFIG_FILE
