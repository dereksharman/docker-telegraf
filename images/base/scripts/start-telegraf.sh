#!/usr/bin/env bash
set -e

export TELEGRAF_CONFIG_FILE=$TELEGRAF_PATH/telegraf.conf

CONFIGURE_AGENT=$TELEGRAF_PATH/configure-agent.sh
CONFIGURE_INPUT=$TELEGRAF_PATH/configure-input.sh
CONFIGURE_OUTPUT=$TELEGRAF_PATH/configure-output.sh

if [ ! -f $CONFIGURE_AGENT ]; then
    echo "Agent configuration file not found: $CONFIGURE_AGENT"
    exit 255
fi

if [ ! -f $CONFIGURE_INPUT ]; then
    echo "Input configuration file not found: $CONFIGURE_INPUT"
    exit 255
fi

if [ ! -f $CONFIGURE_OUTPUT ]; then
    echo "Output configuration file not found: $CONFIGURE_OUTPUT"
    exit 255
fi

$CONFIGURE_AGENT
$CONFIGURE_INPUT
$CONFIGURE_OUTPUT

cat $TELEGRAF_CONFIG_FILE

$TELEGRAF_PATH/telegraf -config $TELEGRAF_PATH/telegraf.conf
