#!/usr/bin/env bash
set -e

TELEGRAF_CONFIG_PATH=$1

cat <<EOT > $TELEGRAF_CONFIG_PATH
# Telegraf configuration

EOT

echo "Configuring telegraf..."

$TELEGRAF_PATH/append-agent-config.sh $TELEGRAF_CONFIG_PATH
$TELEGRAF_PATH/append-input-config.sh $TELEGRAF_CONFIG_PATH

if [ "$TELEGRAF_OUTPUTS_INFLUXDB_ENABLED" == "true" ]; then
    $TELEGRAF_PATH/append-output-influxdb-config.sh $TELEGRAF_CONFIG_PATH
fi

if [ "$TELEGRAF_OUTPUTS_KAFKA_ENABLED" == "true" ]; then
    $TELEGRAF_PATH/append-output-kafka-config.sh $TELEGRAF_CONFIG_PATH
fi
