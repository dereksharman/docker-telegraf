# docker-telegraf
Docker image for Telegraf to collect metrics from Docker host and report them to InfluxDB or Kafka

## Environment Variables

### Agent:
```
TELEGRAF_AGENT_INTERVAL:                The URL of the Docker host                      Optional
TELEGRAF_AGENT_HOSTNAME:	            Hostname                                        Optional
TELEGRAF_CONFIG_PATH:                   Predefined config to use                        Optional
```

### Docker
```
TELEGRAF_INPUTS_DOCKER_ENDPOINT:        Docker host API endpoint                        Required
TELEGRAF_INPUTS_DOCKER_TLS_ENABLED:     To collect metrics from a TLS-enabled daemon    Optional
TELEGRAF_INPUTS_DOCKER_TLS_CA:          Path to CA file                                 Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_TLS_CERT:        Path to cert file                               Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_TLS_KEY:         Path to cert key file                           Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_CONTAINERS:      Only collect metrics for these containers       Optional (collect all if not defined)
```

### InfluxDB
```
TELEGRAF_OUTPUTS_INFLUXDB_ENABLED:      Enables InfluxDB output                         Optional
TELEGRAF_OUTPUTS_INFLUXDB_URLS:         The endpoint for the InfluxDB instance          Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_INFLUXDB_DATABASE:     The target database for metrics                 Optional (required if InfluxDB output enabled)
```

### Kafka
```
TELEGRAF_OUTPUTS_KAFKA_ENABLED:         Enables Kafka output                            Optional
TELEGRAF_OUTPUTS_KAFKA_BROKERS:         URLs of Kafka brokers                           Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_KAFKA_TOPIC:           Kafka topic for producer messages               Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_KAFKA_TAG:             Telegraf tag to use as a routing key            Optional (required if InfluxDB output enabled)
```
