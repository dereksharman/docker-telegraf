#!/usr/bin/env bash
set -e

if [ -z "$TELEGRAF_DOCKER_ENDPOINT" ]; then
    echo "TELEGRAF_DOCKER_ENDPOINT must be configured"
    exit 254
fi

if [ -z "$TELEGRAF_DOCKER_TLS_ENABLED" ]; then
    TELEGRAF_DOCKER_TLS_ENABLED=false
fi

cat <<EOT >> $TELEGRAF_CONFIG_FILE

[[inputs.docker]]

  # Docker Endpoint
  #   To use TCP, set endpoint = "tcp://[ip]:[port]"
  #   To use environment variables (ie, docker-machine), set endpoint = "ENV"
  endpoint = "$TELEGRAF_DOCKER_ENDPOINT"

  ## To collect metrics from a TLS-enabled daemon
  tls_enabled = $TELEGRAF_DOCKER_TLS_ENABLED
  tls_ca = "$TELEGRAF_DOCKER_TLS_CA"
  tls_cert = "$TELEGRAF_DOCKER_TLS_CERT"
  tls_key = "$TELEGRAF_DOCKER_TLS_KEY"

  # Only collect metrics for these containers, collect all if empty
  container_names = [$TELEGRAF_DOCKER_CONTAINERS]

EOT
